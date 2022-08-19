package com.ppumting.pm80.qna.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ppumting.pm80.qna.domain.Qna;
import com.ppumting.pm80.qna.service.QnaService;

@WebServlet("/Qna/qnaInfo/selectNoQna.do")
public class SelectQnaSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private QnaService service = QnaService.getInstance();

	public SelectQnaSevlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		Qna qnas = new Qna();
		qnas = service.viewQna(request.getParameter("qnaNo"));
		request.setAttribute("qnas", qnas);	// "qnas"(jsp에서 뿌려주는 이름)는 키, qnas는 값
		request.getRequestDispatcher("selectNoQna.jsp").forward(request, response);
	}

}
