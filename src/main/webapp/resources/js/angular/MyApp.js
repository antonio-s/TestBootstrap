/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var myApp = angular.module('MyApp',["ngAnimate"]); 

myApp.controller("ShowNamesController",["$scope",function($scope){
    $scope.names = ["Anton","Ann","Max","Natali"];
}]);

myApp.controller("ShowFullNameController",["$scope",function($scope){
    $scope.firstName = "Anton";
    $scope.lastName = "Seredenko";
}]);
myApp.controller("ChildFullNameController",["$scope",function($scope){
    $scope.firstName = "Ann";
}]);


myApp.directive("myDraggable",function(){
    return {
        transclude : "element",
        template : function(element,attrs){
            element.addClass("alert alert-success");
            return '<label class="label label-default">{{name}}</label>';
        }
                //'<label class="label label-default">{{name}}</label>'
    };
});
