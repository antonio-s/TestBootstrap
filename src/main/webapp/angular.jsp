<%-- 
    Document   : angular
    Created on : Mar 4, 2015, 7:26:20 PM
    Author     : anton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!--<script src="resources/js/jquery-1.11.0.js"></script>-->
        <!--<script src="resources/js/bootstrap.min.js"></script>-->
        <script src="resources/js/angular/angular.js"></script>
        <script src="resources/js/angular/angular-animate.js"></script>
        <script src="resources/js/angular/MyApp.js"></script>
        <style type="text/css">
.sample-show-hide {
  padding:10px;
  background:white;
}
.sample-show-hide {
  /*cursor : pointer;*/
  -webkit-transition : all linear 0.5s;
  transition:all linear 0.5s;
}

.sample-show-hide.ng-hide {
  opacity:0;
}            
/*@keyframes my_animation {
  from { opacity:1; }
  to { opacity:0; }
}


  Unfortunately each browser vendor requires
  its own definition of keyframe animation code...

@-webkit-keyframes my_animation {
  from { opacity:1; }
  to { opacity:0; }
}

@-moz-keyframes my_animation {
  from { opacity:1; }
  to { opacity:0; }
}

@-o-keyframes my_animation {
  from { opacity:1; }
  to { opacity:0; }
}*/
        </style>
        </head>
<!--<body ng-app="ngAnimate">
  <div ng-init="checked=true">
  <label>
    <input type="checkbox" ng-model="checked" style=""> Is Visible...
  </label>
  <div class="sample-show-hide" ng-show="checked" >
    Visible...
  </div>
</div>
</body>-->
    <body ng-app="MyApp">
        <div ng-controller="ShowNamesController">
        <h1 class="text-success">Simple application</h1>
        <div ng-init="checked=true">
            <label>
                <input type="checkbox" ng-model="checked" > Is Visible...
            </label>
            <li ng-init="name=names[0]" class="sample-show-hide" ng-show="checked">
                <my-directive ng-attr-reset="!checked">Имя : </my-directive>
                <!--<label class="label label-info" ng-mouseup="checked=true" style="cursor: pointer">{{name}}</label>-->
            </li>
        </div>
       </div>
        <div ng-controller="ShowFullNameController">
            <label class="label label-success">{{firstName}} {{lastName}}</label>
            <div ng-controller="ChildFullNameController">
                <label class="label label-danger">{{firstName}} {{lastName}}</label>
            </div>
        </div>
    </body>
</html>
