package com.yc.http.tomcat.v3;

import java.io.IOException;

public class HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		switch (request.getMethod()) {
		case "GET":
			doGet(request, response);
			break;
		case "POST":
			doPost(request, response);
			break;
		case "PUT":
			doPut(request, response);
			break;
		case "DELETE":
			doDelete(request, response);
			break;
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws IOException {

	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {

	}

}
