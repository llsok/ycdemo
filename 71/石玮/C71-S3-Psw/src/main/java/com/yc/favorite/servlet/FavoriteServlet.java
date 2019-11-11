package com.yc.favorite.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet("/fav.do")
public class FavoriteServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

    public void toAdd(HttpServletRequest request,HttpServletResponse response) throws IOException {
    	
    	response.sendRedirect("add.jsp");
    	
    	
    }

}
