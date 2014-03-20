<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>

<head>
<title>Fake Book</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/themes/base/jquery-ui.css" type="text/css" media="all" />
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
jQuery(function($){
// simple jQuery validation script
$('#login').submit(function(){
var valid = true;
var errormsg = 'This field is required!';
var errorcn = 'error';
$('.' + errorcn, this).remove();
$('.required', this).each(function(){
var parent = $(this).parent();
if( $(this).val() == '' ){
var msg = $(this).attr('title');
msg = (msg != '') ? msg : errormsg;
$('<span class="'+ errorcn +'">'+ msg +'</span>')
.appendTo(parent)
.fadeIn('fast')
.click(function(){ $(this).remove(); })
valid = false;
};
});
return valid;
});
})
</script>
<script>
$(function() {

$( "#dialog:ui-dialog" ).dialog( "destroy" );
var name = $( "#name" ),
email = $( "#email" ),
password = $( "#password" ),
browse = $( "#browse" ),
country = $( "#country" ),
allFields = $( [] ).add( name ).add( email ).add( password ).add( browse ),
tips = $( ".validateTips" );
function updateTips( t ) {
tips
.text( t )
.addClass( "ui-state-highlight" );
setTimeout(function() {
tips.removeClass( "ui-state-highlight", 1500 );
}, 500 );
}
function checkLength( o, n, min, max ) {
if ( o.val().length > max || o.val().length < min ) {
o.addClass( "ui-state-error" );
updateTips( "Length of " + n + " must be between " +
min + " and " + max + "." );
return false;
} else {
return true;
}
}
function checkRegexp( o, regexp, n ) {
if ( !( regexp.test( o.val() ) ) ) {
o.addClass( "ui-state-error" );
updateTips( n );
return false;
} else {
return true;
}
}
$( "#dialog-form" ).dialog({
autoOpen: false,
height: 500,
width: 350,
modal: true,
buttons: {
"Create an account": function() {
var bValid = true;
allFields.removeClass( "ui-state-error" );
bValid = bValid && checkLength( name, "username", 3, 16 );

bValid = bValid && checkLength( email, "email", 6, 80 );
bValid = bValid && checkLength( password, "password", 5, 16 );
bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
if ( bValid ) {

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
    var response=xmlhttp.responseText;
    window.alert(response);
    }
  }

xmlhttp.open("GET","login?username="+name.val()+"&email="+email.val()+"&password="+password.val()+"&browse="+document.getElementById('browse').value+"&newuser=yes&country="+country.val(),true);
xmlhttp.send();


$( this ).dialog( "close" );
}
},
Cancel: function() {
$( this ).dialog( "close" );
}
},
close: function() {
allFields.val( "" ).removeClass( "ui-state-error" );
}
});
$( "#create-user" )
.button()
.click(function() {
$( "#dialog-form" ).dialog( "open" );
});
});
</script>
<script>
$(function() {
$( "#dialog:ui-dialog" ).dialog( "destroy" );
var name = $( "#name" ),
email = $( "#email" ),
password = $( "#password" ),
browse = $( "#browse" ),
allFields = $( [] ).add( name ).add( email ).add( password ).add( browse ),
tips = $( ".validateTips" );
function updateTips( t ) {
tips
.text( t )
.addClass( "ui-state-highlight" );
setTimeout(function() {
tips.removeClass( "ui-state-highlight", 1500 );
}, 500 );
}
function checkLength( o, n, min, max ) {
if ( o.val().length > max || o.val().length < min ) {
o.addClass( "ui-state-error" );
updateTips( "Length of " + n + " must be between " +
min + " and " + max + "." );
return false;
} else {
return true;
}
}
function checkRegexp( o, regexp, n ) {
if ( !( regexp.test( o.val() ) ) ) {
o.addClass( "ui-state-error" );
updateTips( n );
return false;
} else {
return true;
}
}


});

function showStrength(str)
{
if(str.length!=0) {
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
	var node=document.getElementById("pass");
	while (node.hasChildNodes()) {
    node.removeChild(node.lastChild);
      }


	var pass=document.createElement("img");
	pass.src=xmlhttp.responseText;
        node.appendChild(pass);
    }
  }

xmlhttp.open("GET","validate?password="+str,true);
xmlhttp.send();
}
}
</script>
<style>
h1, h2, h3, h4, h5, h6{
font-weight:normal;
margin:0;
line-height:1.1em;
color:#000;
}
input.text { margin-bottom:12px; width:95%; padding: .4em; }
fieldset { padding:0; border:0; margin-top:25px; }
h1 { font-size: 1.2em; margin: .6em 0; }
div#users-contain { width: 350px; margin: 20px 0; }
div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
.ui-dialog .ui-state-error { padding: .3em; }
.validateTips { border: 1px solid transparent; padding: 0.3em; }
h1{font-size:2em;margin-bottom:.5em;}
h2{font-size:1.75em;margin-bottom:.5142em;padding-top:.2em;}
h3{font-size:1.5em;margin-bottom:.7em;padding-top:.3em;}
h4{font-size:1.25em;margin-bottom:.6em;}
h5,h6{font-size:1em;margin-bottom:.5em;font-weight:bold;}
p, blockquote, ul, ol, dl, form, table, pre{line-height:inherit;margin:0 0 1.5em 0;}
ul, ol, dl{padding:0;}
ul ul, ul ol, ol ol, ol ul, dd{margin:0;}
li{margin:0 0 0 2em;padding:0;display:list-item;list-style-position:outside;}
blockquote, dd{padding:0 0 0 2em;}
pre, code, samp, kbd, var{font:100% mono-space,monospace;}
pre{overflow:auto;}
abbr, acronym{
text-transform:uppercase;
border-bottom:1px dotted #000;
letter-spacing:1px;
}
abbr[title], acronym[title]{cursor:help;}
small{font-size:.9em;}
sup, sub{font-size:.8em;}
em, cite, q{font-style:italic;}
img{border:none;}
hr{display:none;}
table{width:100%;border-collapse:collapse;}
th,caption{text-align:left;}
form div{margin:.5em 0;clear:both;}
label{display:block;}
fieldset{margin:0;padding:0;border:none;}
legend{font-weight:bold;}
input[type="radio"],input[type="checkbox"], .radio, .checkbox{margin:0 .25em 0 0;}
/* // HTML elements */
/* base */
body, table, input, textarea, select, li, button{
font:1em "Lucida Sans Unicode", "Lucida Grande", sans-serif;
line-height:1.5em;
color:#444;
}
body{
font-size:12px;
background-size: 110%;
text-align:center;
}
/* // base */
/* login form */
#login{
margin:5em auto;
background:#fff;
border:8px solid #eee;
width:500px;
-moz-border-radius:5px;
-webkit-border-radius:5px;
border-radius:5px;
-moz-box-shadow:0 0 10px #4e707c;
-webkit-box-shadow:0 0 10px #4e707c;
box-shadow:0 0 10px #4e707c;
text-align:left;
position:relative;
}
#login a, #login a:visited{color:#0283b2;}
#login a:hover{color:#111;}
#login h1{
background:#000000;
color:#fff;

text-shadow:#007dab 0 1px 0;
font-size:14px;
padding:18px 23px;
margin:0 0 1.5em 0;
border-bottom:1px solid #007dab;
}
#login .register{
position:absolute;
float:left;
margin:0;
line-height:30px;
top:-40px;
right:0;
font-size:11px;
}
#login p{margin:.5em 25px;}
#login div{
margin:.5em 25px;
background:#eee;
padding:4px;
-moz-border-radius:3px;
-webkit-border-radius:3px;
border-radius:3px;
text-align:right;
position:relative;
}
#login label{
float:left;
line-height:30px;
padding-left:10px;
}
#login .field{
border:1px solid #ccc;
width:280px;
font-size:12px;
line-height:1em;
padding:4px;
-moz-box-shadow:inset 0 0 5px #ccc;
-webkit-box-shadow:inset 0 0 5px #ccc;
box-shadow:inset 0 0 5px #ccc;
}
#login div.submit{background:none;margin:1em 25px;text-align:left;}
#login div.submit label{float:none;display:inline;font-size:11px;}
#login button{
border:0;
padding:0 30px;
height:30px;
line-height:30px;
text-align:center;
font-size:12px;
color:#fff;
text-shadow:#007dab 0 1px 0;
background:#000000;
-moz-border-radius:50px;
-webkit-border-radius:50px;
border-radius:50px;
cursor:pointer;
}
#login .forgot{text-align:right;font-size:11px;}
#login .back{padding:1em 0;border-top:1px solid #eee;text-align:right;font-size:11px;}
#login .error{
float:left;
position:absolute;
left:95%;
top:-5px;
background:#000000;
padding:5px 10px;
font-size:11px;
color:#000;
text-shadow:#500 0 1px 0;
text-align:left;
white-space:nowrap;
border:1px solid #500;
-moz-border-radius:3px;
-webkit-border-radius:3px;
border-radius:3px;
-moz-box-shadow:0 0 5px #700;
-webkit-box-shadow:0 0 5px #700;
box-shadow:0 0 5px #700;
}
    body {
                background: url('images/cover.jpg') no-repeat;
                background-size: 100% 420%;
            }
</style>
</head>

<body>



<form id="login" method="get" action="login">
<h1>Log in to your <strong>FakeBook</strong> account!</h1>
<p class="register"><font color="white">Not a member?</font> <a href="#" id="create-user">Register here!</a></p>
<div>
<label for="login_username">Username</label>
<input type="text" name="username" id="login_username" class="field required" title="Please provide your username" />
</div>
<div>
<label for="login_password">Password</label>
<input type="password" name="password" id="login_password" class="field required" title="Password is required" />
</div>
<div class="submit">
<button type="submit">Log in</button>
</div>
</form>
<div id="dialog-form" title="Create new user">
<p class="validateTips">All form fields are required.</p>
<form action="Your Signup Form Action Link Here" method="post">
<fieldset>
<label for="name">Name</label>
<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" />
<label for="email">Email</label>
<input type="text" name="email" id="email" value="" class="text ui-widget-content ui-corner-all" />
<input type="file" id="upload" name="upload" style="visibility: hidden; width: 1px; height: 1px" multiple />
<label for="picture">Choose a picture</label>
<input type="text" name="browse" id="browse" value="" class="text ui-widget-content ui-corner-all" onclick="document.getElementById('upload').click(); this.value=document.getElementById('upload').value; return false">
<label for="country">Country</label>
<input type="text" name="country" id="country" class="text ui-widget-content ui-corner-all" />
<label for="password">Password</label>
<input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all" onkeyup="showStrength(this.value)"/>
<div id="pass" style="float:left;"></div>


</fieldset>
</form>
</div>

</body>
</html>
