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
        <!--<link href="resources/css/bootstrap.min.css" rel="stylesheet"/>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>        
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/typeahead.bundle.min.js"></script>
        <script src="resources/js/bloodhound.min.js"></script>
    </head>
    <body>
<style type="text/css">
.bs-example{
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
.tt-input {
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
.tt-suggestion.tt-cursor {
	background-color: #0097CF;
	color: #FFFFFF;
}
.tt-suggestion p {
	margin: 0;
}
</style>
<div class="bs-example" id="in-container">
<input type="text" class="typeahead" placeholder="введите имя" autocomplete="off" spellcheck="false"/>
</div>

<script type="text/javascript">
var mySource = new Bloodhound({
  datumTokenizer: function(d) { 
    return Bloodhound.tokenizers.whitespace(d.value); 
  },
  queryTokenizer: Bloodhound.tokenizers.whitespace,
    prefetch : {
        url : "resources/js/existing-names.js",
        filter : function(list){
            return $.map(list,function(word){return {value:word};});
        }
    }
});
mySource.initialize();

    $(document).ready(function(){
        console.log("typeahead is creating...");
         $('#in-container .typeahead').typeahead({
             hint : true,
             highlight:true
         },
         {
           displayKey: 'value',
           source : mySource.ttAdapter()
         });
    });
</script>
    </body>
</html>
