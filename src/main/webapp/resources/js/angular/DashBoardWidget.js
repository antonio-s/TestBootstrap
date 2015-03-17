/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function TypesContainer(code){
    this.code = code;
    this.addCounter = 0;
    
    this.getCode = function(){
        return this.code;
    }
    
    this.allowAdding = function(object){
        if (child instanceof ChildTypeContainer && object.getCode()==="chart"){
            this.addCounter++;
            return true;
        }
        return false;
    }
}
var Types = new TypesContainer();
TypesContainer.prototype.CHART = new TypesContainer("chart");
TypesContainer.prototype.TABLE = new TypesContainer("table");

function DashBoardWidget(options){
    console.log(options);
    if (!options || !options.type){
        throw "type is a requiered option !";
    }
    this.title = "defaultTitle";
    this.defaultWidth = 100;
    this.defaultHeight = 100;
    this.dataSrc = "/data.json";
    
    for(var option in options){
        this[option] = options[option];
    }
    
    this.getOption = function(field){
        if (this[field]){
            return this[field];
        }
        return null;
    }
    
    this.setOption = function(field){
        if (this[field]){
            return this[field];
        }
        return null;
    }
}

function DashBoardWidgetWrapper(widget){
    this.widget
}
