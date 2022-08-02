<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

String MEM_ID = (String)session.getAttribute("MEM_ID");
int MEM_LATITUDE = (int)session.getAttribute("MEM_LATITUDE");
int MEM_LONGITUDE = (int)session.getAttribute("MEM_LONGITUDE");



tbl_coordinateDAO dao = new tbl_coordinateDAO();

	ArrayList<String> id = new ArrayList<String>();
	List<tbl_coordinate> tbl_coordinate = dao.selectAllList();
	
	int cnt = 0;
for(int i = 0 ; i<tbl_coordinate.size();i++){
	if(!tbl_coordinate.get(i).getMEM_ID().equals(MEM_ID)){
	if(tbl_coordinate.get(i).getMEM_LATITUDE()<MEM_LATITUDE+3&&tbl_coordinate.get(i).getMEM_LATITUDE()>MEM_LATITUDE-3
		&&tbl_coordinate.get(i).getMEM_LONGITUDE()<MEM_LONGITUDE+3&&tbl_coordinate.get(i).getMEM_LONGITUDE()>MEM_LONGITUDE-3){
		id.add(cnt, tbl_coordinate.get(i).getMEM_ID());
		cnt++;
	}
	}
}
  Random r = new Random();
  int num = r.nextInt(id.size());
  List<tbl_share> list = dao.selectListshare(id.get(num));
%>
<%for(int i= 0 ; i<list.size();i++){ %>
 작성자 : <%=list.get(i).getMEM_ID() %><br>
 제목 : <%=list.get(i).getARTICLE_TITLE() %><br>
 종류 : <%=list.get(i).getCAT_NAME() %><br>
 <br>
	<%} %>
</body>
</html>