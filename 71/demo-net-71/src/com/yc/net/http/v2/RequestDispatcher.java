package com.yc.net.http.v2;

public class RequestDispatcher {

	private String webPath;

	public RequestDispatcher(String webPath) {
		this.webPath = webPath;
	}

	public void forward(HttpServletRequest request, HttpServletResponse response) {
		request.setRequestURL(webPath);
	}

}
