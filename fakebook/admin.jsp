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
  reloadhome();
}, 1000);
window.setInterval(function(){
  notifications();
}, 1000);

function notifications() {
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
document.getElementById("notification").innerHTML="<label id='user1'>All Posts</label><br><br>";

for(var i=0;i<n.length-1;i+=4) {
document.getElementById("notification").innerHTML=document.getElementById("notification").innerHTML+"<b>"+n[i]+"</b><br><label style='display:none' id='"+i+"'>"+n[i+3]+"</label><img src='"+n[i+1]+"' width='150px' height='150px' alt='Post thumbnail' class='thumbnail' style='float:left;'>"+n[i+2]+"<input type='button' id='"+(i+1)+"' value='Delete Post' onClick='deletes("+i+")'><br><br><br><br>";
}
    }
  }

xmlhttp.open("GET","allnotifications",true);
xmlhttp.send();
}

function deletes(i) {
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

xmlhttp.open("GET","delete?postId="+document.getElementById(i).innerHTML,true);
xmlhttp.send();
}
function reloadhome() {
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
document.getElementById("home1").innerHTML="<label id='user1'>All Accounts</label><br><br>";

for(var i=0;i<n.length-1;i+=2) {
document.getElementById("home1").innerHTML=document.getElementById("home1").innerHTML+"<b>"+n[i]+"</b><br><img src='"+n[i+1]+"' width='150px' height='150px' alt='Post thumbnail' class='thumbnail' style='float:left;' /><br><br><br><br>";
}
    }
  }

xmlhttp.open("GET","reloadhome",true);
xmlhttp.send();
}
function notification() {
document.getElementById("notification").style.display="inline";

document.getElementById("home1").style.display="none";

}
function home() {
document.getElementById("notification").style.display="none";
document.getElementById("home1").style.display="inline";

}
</script>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		
		<meta name="description" content="A tutorial on how to recreate the effect of YouTube's little left side menu. The idea is to slide a little menu icon to the right side while revealing some menu item list beneath. " />
		<meta name="keywords" content="Add keywords" />
		<meta name="author" content="_yourName_ for Codrops" />
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

		<div class="container">	
		
			<header class="clearfix">
				<h1><b><label id="user">
Admin</label></b></h1>	
			</header>
			<div class="main">

				<div class="d1" id="d1">
				<p><label id="home1" ></label>
				<label id="notification" style="display:none"></label>
</p></div>






				<div class="side">
					<nav class="dr-menu">
						<div class="dr-trigger"><span class="dr-icon dr-icon-menu"></span><a class="dr-label">My Account</a></div>
						<ul>
							<li onclick="home()"><a class="dr-icon dr-icon-user" href="#">View accounts</a></li>
							<li onclick="notification()"><a class="dr-icon dr-icon-user" href="#">View posts<font color="red"><label id="notcount2"></label></font></a></li>
							
							
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<script src="js/ytmenu.js"></script>
	</body>
</html>
