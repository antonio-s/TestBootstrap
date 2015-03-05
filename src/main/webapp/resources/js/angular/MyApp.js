/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var myApp = angular.module('MyApp',[]); 
function ShowNamesController($scope){
    $scope.names = ["Anton","Ann","Max","Natali"];
}
ShowNamesController.$inject = ["$scope"];
myApp.controller("ShowNamesController",ShowNamesController);
