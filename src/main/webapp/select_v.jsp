<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check(){
	//alert("errr");
	frm.submit();
}</script>

</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<form name=frm method=post action="select_v.jsp">
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
  	String V_AREA = request.getParameter("V_AREA");
     //int r_no=1;
     if(V_AREA == null) {
    	 V_AREA = "1";
     }
     String area_name = "";
     if(V_AREA.equals("1")) {
    	 area_name = "제1투표장";
     }else {
    	 area_name = "제2투표장";
     }
     System.out.println("V_AREA : "+V_AREA);
     int cnt=0;

     try{
    	 String sql = "select count(*) from vote0906 where V_AREA='" +area_name+ "'";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 if(rs.next()) {
    		 cnt=rs.getInt(1);
    	 }
 }catch(Exception e) {
	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
 }
   %> 	 
    	 
<fieldset id = fd>
<legend>선택</legend>
투표소 : <input type="radio" id=in1 name="V_AREA" onchange="check()" value="1" <%if(V_AREA.equals("1")){%>checked<%}%>> 제1투표장
       <input type="radio" id=in1 name="V_AREA" onchange="check()" value="2" <%if(V_AREA.equals("2")){%>checked<%}%>> 제2투표장
</fieldset>
</form>

<h1>투표검수 조회</h1>

<p> 총 <%=cnt %>명의 투표검수 조회가 있습니다 </p>

<table border=1 id="tab1">
<tr>
   
    
    <th>성명</th>
    <th>생년월일</th>
    <th>나이</th>
    <th>성별</th>
    <th>후보번호</th>
    <th>투표시간</th>
    <th>유권자확인</th>
    <th>구분</th>
 
    
</tr>

<%
    
     try{
    	 String sql = "select * from vote0906 where V_AREA='" +area_name+ "'";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 
    String birth="";
    int age=0;
    String gender="";
    
    	 while(rs.next()) {
    		 
    		 String V_NAME = rs.getString("V_NAME");
    		 String V_JUMIN= rs.getString("V_JUMIN");
    		 birth=V_JUMIN.substring(0,6);
    		 age=Integer.parseInt(V_JUMIN.substring(0,2));
    		 char ch=V_JUMIN.charAt(6);
    		 if(ch=='1' || ch=='3') {
    			 gender="남";
    		 }else if(ch=='2' || ch=='4') {
    			 gender="여";
    		 }
    		 if(ch=='1' || ch=='2') {
    			 age=2023-(1900+age)+1;
    		 }else if(ch=='3' || ch=='4') {
    			 age=2023-(2000+age)+1;
    		 }
    		 
    		 String M_NO = rs.getString("M_NO");
    		    		 String V_TIME = rs.getString("V_TIME");
    		 String V_CONFIRM = rs.getString("V_CONFIRM");
    		 if(V_CONFIRM.equals("Y")) {
    			 V_CONFIRM="확인";
    		 }else if(V_CONFIRM.equals("N")){
    			 V_CONFIRM="미확인";
    		 }
    		 
   		
%>
<tr>
   
    <td><%=V_NAME %> </td>
    <td><%=birth %> </td> 
    <td><%=age %> </td> 
    <td><%=gender %> </td> 
    <td><%=M_NO %> </td>
    <td><%=V_TIME %> </td>
    <td><%=V_CONFIRM %> </td>
 

    <td>
     <a href="select_mUpdate.jsp?M_NO=<%=M_NO %>"> 수정</a>/
    
     <a href="select_mDelete.jsp?M_NO=<%=M_NO %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 8  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_v.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>