package com.indicrowd;

import java.io.ByteArrayOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;
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

import org.mozilla.javascript.ErrorReporter;
import org.mozilla.javascript.EvaluatorException;

import com.yahoo.platform.yui.compressor.JavaScriptCompressor;

public class JSCompressFilter implements Filter {

	private HashMap<String, String> jsMap = new HashMap<String, String>();

	private FilterConfig filterConfig;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		if (jsMap.get(request.getServletPath()) == null) {

			FileReader fileReader = new FileReader(filterConfig.getServletContext().getRealPath(request.getServletPath()));

			JavaScriptCompressor comp = new JavaScriptCompressor(fileReader, new ErrorReporter() {

				@Override
				public void warning(String arg0, String arg1, int arg2, String arg3, int arg4) {
					// TODO Auto-generated method stub

				}

				@Override
				public EvaluatorException runtimeError(String arg0, String arg1, int arg2, String arg3, int arg4) {
					// TODO Auto-generated method stub
					return null;
				}

				@Override
				public void error(String arg0, String arg1, int arg2, String arg3, int arg4) {
					// TODO Auto-generated method stub

				}
			});

			StringWriter sw = new StringWriter();

			comp.compress(sw, 0, true, true, true, true);

			jsMap.put(request.getServletPath(), sw.toString());
		}

		response.setContentType("application/javascript; charset=UTF-8");
		response.getWriter().write(jsMap.get(request.getServletPath()));
		
		
		//System.out.println("TEST!!!");
		// Create a gzip stream
        final ByteArrayOutputStream compressed = new ByteArrayOutputStream();
        final GZIPOutputStream gzout = new GZIPOutputStream(compressed);

        // Handle the request
        final GenericResponseWrapper wrapper = new GenericResponseWrapper(response, gzout);
        wrapper.setDisableFlushBuffer(true);
        chain.doFilter(request, wrapper);
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

        response.setContentLength(compressedBytes.length);
        
        System.out.println(compressedBytes.length);

        response.getOutputStream().write(compressedBytes);
	}

	@Override
	public void destroy() {
		// not use.
	}

}
