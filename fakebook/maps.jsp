<!DOCTYPE html>
<%@ page import="Model.user" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="Controller.login" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%!
	user u=new user();
%>
<html>
<head>
<script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDY0kkJiTPVd2U7aTOAwhc9ySH6oHxOIYM&sensor=false">
</script>

<script>

function initialize(id)
{
var a=document.getElementById(id-2).innerHTML;
var b=document.getElementById(id-1).innerHTML;
var myCenter=new google.maps.LatLng(a,b);
var mapProp = {
  center:myCenter,
  zoom:5,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>

<body bgcolor="black">
<% ResultSet rs3=u.getFriend(request.getParameter("username"));
String user=request.getParameter("username");
%>
<div id="googleMap" style="width:1340px;height:450px;"></div>
<label id="friend">
<label id="user1">Maps</label><br><br>
<%int i=0;
while(rs3.next()) { %>
<%
%>			
				
<label style="display:none" id="<%=++i%>"><%=u.getLatitude(rs3.getString("friendname"))%></label>
<label style="display:none" id="<%=++i%>"><%=u.getLongitude(rs3.getString("friendname"))%></label>
			<a href="#" title="Post Heading"><img src=<%=  u.getImage(rs3.getString("friendname"))%> id="<%=++i%>" width="150px" height="150px" alt="Post thumbnail" class="thumbnail" onclick="initialize(this.id)"/></a>	
<font color="white"><b><%= rs3.getString("friendname")%> </b></font>
			

<%}%>
</label>
<br>
<font color="white"><a href="index.jsp?username=<%= user%>">Back to my account</a></font>
</body>
</html>

