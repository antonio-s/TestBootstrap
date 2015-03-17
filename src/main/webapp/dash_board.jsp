<%-- 
    Document   : dash_board
    Created on : Mar 17, 2015, 3:28:22 PM
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
        <script src="resources/js/angular/angular.js"></script>
        <script src="resources/js/angular/angular-animate.js"></script>
        <script src="resources/js/angular/MiniatureController.js"></script>
        <script src="resources/js/angular/DraggableDirective.js"></script>
        <script src="resources/js/angular/MiniatureViewDirective.js"></script>
        <script src="resources/js/angular/DashBoardApp.js"></script>
        <script src="resources/js/angular/DashBoardWidget.js"></script>
        
        <title>DashBoard</title>
    </head>
    <body ng-app="app">
        <div class="col-lg-12" ng-controller="MiniatureController">
            <div ng-repeat="miniature in miniatures" class="col-lg-1">
                <miniature-view value="miniature" draggable>{{miniature.title}}</miniature-view>
            </div>
        </div>
        <div id="report-container">
            
        </div>
        <script type="text/javascript">
        </script>
    </body>
</html>
