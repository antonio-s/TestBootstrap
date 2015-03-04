/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
    ftpInput : function(baseUrl,imgUrl){
//                this.options.index = this.options.index + 1;
        var mainContainer = 
            $("<div>").addClass("row");
        var innerContainer = $("<div>").addClass("col-lg-4");
        var label = $("<label>").text("дополнительная выгрузка")
        innerContainer.append(label);
        var ftpContainer = $("<div>").addClass("input-group");
        var inputField = $("<input>").attr("name","additinal_ftp").addClass("form-control");
        ftpContainer.append(inputField);
        
        var checkLoader = $("<div>").addClass("container-fluid")
        var checkLoader = $("img").attr("src","reources/img/loader-blue.gif");
        ftpContainer.append($("<div>").addClass("container-fluid"))
        checkLoader.appendTo($("div").addClass("row col-lg-1").appendTo($("<div>").addClass("container-fluid").appendTo(ftpContainer)));
        inputField.blur(function(event){
            if ($.trim(inputField.val())===""){
                innerContainer.addClass("has-error");
            }else{
                checkLoader.show();
                inputField.attr("disabled",true);
                $.ajax({
                    type:"GET",
                    dataType: "json",
                    data : {ftpUrl : inputField.val()},
                    url: baseUrl+'check/ftp',
                    success : function(data) {
                        if (data.error){
                            innerContainer.addClass("has-error");
                            alert(data.error);
                        }else{
                            innerContainer.removeClass("has-error");
                            innerContainer.addClass("has-success");
                            setTimeout(function(){innerContainer.removeClass("has-success")},'1000');

                        }
                       checkLoader.hide();
                       inputField.removeAttr("disabled");
                    }
                });
            }
        });
        innerContainer.append(ftpContainer);
        mainContainer.append(innerContainer);
        return mainContainer;
    },
    minusDaysInput : function(paramName){
        var component = $("<input>").attr("type","number").attr("name",paramName).addClass("col-lg-4");
//        component.spinner();
        setTimeout(function(){component.spinner()},'50');
        return component;
    }
});
