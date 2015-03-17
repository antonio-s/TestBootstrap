/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var dashBoard = angular.module('DashBoard',["ngAnimate"]); 

dashBoard.controller("ShowNamesController",["$scope",function($scope){
    $scope.names = ["Anton","Ann","Max","Natali"];
    $scope.firstName = $scope.names[0];
//    $scope.firstName = function(){
//        return $scope.names[0];
//    }
    $scope.logOut = function(){
//        console.log($scope);
    }
    $scope.$watch("checked",function(newValue,oldValue){
        console.log("newValue = "+newValue+" ; oldValue = "+oldValue);
//        console.log($scope);
        if (oldValue === false && newValue === true){
            $scope.pos_x = 0;
            $scope.pos_y = 0;
        }
    })
}]);

dashBoard.controller("ShowFullNameController",["$scope",function($scope){
    $scope.firstName = "Anton";
    $scope.lastName = "Seredenko";
}]);
dashBoard.controller("ChildFullNameController",["$scope",function($scope){
    $scope.firstName = "Ann";
}]);


dashBoard.directive("myDirective",function(){
    return {
//        transclude : "element",
//        scope : {
//            localName : '@myAttr'
//        },
        scope : {firstName : "=firstName"},
        restrict : 'E',
        template : function(element,attrs){
            element.addClass("alert alert-success");
            return '<label class="label label-default"  my-draggable>{{firstName}}</label>'
//                +'<br/>x = {{pos_x}}  y = {{pos_y}}</label>';
        },
        link : function(scope,element,attrs){
            console.log("linking myDrirective....");
            console.log(scope);
            console.log("attrs :");
            console.log(attrs);
        }
                //'<label class="label label-default">{{name}}</label>'
    };
});


//var MydraggableDirective = function($document){
//    this.restrict = "A";
//    this.refreshCoor
//}

dashBoard.directive('myDraggable', ['$document', function($document) {
  return {
      restrict : 'A',
//      scope : {pos_x : "@pos_x"},
      link : function(scope, element, attr) {
            console.log("drag directive is linking.........");
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
                
                scope.refreshName = function(){
                    console.log(scope);
                    scope.firstName = scope.defaultName+" - "+scope.pos_x;
                };

                element.on('mousedown', function(event) {
                  // Prevent default dragging of selected content
                  event.preventDefault();
                  startX = event.pageX - x;
                  startY = event.pageY - y;
                  $document.on('mousemove', mousemove);
                  $document.on('mouseup', mouseup);
                });
                console.log(this);
                element.on('dblclick',resetPosition);
                
                function refreshName(){
                    scope.firstName = scope.defaultName+" - "+scope.pos_x;
                } 
                function resetPosition(){
                    x = 0;
                    y = 0;
                    scope.pos_x = 0;
                    scope.pos_y = 0;
                    refreshCoordinates(element,0,0);
                }
                function refreshCoordinates(element,x,y){
                      element.css({
                        top: y + 'px',
                        left:  x + 'px'
                      });
                      refreshName();
                      scope.$apply();
                }
                

                function mousemove(event) {
                  y = event.pageY - startY;
                  x = event.pageX - startX;
                  scope.pos_x = x;
                  scope.pos_y = y;
                  refreshCoordinates(element,x,y);
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