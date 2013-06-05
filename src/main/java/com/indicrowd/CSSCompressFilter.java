package com.indicrowd;

import java.io.ByteArrayOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.zip.GZIPOutputStream;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.constructs.web.GenericResponseWrapper;
import net.sf.ehcache.constructs.web.ResponseUtil;

import com.yahoo.platform.yui.compressor.CssCompressor;

public class CSSCompressFilter implements Filter {

	private String etag = Long.toString(new Date().getTime());
	
	private HashMap<String, String> cssMap = new HashMap<String, String>();

	private FilterConfig filterConfig;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		if (cssMap.get(request.getServletPath()) == null) {
			
			try {
				FileReader fileReader = new FileReader(filterConfig.getServletContext().getRealPath(request.getServletPath()));
	
				CssCompressor comp = new CssCompressor(fileReader);
	
				StringWriter sw = new StringWriter();
	
				comp.compress(sw, 0);
	
				cssMap.put(request.getServletPath(), sw.toString());
				
			} catch(Exception e) {
			}
		}
		
		String content = cssMap.get(request.getServletPath());
		
		if (content == null) {
			chain.doFilter(request, response);
		} else {
			
			// Create a gzip stream
	        final ByteArrayOutputStream compressed = new ByteArrayOutputStream();
	        final GZIPOutputStream gzout = new GZIPOutputStream(compressed);
	
	        // Handle the request
	        final GenericResponseWrapper wrapper = new GenericResponseWrapper(response, gzout);
	        wrapper.setDisableFlushBuffer(true);
	
	        wrapper.setContentType("text/css; charset=UTF-8");
	        wrapper.getWriter().write(content);
			
	        wrapper.flush();
	
	        gzout.close();
	
	        // double check one more time before writing out
	        // repsonse might have been committed due to error
	        if (response.isCommitted()) {
	            return;
	        }
	        
	        // return on these special cases when content is empty or unchanged
	        switch (wrapper.getStatus()) {
	        case HttpServletResponse.SC_NO_CONTENT:
	        case HttpServletResponse.SC_RESET_CONTENT:
	        case HttpServletResponse.SC_NOT_MODIFIED:
	            return;
	        default:
	        }
	
	
	
	        // Saneness checks
	        byte[] compressedBytes = compressed.toByteArray();
	        boolean shouldGzippedBodyBeZero = ResponseUtil.shouldGzippedBodyBeZero(compressedBytes, request);
	        boolean shouldBodyBeZero = ResponseUtil.shouldBodyBeZero(request, wrapper.getStatus());
	        if (shouldGzippedBodyBeZero || shouldBodyBeZero) {
	            // No reason to add GZIP headers or write body if no content was written or status code specifies no
	            // content
	            response.setContentLength(0);
	            return;
	        }
	
	        // Write the zipped body
	        ResponseUtil.addGzipHeader(response);
	        
	        if (request.getHeader("if-none-match") != null && request.getHeader("if-none-match").equals(etag)) {
				response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
			} else {
				response.setHeader("ETag", etag);
		        response.setContentLength(compressedBytes.length);
		        response.getOutputStream().write(compressedBytes);
			}
		}
	}

	@Override
	public void destroy() {
		// not use.
	}

}
