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
        <style type="text/css">
            .drop-enabled{
                border: 1px solid yellow;
            }
            .drop-disabled{
                border: 1px solid red;
            }
        </style>
    </head>
    <body>
        <script type="text/javascript">
            $(document).ready(function(){
                $(".draggable").draggable({
                    iframeFix:true,
                    snap : "#droppable-container",
                    snapTolerance : 10,
                    snapMode : "inner",
                    stack : "label",
                    zIndex : 0,
                    revert : true,
                    stop : function(event,ui){
                        console.log(event);
                        console.log(ui);
                        
//                        ui.draggable.removeClass("drop-enabled").removeClass("drop-disabled");
                    }
//                    containment : "#droppable-container"
                });
                $(".draggable").draggable("option","cursor","pointer");
                
                $("#droppable-container").droppable({
                   accept : ".label",
                   tolerance : "fit",
                   out : function(event,ui){
                       ui.draggable.draggable('option','revert',true);
                       ui.draggable.addClass("drop-disabled");
                   },
                   over : function(event,ui){
                       ui.draggable.removeClass("drop-disabled").addClass("drop-enabled");
                   },
                   activate : function(event,ui){
                       console.log(ui);
                       ui.draggable.addClass("drop-enabled");
                   },
                   drop : function(event,ui){
                       ui.draggable.removeClass("drop-enabled").removeClass("drop-disabled");
                           ui.draggable.draggable('option','revert',false);
                           ui.draggable.css({
                               left : ui.position.left,
                               top : ui.position.top
                           });
                   }
                });
            });
            
        </script>
        
        <div id="container" class="draggable">
            <label class="label label-info draggable">Element 1</label>
            <label class="label label-danger draggable">Element 2</label>
            <label class="draggable">Element 1000</label>
        </div>
        <div id="droppable-container" class="dropabled col-lg-5" style="border:1px solid;height: 200px;">
            
        </div>
    </body>
</html>
