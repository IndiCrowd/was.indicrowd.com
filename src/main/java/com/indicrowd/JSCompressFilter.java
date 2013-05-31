package com.indicrowd;

import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mozilla.javascript.ErrorReporter;
import org.mozilla.javascript.EvaluatorException;

import com.yahoo.platform.yui.compressor.JavaScriptCompressor;

public class JSCompressFilter implements Filter {

	private long lastDate = new Date().getTime();
	private HashMap<String, String> jsMap = new HashMap<String, String>();

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// not use.
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		if (jsMap.get(request.getServletPath()) == null) {

			FileReader fileReader = new FileReader(request.getRealPath(request.getServletPath()));

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

		if (request.getDateHeader("if-none-match") == lastDate) {
			response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
		} else {
			response.setDateHeader("ETag", lastDate);
			response.getWriter().write(jsMap.get(request.getServletPath()));
		}
	}

	@Override
	public void destroy() {
		// not use.
	}

}
