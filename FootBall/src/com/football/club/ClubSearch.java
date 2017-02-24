package com.football.club;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ClubSearch extends HttpServlet{
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			//페이징 -> 게시판의 꽃
			int nowpage = 0;			//현재 페이지 번호
			int totalCount = 0;			//총 게시물 수
			int pageSize = 10;			//한페이지에 보여줄 게시물 수
			int totalPage = 0;			//총 몇페이지
			int start = 0, end = 0;		//RNUM 조건에 사용될 범위 지정값
			
			int n = 0, loop = 0;			//페이지바에 사용
			int blockSize = 10;				//바의 최대 갯수
			
			
			String page = request.getParameter("page");
			
			String column = request.getParameter("column");
			String word = request.getParameter("word");
			
			
			
			if (page == null) {
				nowpage = 1; //그냥 들어오면 무조건 첫페이지를 보여주자
			} else {
				nowpage = Integer.parseInt(page);
			}
			
			//nowpage -> start, end 범위 계산
			//1page -> 1 ~ 10
			//2page -> 11 ~ 20
			//..
			//9page -> 91 ~ 100
			start = ((nowpage - 1) * pageSize) + 1;
			end = start + pageSize - 1;
			
			boolean isSearch = false;
			if ((column != null && word != null) &&
					(column != "" && word != "")) {
				isSearch = true;
			}
			ClubDAO dao = new ClubDAO();
			SearchDTO sdto = new SearchDTO();
			sdto.setColumn(column);
			sdto.setWord(word);
			sdto.setSearch(isSearch);
			
			
			//페이징 때문에 추가
			sdto.setStart(start);
			sdto.setEnd(end);
			
			totalCount = dao.getTotal(sdto);
			totalPage = (int)Math.ceil((double)totalCount / pageSize);
			
			//클럽리스트 가져오기
			

			ArrayList<ClubDTO> list = dao.list(sdto);
			
			
			//페이지바 만들기
			String pagebar = "";
			
			/*
			for (int i=1; i<=totalPage; i++) {
				pagebar += String.format(" <a href='/JSPTest/board/list.do?page=%d'>%d</a> ", i, i); 
			}
			*/
			
			
			loop = 1;	//페이지 번호를 만드는 루프 담당
			n = ((nowpage - 1) / blockSize) * blockSize + 1; //페이지 번호 역할(시작 번호)
			
			
			
			
			pagebar += "<nav><ul"
					+ "+.  class='pagination'>";		
			
			
			//이전 10페이지
			/*if (n == 1) {
				pagebar += String.format(" [이전%d페이지] ", blockSize);
			} else {
				pagebar += String.format(" <a href='/JSPTest/board/list.do?page=%d'>[이전%d페이지]</a> ", n - 1,  blockSize);
			}*/
			
			if (n == 1) {
				pagebar += String.format("<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
			} else {
				pagebar += String.format("<li><a href='/FootBall/club/clubsearch.do?page=%d' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>", n - 1);
			}
			
			
			
			/*while (!(loop > blockSize || n > totalPage)) {
				
				//현재 보고 있는 페이지?
				if (n == nowpage) {
					pagebar += String.format(" <a style='font-weight:bold;color:blue;'>%d</a> ", n, n);
				} else {
					pagebar += String.format(" <a href='/JSPTest/board/list.do?page=%d'>%d</a> ", n, n);
				}
				
				n++;
				loop++;
				
			}//페이지 번호 while
	*/		
			
			
			while (!(loop > blockSize || n > totalPage)) {
				
				//현재 보고 있는 페이지?
				if (n == nowpage) {
					pagebar += String.format("<li class='active'><a href='#'>%d</a></li>", n, n);
				} else {
					pagebar += String.format("<li><a href='/FootBall/club/clubsearch.do?page=%d'>%d</a></li>", n, n);
				}
				
				n++;
				loop++;
				
			}//페이지 번호 while
			
			
			
			
			//다음 10페이지
			/*if (n > totalPage) {
				pagebar += String.format(" [다음%d페이지]", blockSize);
			} else {
				pagebar += String.format(" <a href='/JSPTest/board/list.do?page=%d'>[다음%d페이지]</a>", n, blockSize);
			}*/
			
			if (n > totalPage) {
				pagebar += String.format("<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
			} else {
				pagebar += String.format("<li><a href='/FootBall/club/clubsearch.do?page=%d' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>", n);
			}
			
			
			pagebar += "</ul></nav>";
			
			request.setAttribute("list", list);
			request.setAttribute("sdto", sdto);
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("nowpage", nowpage);
			request.setAttribute("pagebar", pagebar);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/club/clubSearch.jsp");
			dispatcher.forward(request, response);
			
		}
}
