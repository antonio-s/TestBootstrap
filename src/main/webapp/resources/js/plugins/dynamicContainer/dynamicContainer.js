/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
        return $("<span></span>")
                .append($("<label></label>").text("тестовый текст")
                );
    },
    _create : function(){
        var container = $("<div>");
        this.options.container = container;
        this.element.append(container);
        var button = $("<button></button>").addClass("btn btn-success btn-sm").append($("<i></i>").addClass("fa fa-plus-circle")).attr("type","button");
        var obj = this;
        button.click(function(event){
            obj.addComponent();
            event.preventDefault();
        });
        this.element.append(button);
    },
    addComponent : function(){
        if (this.options.componentGenerator === null){
            console.log("componentGenerator should be initialized before using!");
            return this;
        }
        var slot = $("<div>").addClass("row");
        var component = $("<div>").append(this.options.componentGenerator.createComponent());
        var minusButton = $("<div>");
        this.options.container.append(slot);
        slot
            .append(component)
            .append(
                minusButton
                    .append($("<button></button>").attr("type","button")
                        .addClass("btn btn-xs btn-danger")
                        .append($("<i></i>").addClass("fa fa-minus"))
                        .click(function(event){
                            console.log("removing slot.....");
                            slot.remove();
                        })
                        ));

        return this;
    }

});
