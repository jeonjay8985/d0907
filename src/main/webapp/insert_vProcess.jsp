<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String V_JUMIN = request.getParameter("V_JUMIN");   //학번 데이터
   String V_NAME = request.getParameter("V_NAME");
   String M_NO = request.getParameter("M_NO");
   String V_TIME = request.getParameter("V_TIME");
   String V_AREA = request.getParameter("V_AREA");
   String V_CONFIRM = request.getParameter("V_CONFIRM");

   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into vote0906 values(?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, V_JUMIN);    
      pstmt.setString(2, V_NAME);         
      pstmt.setString(3, M_NO);
      pstmt.setString(4, V_TIME);
      pstmt.setString(5, V_AREA);
      pstmt.setString(6, V_CONFIRM);

      pstmt.executeUpdate();
      
      %>
      <script>
      alert("저장 완료되었습니다");
      location.href="select_v.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
    %>

</body>
</html>