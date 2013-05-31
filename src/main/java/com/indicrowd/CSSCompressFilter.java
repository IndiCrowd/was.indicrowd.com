package com.indicrowd;

import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yahoo.platform.yui.compressor.CssCompressor;

public class CSSCompressFilter implements Filter {

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

			FileReader fileReader = new FileReader(filterConfig.getServletContext().getRealPath(request.getServletPath()));

			CssCompressor comp = new CssCompressor(fileReader);

			StringWriter sw = new StringWriter();

			comp.compress(sw, 0);

			cssMap.put(request.getServletPath(), sw.toString());
		}

		response.setContentType("text/css; charset=UTF-8");
		response.getWriter().write(cssMap.get(request.getServletPath()));
	}

	@Override
	public void destroy() {
		// not use.
	}

}
