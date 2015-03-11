<%-- 
    Document   : jquery_drag_drop
    Created on : Mar 10, 2015, 5:22:03 PM
    Author     : anton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
        <script src="resources/js/jquery-1.11.0.js"></script>
        <script src="resources/js/jquery-ui.min.js"><jsp:text/></script>
        <title>JSP Page</title>
    </head>
    <body>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".draggable").draggable({
                    iframeFix:true,
                    snap : true,
                    snapTolerance : 10,
                    stack : "label",
                    zIndex : 0,
                    drag : function(event,ui){
                        
                    }
                });
                $(".draggable").draggable("option","cursor","pointer");
            });
        </script>
        
        <div id="container" class="draggable">
            <label class="label label-info draggable">Element 1</label>
            <label class="label label-danger draggable">Element 2</label>
        </div>
        
    </body>
</html>
