/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function WidgetContainer(id,wWrappers){
    var _widgetWrappers = [];
    if (wWrappers && wWrappers instanceof Array){
        _widgetWrappers = wWrappers;
    }
    var _id = id;
    
    this.addWidgetWrapper = function(widgetWrpapper){
        _widgetWrappers.push(widgetWrpapper);
    }
    this.clearWidgetWrappers = function(){
        _widgetWrappers.length = 0;
    }
    this.getWidgetWrappers = function(){
        return _widgetWrappers;
    }
    
    this.getId = function(){
        return _id;
    }
    
}
