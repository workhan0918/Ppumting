package com.ppumting.pm80.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ppumting.pm80.note.service.NoteService;
import com.ppumting.pm80.point.service.PointService;
import com.ppumting.pm80.user.domain.User;
import com.ppumting.pm80.user.service.Userservice;

@WebServlet("/User/mypage/loginout/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Userservice userService;
//	받은 쪽지의 갯수를 확인하기위해 노트서비스 추가
	private NoteService service = NoteService.getInstance();
	private PointService pointService;
	
	public void init() {
		userService = new Userservice();
		pointService = new PointService();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("login.jsp").forward(request,response);
		
		
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String ssn = request.getParameter("ssn");

		List<String> errorMsgs = new ArrayList<>();
		if(name == null || name.length() == 0) {
			errorMsgs.add("이름을 입력해주세요");
		}else if(ssn == null || ssn.length() == 0) {
			errorMsgs.add("주민번호를 입력해주세요");
		}

		RequestDispatcher dispatcher = null;

		if(errorMsgs.size() > 0 ) {
			dispatcher = request.getRequestDispatcher("deleteUser.jsp");
			request.setAttribute("errorMsgs", errorMsgs);
			dispatcher.forward(request, response);
			return;
		}
		
		User user = new User();
		user.setUserId(userId);
		user.setName(name);
		user.setSsn(ssn);
		userService.delete(userId, name, ssn);
		request.setAttribute("user", user);
		dispatcher = request.getRequestDispatcher("../loginout/login");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String pw = request.getParameter("pw");
		
//		받아온 세션의 유저아이디로 받은쪽지의 갯수를 알려주는 서비스 호출
		long countNote = service.countNote(userId);
		String checkPoint = pointService.checkPoint(userId);
		
		if(!userService.login(userId, pw)) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		
		HttpSession session = request.getSession(true);
		session.setAttribute("userId", userId);
		// 쪽지갯수 출력
		session.setAttribute("countNote", countNote);
		session.setAttribute("checkPoint", checkPoint);
		response.sendRedirect("../home");
		return;
	}
}
