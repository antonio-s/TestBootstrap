<%-- 
    Document   : pureJS
    Created on : Jan 16, 2015, 5:24:17 PM
    Author     : anton
--%>

<%@page import="java.util.Date"%>
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
        <link rel="stylesheet" href="resources/css/jquery-ui.css"/>
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
                var newLabel = this.element.append($("<label></label>").text(text));
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
        var factory = $("#dynamic-container").componentFactory({tagName:"extra_ftp"});
        $("#dynamic-container").dynamicComponentContainer({componentGenerator:{
//                createComponent : function(){
//                    var index = factory.componentFactory("option","index");
//                    index += 1;
//                    factory.componentFactory("option","index",index);
////                    return factory.componentFactory("label","это уже "+factory.componentFactory("option","index")+"-я метка");
//                    return factory.componentFactory("ftpInput",index);
//                }
                createComponent : function(){
                    return factory.componentFactory("minusDaysInput","script_params");
                }
                
            }
        });
    });
    
</script>
<!--<div>
    <button id="my-button" type="button" class="btn btn-success btn-xs btn-circle-xs"><i class="fa fa-plus-circle"></i></button>
    <div id="title-container"></div>
    
</div>-->
<form name="my-form">
    <input name="in_param"/>
    <div id="dynamic-container">
        
    </div>
    <button type="" class="btn btn-primary btn-sm">submit</button>
</form>
            <script src="resources/js/bootstrap.min.js"></script>
            <script src="resources/js/jquery-ui.js"></script>
            <script src="resources/js/plugins/dynamicContainer/dynamicContainer.js?_=<%=new Date().getTime()%>"></script>
            <script src="resources/js/plugins/dynamicContainer/componentFactory.js?_=<%=new Date().getTime()%>"></script>
</body>
</html>