<%-- 
    Document   : angular
    Created on : Mar 4, 2015, 7:26:20 PM
    Author     : anton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="MyApp">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/jquery-1.11.0.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/angular/angular.js"></script>
        <script src="resources/js/angular/MyApp.js"></script>
    </head>
    <body ng-controller="ShowNamesController">
        <h1 class="text-success">Simple application</h1>
        <li ng-repeat="name in names">
            <!--<div class="">Имя : </div>-->
            <label class="label label-primary">{{name}}</label>
        </li>
    </body>
</html>
