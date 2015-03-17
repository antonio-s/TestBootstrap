/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var myApp = angular.module('MyApp',["ngAnimate"]); 

myApp.controller("ShowNamesController",["$scope",function($scope){
    $scope.names = ["Anton","Ann","Max","Natali"];
    $scope.firstName = $scope.names[0];
//    $scope.firstName = function(){
//        return $scope.names[0];
//    }
    $scope.logOut = function(){
        console.log($scope);
    }
    $scope.$watch("checked",function(newValue,oldValue){
        console.log("newValue = "+newValue+" ; oldValue = "+oldValue);
        console.log($scope);
        if (oldValue === false && newValue === true){
            $scope.pos_x = 0;
            $scope.pos_y = 0;
        }
    })
}]);
myApp.

myApp.controller("ShowFullNameController",["$scope",function($scope){
    $scope.firstName = "Anton";
    $scope.lastName = "Seredenko";
}]);
myApp.controller("ChildFullNameController",["$scope",function($scope){
    $scope.firstName = "Ann";
}]);


myApp.directive("myDirective",function(){
    return {
//        transclude : "element",
//        scope : {
//            localName : '@myAttr'
//        },
        restrict : 'E',
        template : function(element,attrs){
            element.addClass("alert alert-success");
            return '<label class="label label-default"  my-draggable  ng-mousemove="firstName=defaultName+ \' - \'+ pos_x">{{firstName}}</label>'
//                +'<br/>x = {{pos_x}}  y = {{pos_y}}</label>';
        },
        link : function(scope,element,attrs){
        }
                //'<label class="label label-default">{{name}}</label>'
    };
});

myApp.directive('myDraggable', ['$document', function($document) {
  return {
      restrict : 'A',
      link : function(scope, element, attr) {
                scope.defaultName = scope.firstName;
                var startX = 0, startY = 0, x = 0, y = 0;
            //    alert(scope);
                scope.pos_x = 0;
                scope.pos_y=0;
                element.css({
                 position: 'relative',
            //     border: '1px solid red',
            //     backgroundColor: 'lightgrey',
                 cursor: 'pointer'
                });

                element.on('mousedown', function(event) {
                  // Prevent default dragging of selected content
                  event.preventDefault();
                  startX = event.pageX - x;
                  startY = event.pageY - y;
                  $document.on('mousemove', mousemove);
                  $document.on('mouseup', mouseup);
                });

                function mousemove(event) {
                  y = event.pageY - startY;
                  x = event.pageX - startX;
                  scope.pos_x = x;
                  scope.pos_y = y;
                  element.css({
                    top: y + 'px',
                    left:  x + 'px'
                  });
//                  scope.$apply(function(){
//                    scope.firstName = defaultName + " - x = "+ x +" y = "+ y;
//                  });
                }

                function mouseup() {
                  $document.off('mousemove', mousemove);
                  $document.off('mouseup', mouseup);
            //      alert(scope.firstName());
                }
              }
  }
}]);