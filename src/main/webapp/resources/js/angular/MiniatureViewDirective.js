/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function MiniatureViewDirective(){
    console.log("creating a directive for miniatures");
    return {
        restrict : 'E',
        scope : {miniature : "=value"},
        
        /* В этом месте возвращается собсвтенно шаблон отображения миниатюры */
        template : function (){
            return '<label class="label label-info" draggable>{{miniature.title}}</label>';},
        
        link : function(scope,element,attrs){
            console.log("miniature directive.....");
            console.log(scope);
        }
    };
}
