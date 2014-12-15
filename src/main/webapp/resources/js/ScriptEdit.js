///* 
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
//function setDropDownFtpValue(idText,text,idValue,value){
//    $("#"+idText).text(text);
//    $("#"+idValue).val(value).trigger("change");
//}
//
///**
// * Mthod for setting value for a drop menu.
// * @param {type} value value for the drop-menu in json format : {value:name}
// * @param {type} id ID of the element (or prefix of ids of group of elements)
// * @param {type} postFunction function that must be invoked after setting uo the value
// * @returns {undefined}
// */
//function setDropDowValue(value,id,postFunction){
//    $("#"+id+"ButtonText").text(value.name);
//    $("#"+id).val(value).trigger("change");
//    if (postFunction){
//        postFunction();
//    }
//}
//                                    
//
///**
// * 
// * @param String id ID if an element wich must be filled up
// * @param JSON data - collection of {value : {"value": value ,"name":name}...} where each value is a key, and json with value and name is a value
// * @param Object value selected value
// * @returns {undefined}
// */
//function fillDropDownMenu(id,data){
//    $.each(data,function(key,value){
//        $("#"+id)
//        .append($(document.createElement("li"))
//            .append($(document.createElement("a"))
//            .attr("href","javascript:setDropDowValue('"+value.value+"','scheduleTypeSuffix',scheduleTypeSuffixData[$(\"#scheduleType\").val()].values["+key+"])")
//            .text(value.name)));
//    })
//}
var downloadTypes= {"FTP":{"value":"FTP","name":"FTP","nameText":"Адрес FTP"},"TABLE":{"value":"TABLE","name":"Таблица","nameText":"Имя таблицы"}};
var fileTypes = {"dbf" : {"value" : "dbf","name":"dbf"},"txt":{"value":"dbf","name":"txt"}};
var scheduleTypeData = null;
var scheduleTypeSuffixData = null;


function fillScheduleType(typeUrl,typeSuffixUrl,defaultValue,defaultTypeSuffix){
    if (!scheduleTypeData){
    $.ajax({
           type: 'GET',
           cache: false,
           url: typeUrl,
           success : function(data) {
               scheduleTypeData = data;
               fillUpMenu('scheduleTypeList','scheduleType',data,defaultValue);
               fillScheduleTypeSuffixData(typeSuffixUrl,defaultTypeSuffix);
           }
       });
   }else{
    fillUpMenu('scheduleTypeList','scheduleType',scheduleTypeData,defaultValue);
    fillScheduleTypeSuffixData(defaultTypeSuffix);
   }
}

function fillScheduleTypeSuffixData(typeSuffixUrl,defaultValue){
    if (!scheduleTypeSuffixData){
        if (typeSuffixUrl){
            $.ajax({    
                type: 'GET',
                cache: false,
                url: typeSuffixUrl,
                success : function(newData) {
                   scheduleTypeSuffixData = newData;
                   var ctrlValue = $("#scheduleType").val();
                   fillUpMenu('scheduleTypeSuffixList','scheduleTypeSuffix',newData[ctrlValue].values,defaultValue)    
                }
            });
        }
    }else{
        fillUpMenu('scheduleTypeSuffixList','scheduleTypeSuffix',scheduleTypeSuffixData[$("#scheduleType").val()].values,defaultValue);
    }
    
}



function showErrorMessage(msg,title){
    alert(msg);
}

/**
 * 
 * @param {type} data
 * @param {type} initValue
 * @param {type} ctrlValues {'ctrl1_id' : 'value',...}
 * @returns {undefined}
 */
function fillUpMenu(selectId,valueContainerId,data,initValue,drawFunc){
    console.log("fillUp a drop-list '"+selectId+"'...");
    $("#"+selectId).empty();
    $.each(data,function(key,value){
        var itemEnabled = false;
        var item = value;
        console.log("processing '"+item.name+"'...");
        if (item.deps){
            $.each(item.deps,function(key,value){
                var ctrlVal = $("#"+key).val();
                itemEnabled = itemEnabled|(ctrlVal&&ctrlVal===value);
            });
        }else{
            itemEnabled = true;
        }
        console.log("item is enabled -> "+itemEnabled);
        if (itemEnabled === true){
            if (drawFunc){
                drawFunc.call(item);
            }else{
                drawDefaultFunc(selectId,item,valueContainerId);
            }
        }
    });
    if (initValue && initValue!==""){
        console.log("trying to set initValue --> "+initValue+"   = "+data[initValue]);
        setDropDownValueNew(data[initValue].value,data[initValue].name,valueContainerId);
    }
}

function drawDefaultFunc(selectId,item,valueContainerId){
    $("#"+selectId)
            .append($(document.createElement("li"))
                .append($(document.createElement("a"))
                .attr("href","javascript:setDropDownValueNew('"+item.value+"','"+item.name+"','"+valueContainerId+"');")
                .text(item.name)));
}

function setDropDownValueNew(value,title,idPrefix,postFunction){
    $("#"+idPrefix+"ButtonText").text(title);
    $("#"+idPrefix).val(value).trigger("change");
    if (postFunction){
        postFunction.call();
    }
}

function destTypeChangeListener(){
    if ($("#destChoice").val()==='TABLE'){
        $("#table_group").show();
        $("#ftp_group").hide();
    }else{
        $("#table_group").hide();
        $("#ftp_group").show();
    }
}

