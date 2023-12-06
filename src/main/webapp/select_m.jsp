<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>후보자 조회</h1>
<table border=1 id="tab1">
<tr>
   
    <th>후보번호</th>
    <th>성명</th>
    <th>소속정당</th>
    <th>학력</th>
    <th>주민번호</th>
    <th>지역구</th>
    <th>대표전화</th>
    <th>구분</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
    

     try{
    	 String sql = "select b.M_NO, b.M_NAME, b.P_CODE, b.P_SCHOOL, b.M_JUMIN, b.M_CITY, c.P_TEL1, c.P_TEL2, c.P_TEL3 from member0906 b, party0906 c where b.P_CODE=c.P_CODE";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String M_NO = rs.getString("M_NO");
    		 String M_NAME= rs.getString("M_NAME");
    		 String P_CODE = rs.getString("P_CODE");
    		 String P_SCHOOL = rs.getString("P_SCHOOL");
    		  if(P_SCHOOL.equals("1")) {
    			  P_SCHOOL="고졸";
     		 }else if(P_SCHOOL.equals("2")){
     			P_SCHOOL="학사";
     		 }else if(P_SCHOOL.equals("3")){
      			P_SCHOOL="석사";
      		 }else if(P_SCHOOL.equals("4")){
      			P_SCHOOL="박사";
      		 }
    		  
    		 String M_JUMIN = rs.getString("M_JUMIN");
    		 String M_CITY = rs.getString("M_CITY");
    		 String P_TEL = rs.getString(7)+"-"+rs.getString(8)+"-"+rs.getString(9);

    		
   		
%>
<tr>
   
    <td><%=M_NO %> </td>
    <td><%=M_NAME %> </td>
    <td><%=P_CODE %> </td>
    <td><%=P_SCHOOL %> </td>
    <td><%=M_JUMIN %> </td>
    <td><%=M_CITY %> </td>
    <td><%=P_TEL %> </td>
 

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
	 location.href="insert_m.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>