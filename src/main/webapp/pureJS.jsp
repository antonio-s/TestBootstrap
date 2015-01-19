<%-- 
    Document   : pureJS
    Created on : Jan 16, 2015, 5:24:17 PM
    Author     : anton
--%>

<jsp:directive.page contentType="text/html;charset=UTF-8" />

<html xmlns:jsp="http://java.sun.com/JSP/Page"
      xmlns:c="http://java.sun.com/jsp/jstl/core"
      style="width: 100%;height: 100%">
    <head><meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/><meta content="IE=8" http-equiv="X-UA-Compatible"/>
    </head>
    <body style="width: 100%;height: 100%">
        <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="resources/css/plugins/metisMenu/metisMenu.min.css"/>
        <link rel="stylesheet" href="resources/css/plugins/timeline.css"/>
        <link rel="stylesheet" href="resources/css/sb-admin-2.css"/>
        <link rel="stylesheet" href="resources/css/plugins/morris.css"/>
        <link type="text/css" rel="stylesheet" href="resources/font-awesome-4.1.0/css/font-awesome.min.css"/>
        <script src="resources/js/jquery-1.11.0.js"></script>
                            Pure JavaScript
                        </div>
<link href="resources/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<style>
    .red-text{
        color : red;
    }
</style>
<script type="text/javascript">
    $(document).ready(function(){
        console.log("starting....");
        $.widget("custom.componentGenerator",{
            options : {
                title : "default title",
                value : null
            },
            _create : function(){
                this.element.addClass("red-text").text(this.options.title);
            },
            _private : function(){
                alert("private method invoked");
            },
            _setOption : function(key,value){
                console.log("settings option value...."+key);
                if (key === "value"){
                    this.options.title = value.toString();
                    this._refreshView();
                    this._trigger("showSeconds",null,{});
                }
                this._super(key,value);
            },
            _setOptions : function(options){
                this._super(options);
                this._refreshView();
            },
//            value : function(value){
//                this._setOption("value",value);
//            },
            _refreshView : function(){
                console.log("refreshing view.....");
                this.element.text(this.options.title);
            },
            label : function(text){
                this.element.append($("<br>"));
                var newLabel = this.element.append($("<label>").text(text));
                return newLabel;
            }
        });
//        var container = $("#title-container").componentGenerator({title : ""});
//        var title = $("<label>").appendTo(container).componentGenerator({
//            showSeconds : function(event,data){
//                container.componentGenerator("label",new Date().getSeconds()).css("color","green");
//            }})
////                .data("custom-componentGenerator");
//        $("#my-button").click(function(){
//            console.log("click");
//            title.componentGenerator("option","value",new Date());
//        });
    });
    
    $(document).ready(function(){
        $.widget("custom.dynamicComponentContainer",{
            options : {
                container : null,
                baseName : null,
                componentGenerator : {
                    createComponent : function(){
                        return this._defaultComponent();
                    }
                }
                
            },
            _defaultComponent : function(){
                return $("<span>")
                        .append($("<label>").text("тестовый текст")
                        );
            },
            _create : function(){
                var container = $("<div>");
                this.options.container = container;
                this.element.append(container);
                var button = $("<button>").addClass("btn btn-success btn-sm").append($("<i>").addClass("fa fa-plus-circle"));
                var obj = this;
                button.click(function(event){
                   obj.addComponent();
                });
                this.element.append(button);
            },
            addComponent : function(){
                if (this.options.componentGenerator === null){
                    console.log("componentGenerator should be initialized before using!");
                    return this;
                }
                var slot = $("<div>");
                var component = $("<span>").append(this.options.componentGenerator.createComponent());
                var minusButton = $("<span>");
                this.options.container.append(slot);
                slot
                    .append(component)
                    .append(
                        minusButton
                            .append($("<button>")
                                .addClass("btn btn-xs btn-danger")
                                .append($("<i>").addClass("fa fa-minus"))
                                .click(function(event){
                                    slot.remove();
                                })
                                ));
                
                return this;
            }
        });
        
        $.widget("custom.componentFactory",{
            options : {
                tagName : null,
                index : 0
            },
            label : function(text){
                console.log("label....");
                var label = $("<span>").addClass("label label-info");
                label.text(text);
                return label;
            },
            ftpInput : function(nameSuffix){
//                this.options.index = this.options.index + 1;
                return $("<input>").attr("type","input").attr("name",this.options.tagName+nameSuffix);
            }
        });
        
        var factory = $("#dynamic-container").componentFactory({tagName:"extra_ftp"});
        $("#dynamic-container").dynamicComponentContainer({componentGenerator:{
                createComponent : function(){
                    var index = factory.componentFactory("option","index");
                    index += 1;
                    factory.componentFactory("option","index",index);
//                    return factory.componentFactory("label","это уже "+factory.componentFactory("option","index")+"-я метка");
                    return factory.componentFactory("ftpInput",index);
                }
            }
        });
    });
</script>
<!--<div>
    <button id="my-button" type="button" class="btn btn-success btn-xs btn-circle-xs"><i class="fa fa-plus-circle"></i></button>
    <div id="title-container"></div>
    
</div>-->
<div id="dynamic-container" class="">
    
</div>
            <script src="resources/js/bootstrap.min.js"></script>
            <script src="resources/js/jquery-ui.js"></script>
</body>
</html>