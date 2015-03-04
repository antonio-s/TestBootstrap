<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>        
        <script src="resources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <button type="button" class="btn btn-lg btn-default" id="myButton">Button</button>
        <script type="text/javascript">
            $("#myButton").on("click",function(e){
                alert("OK");
            });
            alert('5'-'4');
        </script>
    </body>
</html>
