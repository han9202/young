package com.football.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FreeList extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/board/freelist.jsp");
			dispatcher.forward(request, response);
			
		}
}
