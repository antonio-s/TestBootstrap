/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var scopesApp = angular.module('scopesApp',[]);
scopesApp.controller("greetingController",["$scope","$location",GreetingController]);
scopesApp.controller("nameController",["$scope",nameController]);
scopesApp.controller("specificNameController",["$scope",SpecificNameController]);

function nameController($scope){
    $scope.name = "Samanta";
    console.log("name in nameController : "+$scope.name);
    console.log("name in nameController : "+$scope.$parent.name);
}

function SpecificNameController($scope){
//    $scope.name = "dear "+$scope.name;
    console.log("name in SpecificNameController "+$scope.name);
    console.log("parent.name in SpecificNameController "+$scope.$parent.name);
}

function GreetingController($scope,$location){
    var abstractGreeting = new AbstractGreetingGenerator();
    var slangGreeting = new SlangGreetingGenerator();
    $scope.showSlangGreeting = function(){
        return slangGreeting.showGreeting($scope.name);
    }
    $scope.showFormalGreeting = function(){
        return abstractGreeting.showGreeting($scope.name)
        +"<p>You are at:</p>"
        +$location.absUrl();
    }
    $scope.addOneToUrl=function(){
        $location.path($location.path()+"/one");
    }
}

function AbstractGreetingGenerator(){
    this.prefix = "Hello, ";
    this.suffix = "! Have a good day :)";
    this.showGreeting = function (name){
        var greeting = this.prefix + name + this.suffix;
        console.log(greeting);
        return greeting;
    }
}

function NameControlDirrective(greetingController){
    
}

function SlangGreetingGenerator(){}
SlangGreetingGenerator.prototype = new AbstractGreetingGenerator();
SlangGreetingGenerator.prototype.constructor = AbstractGreetingGenerator;
SlangGreetingGenerator.prototype.pefix = "Hi! ";
SlangGreetingGenerator.prototype.siffix = " o_O";

