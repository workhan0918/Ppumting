# ppumting
 최근들어 1인가구가 늘어나는 추세와 더불어 개인의 건강을 중요시하는 시대가 온것같습니다!
 
 하지만 무엇이든 혼자하면 재미가 없다고 느낄 수 있다고 생각합니다. 
 
 그래서 타지역에서 운동을 같이할 동료나 친구가 없으신 분들을 위해
 
 게시판을 통해 같이 운동하실분들을 매칭하여 운동하실 수 있도록 
 
 도와드리면 어떨까 라는 생각에서 첫 팀 프로젝트를 구상하게 되었습니다.
 
 또한 온라인 P.T 결제 시스템을 적용하여 헬스장 속 빈번한 P.T 유도에서도 벗어나 간편하고 편리하게 사용할 수 있을거같습니다.
 
 
 # 개발 환경
 
 
* 개발 기간 : 2022.07.11 ~ 2022.07.15

* 개발 인원 : 5명 (팀 프로젝트)

* 담당 업무 : 쪽지 기능 구현

* 사용 기술

   * Html5, CSS3, JavaScript
   * Java 11
   * JSP / JSTL
   * Java Servlet
   * MVC Pattern
   * Apache Tomcat 8.5
   * MySQL DataBase 8.0.29

# 구현 내용
 
 * 사용자
   * 회원가입
   * 로그인
   * 정보 수정
   * 회원 탈퇴
 
 * 결제
   * 포인트 충전
   * P.T 결제 ( 포인트 차감 )
 
 * 게시판
   * 게시판 글 쓰기
   * 게시판 글 수정
   * 게시판 글 삭제
  
 * 쪽지 ( 쪽지 기능 )
   * 쪽지 보내기
   * 쪽지 확인
   * 쪽지 삭제
   * 답장
   
 # VIEWS

 
 # 사용자
   
  * 로그인 및 회원가입 화면
     
![image](https://user-images.githubusercontent.com/100820039/187138857-641761c0-b2a8-4251-81ee-65791d36e593.png)
![image](https://user-images.githubusercontent.com/100820039/187138953-0a33e56f-517d-4a09-a347-c3f763345373.png)
   
로그인 후 메인 화면 입니다.
     
![image](https://user-images.githubusercontent.com/100820039/187139430-ecd8e919-0813-43f5-a2ee-88cd2c352cca.png)

상단의 수정 버튼을 눌러 정보를 회원 정보를 수정 및 탈퇴 할 수 있습니다.
![image](https://user-images.githubusercontent.com/100820039/187139751-cdbcc190-862b-413e-8070-410139306168.png)
     
# 포인트 충전
 상단의 포인트 충전 버튼을 눌러 금액을 충전 할 수 있습니다.
    
금액 충전시 랜덤의 고유 계좌를 생성해주도록 하였습니다.
    
![image](https://user-images.githubusercontent.com/100820039/187140182-8f29c83c-5e4b-416a-9eeb-4c95930be2e0.png)   
    


```Java
[구현코드]
    // 랜덤한 숫자의 계좌 생성 				
	public String createAccountNum(String userId) { 
		String sql = "INSERT INTO Point (point, accountNum, userId) VALUES (0, ?, ?)";

		String numStr = String.valueOf((int) (Math.random() * 1000000000));
		StringBuilder sb = new StringBuilder();
		sb.append(numStr.substring(0, 3));
		sb.append("-");
		sb.append(numStr.substring(3, 5));
		sb.append("-");
		sb.append(numStr.substring(5));

		String result = sb.toString();

		try {
			Connection con = datasource.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			try {
				if (pointdao.isValidUser(userId)) { // userId가 존재한다면
					//회원가입은 했지만 유저의 계좌가 없다면
					if( pointdao.checkAccountNum(userId) == null ) { //생성해주기
						stmt.setString(1, result);
						stmt.setString(2, userId);
						stmt.executeUpdate();
					}else { //이미 계좌가 있다면 null 반환
						result = null;
					}
				} else {
					result = null;
				}
			} finally {
				stmt.close();
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
 
```
    
# 결제
 
 왼쪽 상단에 있는 P.P.T 버튼을 클릭하여 P.T를 결제 할 수 있습니다.
 
 자신이 원하는 개월 수와 P.T선생님을 선택하여 결제 할 수 있습니다.
 
 ![image](https://user-images.githubusercontent.com/100820039/187149511-92ced41f-e5f0-4450-9cc2-1eafaee3369c.png)

# 게시판 글쓰기

게시판 조회
![image](https://user-images.githubusercontent.com/100820039/187151886-2370dbfc-df81-4353-b34f-d949e8fe6555.png)

![image](https://user-images.githubusercontent.com/100820039/187150986-61e789ea-92a5-49b3-ab69-316bce4d3a02.png)


# 게시판 글수정

![image](https://user-images.githubusercontent.com/100820039/187151154-142a56d8-d0ac-4f54-a7ae-865a59e3e723.png)

![image](https://user-images.githubusercontent.com/100820039/187151307-01c337dc-e02a-4786-aad0-9c184458a4e2.png)

![image](https://user-images.githubusercontent.com/100820039/187151403-8e168422-e58f-4465-993c-a6e40bfda2dd.png)

![image](https://user-images.githubusercontent.com/100820039/187151522-7c7154f2-52c2-4a36-be70-52de7a3ab38a.png)

# 담당 기능

# 쪽지 보내기

원래 쪽지를 보내면 DB를 하나로 처리할려고 했으나 그렇게 되면 받은사람이 쪽지를 삭제하게 되면 보낸 사람의 보낸 쪽지함에서도 쪽지가 삭제되는 문제가 발생하여

DB를 두개로 나누어 해결했습니다.

![image](https://user-images.githubusercontent.com/100820039/188304538-b4349e2a-777b-4f24-8b42-7a22be8ededf.png)

![image](https://user-images.githubusercontent.com/100820039/188304547-a0ba8374-38bc-4042-841a-0269485d0761.png)

![image](https://user-images.githubusercontent.com/100820039/188304565-58a60837-86d8-48d5-8d6c-afe8e137f870.png)

![image](https://user-images.githubusercontent.com/100820039/188304591-ca4e202c-8d93-4ef8-a0d8-e0f7871da5d3.png)

![image](https://user-images.githubusercontent.com/100820039/188304607-1caca65c-fef5-4731-b2b2-bae44fd527e3.png)

![image](https://user-images.githubusercontent.com/100820039/188304617-a5bcf816-4348-4081-8d1d-82cdb6ca033d.png)


노트 보내기 기능 주요 코드 입니다.

SendNoteServlet

```Java
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String msg = request.getParameter("msg");
		String receiveUserId = request.getParameter("receiveUserId");
		HttpSession session = request.getSession(false);
		String sendUserId = (String) session.getAttribute("userId");
		
		Note note = new Note();
		
		note.setTitle(title);
		note.setMsg(msg);
		note.setReceiveUserId(receiveUserId);
		note.setSendUserId(sendUserId);
		service.sendNote(note);
		
		request.getRequestDispatcher("close.jsp").forward(request, response);
	}
```

NoteDao
```Java
/쪽지 보내기 기능
	public void addNote(Note note) {
		String sql = "INSERT INTO RcvNotes(sentid, userid, title, msg)"
				+ "VALUES(?, ?, ?, ?)";
		String sql2 = "INSERT INTO SendNotes(userid, recvid, title, msg)"
				+ "VALUES(?, ?, ?, ?)";
		try {
			Connection con = null;
			PreparedStatement pstmt = null;
			Connection con2 = null;
			PreparedStatement pstmt2 = null;
			try {
				con = datasource.getConnection();
				con2 = datasource2.getConnection();
				
				pstmt = con.prepareStatement(sql);
				pstmt2 = con.prepareStatement(sql2);
				
				pstmt.setString(1, note.getSendUserId());
				pstmt.setString(2, note.getReceiveUserId());
				pstmt.setString(3, note.getTitle());
				pstmt.setString(4, note.getMsg());
				
				pstmt2.setString(1, note.getSendUserId());
				pstmt2.setString(2, note.getReceiveUserId());
				pstmt2.setString(3, note.getTitle());
				pstmt2.setString(4, note.getMsg());
				
				pstmt.executeUpdate();
				pstmt2.executeUpdate();
				System.out.println("addMsgComplete!");
			}finally {
				datasource.close(pstmt, con);
				datasource2.close(pstmt2, con2);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
```

또한 입력중 200자를 넘을경우 스크립트를 이용해 200자이상으로 글자를 입력 못하게 제한했습니다.

![image](https://user-images.githubusercontent.com/100820039/188304843-f3aa904d-eaf6-4884-a8f8-94bf0c7fdcce.png)

스크립트 코드

```javascript
  <script type="text/javascript">
  $('.text_box textarea').keyup(function(){
  	  var content = $(this).val();
  	  $('.text_box .count span').html(content.length);
  	  if (content.length > 200){
  	    alert("최대 200자까지 입력 가능합니다.");
  	    $(this).val(content.substring(0, 200));
  	    $('.text_box .count span').html(200);
  	  }
  	});
  </script>
```

# 쪽지 삭제

![image](https://user-images.githubusercontent.com/100820039/188304761-bb1899a4-431d-40ee-ba08-5c7c6e845543.png)

![image](https://user-images.githubusercontent.com/100820039/188304771-b432ca7b-1a3a-4fe9-8163-d51726c197f4.png)

![image](https://user-images.githubusercontent.com/100820039/188304780-56b50b09-3c5b-4bd6-918b-7b7e3c21c7a9.png)

# 쪽지 답장

![image](https://user-images.githubusercontent.com/100820039/188304794-e818846b-190e-4249-9ac8-bb8a83414626.png)

![image](https://user-images.githubusercontent.com/100820039/188304800-e0078973-3ac2-4018-826e-dc8b86596944.png)



 
 
