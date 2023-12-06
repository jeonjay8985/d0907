<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	if(document.frm.V_JUMIN.value==""){
		alert("주민번호를 입력하세요");
		document.frm.V_JUMIN.focus(); 
		return false;           
	} 
	if(!(document.frm.V_JUMIN.value.length==13)){
		alert("유효하지 않은 주민번호입니다");
		 document.frm.V_JUMIN.focus(); 
		 return false; 
	}

	if(document.frm.V_NAME.value==""){
		alert("성명을 입력하세요");
		document.frm.V_NAME.focus(); 
		return false; 
	}	  	
	
	var name = /^[가-힣]+$/; //한글이름 유효성 검사
	if(!name.test(document.frm.V_NAME.value)) {
		alert("한글 이름으로 입력해주세요");
		document.frm.V_NAME.focus(); 
		return false; 
    }

	if(document.frm.V_TIME.value==""){
		alert("투표시간을 입력하세요");
		document.frm.V_TIME.focus(); 
		return false; 
	}	  	
	if(!(document.frm.V_TIME.value.length==4)){
		alert("투표시간을 4자리로 입력하세요 예)0930");
		 document.frm.V_TIMEN.focus(); 
		 return false; 
	}
	if(document.frm.V_AREA.value==""){
	    alert("투표장소를 입력하세요");
	    document.frm.V_AREA.focus(); 
	    return false; 
	}	
	if(!((document.frm.V_AREA.value=="제1투표장") || (document.frm.V_AREA.value=="제2투표장"))){
		alert("제1투표장 or 제2투표장으로 입력하세요");
		 document.frm.V_AREA.focus(); 
		 return false; 
	}

	document.frm.submit();
}

</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>투표하기 화면</h1>
<%@ include file = "dbconn.jsp" %>
<form name="frm" method="post" action="insert_vProcess.jsp">
<table border=1 id="tab2">

<tr> 
      <th>주민번호</th>
      <td><input type="text" name="V_JUMIN"  id=in1></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="V_NAME"  id=in1></td>
</tr>

<tr> 
      <th>투표번호</th>
    <td>
      <select name ="M_NO" id=in3>
      <option value ="1"> [1]김후보</option>
      <option value ="2"> [2]이후보</option>
      <option value ="3"> [3]박후보</option>
      <option value ="4"> [4]조후보</option>
      <option value ="5"> [5]최후보</option>
      </select>
    </td>
</tr>

<tr> 
      <th>투표시간</th>
      <td><input type="text" name="V_TIME"  id=in1></td>
</tr>

<tr> 
      <th>투표장소</th>
      <td><input type="text" name="V_AREA"  id=in1></td>
</tr>

<tr> 
      <th>유권자확인</th>
      <td>
         <input type="Radio" name="V_CONFIRM" value ="Y" onclick="V_CONFIRM()" checked>확인
         <input type="Radio" name="V_CONFIRM" value ="N" onclick="V_CONFIRM()">미확인
         
      </td>
</tr>



<tr>
    <td colspan = 7 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>