/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function DraggableDirective(){
    console.log("creating DraggableDirective .......");
    return {
//        scope : {miniature : "@miniature"},
        restrict : "A",
        link : function(scope, element, attr) {
            element.draggable({
                revert : true
            });
                element.on("click",function(event){
                    alert("dblclick");
                })
        }
    }
}
