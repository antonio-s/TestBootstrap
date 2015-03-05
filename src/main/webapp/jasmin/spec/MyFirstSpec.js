/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


describe("Test ShowNamesController", function() {
    var myController;
    beforeEach(module("MyApp"));
    
    beforeEach(inject(function($controller,$rootScope) {

        scope = $rootScope.$new();
        myController = $controller("ShowNamesController",{$scope:scope});
    }));
    
    it("should be length of 4",function(){
      expect(scope.names.length).toBe(4);
    });
    it("and the 1-st must be Anton",function(){
      expect(scope.names[0]).toBe("Anton");
    });
});

