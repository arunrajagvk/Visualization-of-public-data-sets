<%@ page import="Model.user" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="Controller.login" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%!
	user u=new user();
	int i=0;
%>
<html lang="en">
	<head>

<script>
 function DisableBackButton() {
window.history.forward()
}
DisableBackButton();
window.onload = DisableBackButton;
window.onpageshow = function(evt) { if (evt.persisted) DisableBackButton() }
window.onunload = function() { void (0) }
window.setInterval(function(){
  reload();
}, 1000);
window.setInterval(function(){
  reloadnotification();
}, 1000);
window.setInterval(function(){
  reloadrequest();
}, 1000);
window.setInterval(function(){
  reloadwall();
}, 1000);
window.setInterval(function(){
  reloadfriend();
}, 1000);
window.setInterval(function(){
  reloadfind();
}, 1000);
window.setInterval(function(){
  reloadnews();
}, 1000);
function reload() {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	var a=xmlhttp.responseText;
	var n=a.split("-");
	document.getElementById("notcount").innerHTML=n[0];
	document.getElementById("notcount1").innerHTML=n[0];
	document.getElementById("notcount2").innerHTML=n[0];
	document.getElementById("requestcount").innerHTML=n[1];
	document.getElementById("requestcount1").innerHTML=n[1];
	document.getElementById("requestcount2").innerHTML=n[1];
	document.getElementById("statuscount").innerHTML=n[2];
	document.getElementById("likescount").innerHTML=n[3];
	document.getElementById("friendcount").innerHTML=n[4];
    }
  }

xmlhttp.open("GET","notification?username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}



function reloadnotification() {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	var a=xmlhttp.responseText;
	var n=a.split("-");
document.getElementById("notification").innerHTML="<label id='user1'>Notifications</label><br><br>";

for(var i=0;i<n.length-1;i+=3) {
document.getElementById("notification").innerHTML=document.getElementById("notification").innerHTML+"<b>"+n[i]+"</b><br><img src='"+n[i+1]+"' width='150px' height='150px' alt='Post thumbnail' class='thumbnail' style='float:left;' /><i>"+n[i]+" </i> liked this post <br>'<font color='grey'>"+n[i+2]+"</font>'<br><br><br><br>";
}
    }
  }

xmlhttp.open("GET","reloadnotification?username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}




function reloadwall() {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	var a=xmlhttp.responseText;
	var n=a.split("-");
document.getElementById("wall").innerHTML="<label id='user1'>My Wall</label><br><br>";

for(var i=0;i<n.length-1;i+=4) {
document.getElementById("wall").innerHTML=document.getElementById("wall").innerHTML+"<b>"+n[i]+"</b> posted a status at <font color='grey'>"+n[i+1]+"</font><br><a href='#' title='Post Heading'><img src='"+n[i+2]+"' width='150px' height='150px' alt='Post thumbnail' class='thumbnail' style='float:left;' /></a>'"+n[i+3]+"'<br><br><br><br>";
}
    }
  }

xmlhttp.open("GET","reloadwall?username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}




function reloadfriend() {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	var a=xmlhttp.responseText;
	var n=a.split("-");
document.getElementById("friend").innerHTML="<label id='user1'>Friend List</label><br><br><input type='button' value='Export as pdf' onclick='pdf()'><br>";

for(var i=0;i<n.length-1;i+=3) {
document.getElementById("friend").innerHTML=document.getElementById("friend").innerHTML+"<b>"+n[i]+" </b><br><a href='#' title='Post Heading'><img src='"+n[i+1]+"' width='150px' height='150px' alt='Post thumbnail' class='thumbnail' style='float:left;' /></a>You became friends with <i>"+n[i]+" </i>  on <font color='grey'>"+n[i+2]+"</font><br><br><br><br>";
}
    }
  }

xmlhttp.open("GET","reloadfriend?username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}

function reloadrequest() {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	var a=xmlhttp.responseText;
	var n=a.split("-");
document.getElementById("request").innerHTML="<label id='user1'>Friend Request</label><br><br>";

for(var i=0;i<n.length-1;i+=3) {
document.getElementById("request").innerHTML=document.getElementById("request").innerHTML+"<b><label id='"+i+"'>"+n[i]+"</label></b><br><a href='#' title='Post Heading'><img src='"+n[i+1]+"' width='150px' height='150px' alt='Post thumbnail' class='thumbnail' style='float:left;' /></a><i>"+n[i]+" </i> has sent u a friend request at <font color='grey'>"+n[i+2]+"</font><br><input type='button' id='"+(i+1)+"' value='Accept Request' onClick='add1(this.id)'><br><br><br><br>";
}
    }
  }

xmlhttp.open("GET","reloadrequest?username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}


function reloadnews() {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	var a=xmlhttp.responseText;
	
	var n=a.split("#");
document.getElementById("news").innerHTML="<label id='user1'>NewsFeed</label><br><br>";

for(var i=0;i<n.length-1;i++) {
	var c=n[i].split("@");
	var b=c[0].split("-");
document.getElementById("news").innerHTML=document.getElementById("news").innerHTML+"<b>"+b[0]+"</b> posted a status at <font color='grey'>"+b[1]+"</font><a href='#' title='Post Heading'><img src='"+b[2]+"' width='150px' height='150px' alt='Post thumbnail' class='thumbnail' style='float:left;' /></a>"+b[3]+"<br><label style='display:none' id='post"+i+"'>"+b[4]+"</label>";
for(var j=5;j<b.length-1;j++) {
document.getElementById("news").innerHTML=document.getElementById("news").innerHTML+"<span><font color='#3b5998'>"+b[j]+",</font></span>";
}
if(b.length>6) {
document.getElementById("news").innerHTML=document.getElementById("news").innerHTML+"likes this";
}
if(c[1]=="no") {
document.getElementById("news").innerHTML=document.getElementById("news").innerHTML+"<br><input type='image' src='images/like.jpg' onclick='like("+i+")'>";
}
document.getElementById("news").innerHTML=document.getElementById("news").innerHTML+"<br><br><br><br>";
}
    }
  }

xmlhttp.open("GET","reloadnews?username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}

function reloadfind() {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	var a=xmlhttp.responseText;
	var n=a.split("-");
document.getElementById("find").innerHTML="<label id='user1'>Find Friends</label><br><br>";

for(var i=0;i<n.length-1;i+=2) {
document.getElementById("find").innerHTML=document.getElementById("find").innerHTML+"<b><label id='"+i+"'>"+n[i]+"</label></b><br><a href='#' title='Post Heading'><img src='"+n[i+1]+"' width='150px' height='150px' alt='Post thumbnail' class='thumbnail' style='float:left;' /></a>Become friends with <i>"+n[i]+"</i><br><input type='button' id='"+(i+1)+"' value='+Add Friend' onClick='add(this.id)'><br><br><br><br>";
}
    }
  }

xmlhttp.open("GET","reloadfind?username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}

function add1(id) {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
window.alert(xmlhttp.responseText);
	
 
    }
  }
var friend=document.getElementById(id-1).innerHTML;
var user=document.getElementById("user").innerHTML;

xmlhttp.open("GET","add?username="+user+"&friendname="+friend+"&status=accept",true);
xmlhttp.send();


}
function publish() {

var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
window.alert(xmlhttp.responseText);
	
 
    }
  }

xmlhttp.open("GET","publish?text="+document.getElementById('tb').value+"&username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}
function add(id) {
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
window.alert(xmlhttp.responseText);
	
 
    }
  }
var friend=document.getElementById(id-1).innerHTML;
var user=document.getElementById("user").innerHTML;

xmlhttp.open("GET","add?username="+user+"&friendname="+friend+"&status=pending",true);
xmlhttp.send();
}

function like(j) {
	var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	var asd=xmlhttp.responseText;
	
 
    }
  }
  var str=document.getElementById("post"+j).innerHTML;

xmlhttp.open("GET","like?postId="+str+"&username="+document.getElementById('user').innerHTML,true);
xmlhttp.send();
}

function notification() {
document.getElementById("notification").style.display="inline";
document.getElementById("wall").style.display="none";
document.getElementById("find").style.display="none";
document.getElementById("friend").style.display="none";
document.getElementById("news").style.display="none";
document.getElementById("request").style.display="none";
document.getElementById("status").style.display="none";
document.getElementById("home1").style.display="none";

}
function wall() {
document.getElementById("notification").style.display="none";
document.getElementById("wall").style.display="inline";
document.getElementById("find").style.display="none";
document.getElementById("friend").style.display="none";
document.getElementById("news").style.display="none";
document.getElementById("request").style.display="none";
document.getElementById("status").style.display="none";
document.getElementById("home1").style.display="none";

}
function find() {
document.getElementById("notification").style.display="none";
document.getElementById("wall").style.display="none";
document.getElementById("find").style.display="inline";
document.getElementById("friend").style.display="none";
document.getElementById("news").style.display="none";
document.getElementById("request").style.display="none";
document.getElementById("status").style.display="none";
document.getElementById("home1").style.display="none";

}
function friend() {
document.getElementById("notification").style.display="none";
document.getElementById("wall").style.display="none";
document.getElementById("find").style.display="none";
document.getElementById("friend").style.display="inline";
document.getElementById("news").style.display="none";
document.getElementById("request").style.display="none";
document.getElementById("status").style.display="none";
document.getElementById("home1").style.display="none";

}
function news() {
document.getElementById("notification").style.display="none";
document.getElementById("wall").style.display="none";
document.getElementById("find").style.display="none";
document.getElementById("friend").style.display="none";
document.getElementById("news").style.display="inline";
document.getElementById("request").style.display="none";
document.getElementById("status").style.display="none";
document.getElementById("home1").style.display="none";

}
function request() {
document.getElementById("notification").style.display="none";
document.getElementById("wall").style.display="none";
document.getElementById("find").style.display="none";
document.getElementById("friend").style.display="none";
document.getElementById("news").style.display="none";
document.getElementById("request").style.display="inline";
document.getElementById("status").style.display="none";
document.getElementById("home1").style.display="none";

}
function status() {
document.getElementById("notification").style.display="none";
document.getElementById("wall").style.display="none";
document.getElementById("find").style.display="none";
document.getElementById("friend").style.display="none";
document.getElementById("news").style.display="none";
document.getElementById("request").style.display="none";
document.getElementById("status").style.display="inline";
document.getElementById("home1").style.display="none";

}
function home() {
document.getElementById("notification").style.display="none";
document.getElementById("wall").style.display="none";
document.getElementById("find").style.display="none";
document.getElementById("friend").style.display="none";
document.getElementById("news").style.display="none";
document.getElementById("request").style.display="none";
document.getElementById("status").style.display="none";
document.getElementById("home1").style.display="inline";
}
function location1() {
document.getElementById("notification").style.display="none";
document.getElementById("wall").style.display="none";
document.getElementById("find").style.display="none";
document.getElementById("friend").style.display="none";
document.getElementById("news").style.display="none";
document.getElementById("request").style.display="none";
document.getElementById("status").style.display="none";
document.getElementById("home1").style.display="none";

}
function pdf() {
	var user=document.getElementById("user").innerHTML;
var xmlhttp;

if (window.XMLHttpRequest)
  {
  xmlhttp=new XMLHttpRequest();
  }
else
  {
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
	
	window.alert(xmlhttp.responseText);	
 
    }
  }
xmlhttp.open("GET","pdf?username="+user,true);
xmlhttp.send();

}


</script>
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
<style>
#dp {
    position: fixed;
    top: 1em;
    left: 1em;
}
#home {
    position: fixed;
margin-left:1000px;
margin-right:0px;
margin-top:10px;
}
.tb {
	border:2px solid #3b5998;
	border-radius:10px;
	height: 22px;
	width: 230px;
}
#display {
border:5px groove #ffffff;
}

#notcount,#notcount1,#notcount2,#requestcount,#requestcount1,#requestcount2,#statuscount,#friendcount,#likescount {
text-shadow: 0 0 0.2em #87F, 0 0 0.2em #87F,
        0 0 0.2em #87F

}
#user{
font-family: 'Bookman Old Style', serif;
line-height: 1em;
color: #ffffff;
font-weight:bold;
font-size: 58px;
text-shadow:0px 0px 0 rgb(171,171,171),1px 1px 0 rgb(157,157,157),2px 2px 0 rgb(142,142,142),3px 3px 0 rgb(127,127,127),4px 4px 0 rgb(113,113,113),5px 5px 0 rgb(98,98,98),6px 6px 0 rgb(83,83,83),7px 7px 0 rgb(69,69,69),8px 8px 0 rgb(54,54,54),9px 9px 0 rgb(39,39,39),10px 10px 0 rgb(25,25,25),11px 11px 0 rgb(10,10,10), 12px 12px 0 rgb(-5,-5,-5),13px 13px 12px rgba(0,0,0,0.45),13px 13px 1px rgba(0,0,0,0.5),0px 0px 12px rgba(0,0,0,.2);}
#user1{
font-family: 'Bookman Old Style', serif;
line-height: 1em;
color: #ffffff;
font-weight:bold;
font-size: 45px;
text-shadow:0px 0px 0 rgb(171,171,171),1px 1px 0 rgb(157,157,157),2px 2px 0 rgb(142,142,142),3px 3px 0 rgb(127,127,127),4px 4px 0 rgb(113,113,113),5px 5px 0 rgb(98,98,98),6px 6px 0 rgb(83,83,83),7px 7px 0 rgb(69,69,69),8px 8px 0 rgb(54,54,54),9px 9px 0 rgb(39,39,39),10px 10px 0 rgb(25,25,25),11px 11px 0 rgb(10,10,10), 12px 12px 0 rgb(-5,-5,-5),13px 13px 12px rgba(0,0,0,0.45),13px 13px 1px rgba(0,0,0,0.5),0px 0px 12px rgba(0,0,0,.2);}

</style>
	</head>
	<body>
<div id="home">

<span id="logout" ><img id="notimage" src="images/notification.png" width="20%" height="10%" onclick="notification()" ></span><b>
<font color="red" size="5"><label id="notcount"></label></font></b>
<span id="logout"><img src="images/friend.png" width="20%" height="10%" onclick="request()" ></span><b>
<font color="red" size="5"><label id="requestcount"></label></font></b>
<a href='index.jsp?username=<%= request.getParameter("username") %>'><span ><img src="images/home.png" width="20%" height="10%" ></span></a>
<span id="logout"><a href="login.jsp"><img src="images/logout.png" width="20%" height="10%" ></a></span>
</div>

	<div id="dp">
	<img id="display" src=<%= u.getImage(request.getParameter("username")) %> height="150px" width"150px"></div>
		<div class="container">	
			
			<header class="clearfix">
				<h1><b><label id="user">
<%= request.getParameter("username") %></label></b> <span>Location and designation</span></h1>	
			</header>
			<div class="main">

				<div class="d1" id="d1">
				<p><label id="notification" style="display:none"></label>



<label id="request" style="display:none"></label>
<label id="find" style="display:none"></label>
<label id="friend" style="display:none"></label>
<label id="wall" style="display:none"></label>
<label id="news" style="display:none"></label>
<label id="status" style="display:none"><label id="user1">Whats Happening?</label><br>
<br>
<br>
<br>
<br>
<input type="text" class="tb" id="tb" style="height:10%;width:80%;color:grey;" onFocus="if(this.value == 'Whats on ur mind....') {this.value = '';this.style.color='black'}" onBlur="if (this.value == '') {this.value = 'Whats on ur mind....';this.style.color='grey'}" value="Whats on ur mind...." ></input>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" src="images/publish.png" onclick="publish()">

</label>
<label id="home1">
<br>
<br>
<label id="user1">Hello <%= request.getParameter("username") %>,</label>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You have <label id="notcount1"></label> notifications.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You have <label id="requestcount1"></label> friend request.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You have posted <label id="statuscount"></label> status.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You have liked <label id="likescount"></label> status.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You have <label id="friendcount"></label> friends.<br>
</label>


</p></div>






				<div class="side">
					<nav class="dr-menu">
						<div class="dr-trigger"><span class="dr-icon dr-icon-menu"></span><a class="dr-label">My Account</a></div>
						<ul>
							<li onclick="home()"><a class="dr-icon dr-icon-user" href="#"><%= request.getParameter("username") %></a></li>
							<li onclick="notification()"><a class="dr-icon dr-icon-user" href="#">Notification <font color="red"><label id="notcount2"></label></font></a></li>
							<li onclick="request()"><a class="dr-icon dr-icon-camera" href="#">Friend Request <font color="red"><label id="requestcount2"></label></font></a></li>
							<li onclick="wall()"><a class="dr-icon dr-icon-heart" href="#">My Wall</a></li>
							<li onclick="news()"><a class="dr-icon dr-icon-bullhorn" href="#">NewsFeed</a></li>
<li onclick="status()"><a class="dr-icon dr-icon-bullhorn" href="#">Post Status</a></li>
							<li onclick="friend()"><a class="dr-icon dr-icon-download" href="#">My Friends</a></li>
							<li onclick="find()"><a class="dr-icon dr-icon-settings" href="#">Find Friends</a></li>
<li><a class="dr-icon dr-icon-settings" href='maps.jsp?username=<%= request.getParameter("username")%>'>Friends Location</a></li>
							<li ><a class="dr-icon dr-icon-switch" href="login.jsp">Logout</a></li>
							
						</ul>
					</nav>
				</div>
			</div>
		</div><!-- /container -->
		<script src="js/ytmenu.js"></script>
	</body>
</html>
