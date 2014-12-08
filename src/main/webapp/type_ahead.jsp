<%-- 
    Document   : type_ahead
    Created on : Dec 8, 2014, 4:07:56 PM
    Author     : anton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TypeAhead testing</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>        
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/typeahead.bundle.min.js"></script>
        <script src="resources/js/bloodhound.min.js"></script>
    </head>
    <body>
<style type="text/css">
.bs-container{
	font-family: sans-serif;
	position: relative;
	margin: 100px;
}
.typeahead, .tt-query, .tt-hint {
	border: 2px solid #CCCCCC;
	border-radius: 8px;
	font-size: 24px;
	height: 30px;
	line-height: 30px;
	outline: medium none;
	padding: 8px 12px;
	width: 396px;
}
.typeahead {
	background-color: #FFFFFF;
}
.typeahead:focus {
	border: 2px solid #0097CF;
}
.tt-query {
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
}
.tt-hint {
	color: #999999;
}
.tt-dropdown-menu {
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	margin-top: 12px;
	padding: 8px 0;
	width: 422px;
}
.tt-suggestion {
	font-size: 24px;
	line-height: 24px;
	padding: 3px 20px;
}
.tt-suggestion.tt-is-under-cursor {
	background-color: #0097CF;
	color: #FFFFFF;
}
.tt-suggestion p {
	margin: 0;
    
}
</style>
<div class="bs-container ">
<input type="text" id="script_name" name="script_name" class="typeahead tt-query" placeholder="введите имя" autocomplete="off" spellcheck="false"/>
</div>

<script type="text/javascript">
var substringMatcher = function(strs) {
  return function findMatches(q, cb) {
    var matches, substrRegex;
 
    // an array that will be populated with substring matches
    matches = [];
 
    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');
 
    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, str) {
      if (substrRegex.test(str)) {
        // the typeahead jQuery plugin expects suggestions to a
        // JavaScript object, refer to typeahead docs for more info
        matches.push({ value: str });
      }
    });
 
    cb(matches);
  };
};

var words = ["amazone","amazing","bomb","beache"];

    $(document).ready(function(){
//        console.log("typeahead is creating...");
//         $('#script_name').typeahead({
//           name: 'script_names',
//           local : ["victim","vaio"]
//         });
$('#script_name').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'words',
  displayKey: 'value',
  source: substringMatcher(words)
});
     });
</script>
    </body>
</html>
