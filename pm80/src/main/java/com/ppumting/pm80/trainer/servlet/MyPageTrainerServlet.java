package com.ppumting.pm80.trainer.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ppumting.pm80.point.service.PointService;
import com.ppumting.pm80.trainer.service.TrainerService;

@WebServlet("/Trainer/mypage")
public class MyPageTrainerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PointService pointService; 
	
	public void init() {
		new TrainerService();
		pointService = new PointService();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String trainerId = (String)session.getAttribute("trainerId");
		String userId = (String) session.getAttribute("userId");
		if(trainerId == null) {
			request.getRequestDispatcher("/loginout/login.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("mypage.jsp").forward(request, response);
		request.setAttribute("checkPoint", pointService.checkPoint(userId));
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		response.sendRedirect("minusPoint");
	}
	
}
