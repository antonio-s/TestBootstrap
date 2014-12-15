<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE HTML SYSTEM "about:legacy-compat">
<jsp:directive.page contentType="text/html;charset=UTF-8" />

<html xmlns:jsp="http://java.sun.com/JSP/Page"
      xmlns:c="http://java.sun.com/jsp/jstl/core"
      style="width: 100%;height: 100%">
    <head><meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/><meta content="IE=8" http-equiv="X-UA-Compatible"/></head><body style="width: 100%;height: 100%"><link rel="stylesheet" href="resources/css/bootstrap.min.css"/><link rel="stylesheet" href="resources/css/plugins/metisMenu/metisMenu.min.css"/><link rel="stylesheet" href="resources/css/plugins/timeline.css"/><link rel="stylesheet" href="resources/css/sb-admin-2.css"/><link rel="stylesheet" href="resources/css/plugins/morris.css"/><link type="text/css" rel="stylesheet" href="resources/font-awesome-4.1.0/css/font-awesome.min.css"/><script src="resources/js/jquery-1.11.0.js"></script><link href="resources/css/styles.css" rel="stylesheet"/><div id="wrapper"><nav style="margin-bottom: 0" role="navigation" class="navbar navbar-default navbar-static-top"><div class="navbar-header"><button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><span class="navbar-brand">Управление расписанием запуска скриптов (Заголов страницы из application.properties)</span></div><ul class="nav navbar-top-links navbar-right"><li class="icon-bar"><a href="j_spring_security_logout">Выйти</a></li></ul><div role="navigation" class="navbar-default sidebar"><div class="sidebar-nav navbar-collapse"><ul id="side-menu" class="nav"><li class="active"><a href="scripts">Все скрипты</a></li><li><a href="script/edit">Редактирования</a></li></ul></div></div></nav><div id="page-wrapper" version="2.0"><link type="text/css" rel="stylesheet" href="resources/css/typeahead.css"/><script src="resources/js/ScriptEdit.js"></script><script src="resources/js/plugins/typeahead.bundle.js"></script><div class="row"></div><div class="row col-lg-12"><div class="panel panel-success"><div class="panel-heading">
                            Тестовый скрипт (script1)
                        </div>
<div class="panel-body">
    <div class="panel ">
        <div class="panel-body">
            <form id="sriptParameters" action="script/edit/id1/save" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="form-group">
                        <!--<formtextarea iq="script_text" rows="20" path="value" htmlEscape="false" cssClass="form-control" />-->
                        <input name="file" type="file" alt="загрузить" class="file-inputs btn btn-primary" value="загрузить" title="Загрузить скрипт"/>
                        <script type="text/javascript">
                            $(document).ready(function(){
                                console.log("*************************************************");
                                $('.file-inputs').bootstrapFileInput();
                                $(".file_inputs").change(function(){
                                    console.log("file value has been changed");
//                                    if ()
                                     $('.file_inputs').attr("title","Заменить скрипт");

                                });
                            });
                        </script>
                    </div>
                    <div class="row">
                        <div class="col-lg-8">
                        <label>Логин автора скрипта</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3" style="padding-right:0px;">
                        <span class="input-group">
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span></span>
                        <input id="creator" name="creator" class="form-control" type="text" value="dn040485sas"/>
                        </span>
                        </div>
                        <div class="col-lg-2" style="padding-left:2px;">
                            <span class="label label-info">23:15</span>
                        </div>
                    </div>
                </div>
                <div id="scriptNameContainer" class="form-group">
                    <label for="name" class="control-label">Код скрипта</label>
                    <div class="bs-example">
                        <input id="name" name="name" class="form-control typeahead" type="text" value="script1" autocomplete="off" spellcheck="false"/>
                    </div>
                    <span class="help-block"></span>
                    <script type="text/javascript">
                $("#creator").attr("readonly", "readonly");

                var mySource = new Bloodhound({
                    datumTokenizer: function(d) {
                        return Bloodhound.tokenizers.whitespace(d.value);
                    },
                    queryTokenizer: Bloodhound.tokenizers.whitespace,
                    prefetch: {
                        url: "resources/js/existing-names.js",
                        filter: function(list) {
                            return $.map(list, function(word) {
                                return {value: word};
                            });
                        }
                    }
                });
                mySource.initialize();

                $(document).ready(function() {
                    console.log("typeahead is creating...");
                    $('#name').typeahead({
                        hint: true,
                        highlight: true
                    },
                    {
                        displayKey: 'value',
                        source: mySource.ttAdapter()
                    }).on('typeahead:autocompleted', function($e, datum) {
                        console.log('autocompleted');
                        showError("scriptNameContainer");
                    }).on('typeahead:selected', function($e, datum) {
                        console.log('selected');
                        console.log(datum);
                        showError("scriptNameContainer");
                    });
                    $("#name").bind("blur", function() {
                        console.log(JSON.stringify(mySource.index.datums));
                        var isExisting = false;
                        $.each(mySource.index.datums, function(key, value) {
                            if ($("#name").typeahead('val') === value["value"]) {
                                isExisting = true;
                            }
                        });
                        if (isExisting === true) {
                //                    $("#scriptNameContainer").valaddClass("has-error");
                            showError("scriptNameContainer", "Такой код уже есть");
                        } else {
                            hideError("scriptNameContainer");
                        }
                    });
                    $("#name").keypress(function() {
                        $("#scriptNameContainer").removeClass("has-error");
                    })
                });

                function showError(id, msg) {
                    $("#" + id).addClass("has-error");
                    $("#" + id + " .help-block").show();
                    $("#" + id + " .help-block").html(msg);
                }
                function hideError(id) {
                    $("#" + id).removeClass("has-error");
                    $("#" + id + " .help-block").hide();
                }
                    </script>
                </div>
                <div class="form-group">
                    <label for="shortDescription" class="control-label">Название скрипта</label><input id="shortDescription" name="shortDescription" class="form-control" type="text" value="Тестовый скрипт"/></div><div class="form-group"><label for="publisherId" class="control-label">Опубликовавший</label><input id="publisherId" name="lastModifier" class="form-control" type="text" value="dn040485sas"/></div><div class="form-group has-error"><label for="destChoiceContainer" class="control-label">тип выгрузки</label><br/><input id="destChoice" name="destinationType" name="destinationType" type="hidden" value="FTP"/><div id="destChoiceContainer" class="btn-group"><button class="btn btn-default dropdown-toggle" id="destChoiceButton" data-toggle="dropdown"><span id="destChoiceButtonText">Куда выгрузить</span><span class="caret"/></button><ul id="destChoiceList" class="dropdown-menu"></ul></div><script type="text/javascript">
                        $(window).bind("load", function() {
                            fillUpMenu("destChoiceList", "destChoice", downloadTypes, 'FTP');
                            $("#destChoice").bind("change", destTypeChangeListener);
                            destTypeChangeListener();
                    //                                        destTypeChangeListener();
                        })
                                                            </script></div>
<script type="text/javascript">
                                                               function hideAlert(alertId) {
                                                                   $("#" + alertId).delay(2000).slideUp(200, function() {
                                                                       $(this).alert('close');
                                                                   });
                                                               }
                                            </script></div><div style="padding-left: 0px; display: block;" id="scheduleGroup" class="form-group container-fluid"><div class="row"><div class="col-lg-12"><label for="scheduleType" class="control-label">Тип расписания</label><div class="container-fluid"><input id="scheduleType" name="scheduleType" type="hidden" value="weekly"/><div id="scheduleTypeContainer" class="btn-group"><button class="btn btn-default dropdown-toggle" id="scheduleTypeButton" data-toggle="dropdown"><span id="scheduleTypeButtonText">загрузка...</span><span class="caret"/></button><ul id="scheduleTypeList" class="dropdown-menu"/></div><label id="scheduleTypeSuffixLabel" for="scheduleTypeSuffix" class="control-label"></label><input id="scheduleTypeSuffix" name="scheduleTypeSuffix" type="hidden" value="1"/><div id="scheduleTypeSuffixContainer" class="btn-group"><button class="btn btn-default dropdown-toggle" id="scheduleTypeSuffixButton" data-toggle="dropdown"><span id="scheduleTypeSuffixButtonText">загрузка...</span><span class="caret"/></button><ul id="scheduleTypeSuffixList" class="dropdown-menu"/></div></div></div></div><script type="text/javascript">
                                                   $(window).bind("load", function() {
                                                       fillScheduleType('script/edit/menu/schedule/type', 'script/edit/menu/schedule/suffix', 'weekly', '1');
                                                       $("#scheduleType").bind("change", function() {
                                                           fillScheduleTypeSuffixData();
                                                       });
                                                   });
                                            </script>
                                            </div>
                                <input id="hibId" name="hibId" type="hidden" value="1"/>
                                <div class="input-group-btn">
                                    <div class="btn-group">
                                        <button value="save" name="save" class="btn btn-primary" type="submit">
                                            <span class="glyphicon glyphicon-save"/>Сохранить</button>
                                        <button class="btn btn-default" type="reset">
                                            <span class="glyphicon glyphicon-refresh"/>Сбросить</button>
                                        <button value="remove" name="remove" type="submit" class="btn btn-danger">
                                            <span class="glyphicon glyphicon-trash"/>удалить</button>
                                    </div></div>
                                </form></div>
                        </div></div></div>
            </div></div></div>
            <script src="resources/js/bootstrap.min.js"></script>
            <script src="resources/js/plugins/metisMenu/metisMenu.min.js"></script>
            <script src="resources/js/plugins/morris/raphael.min.js"></script>
            <script src="resources/js/sb-admin-2.js"></script>
            <script src="resources/js/bootstrap.file-input.js"><jsp:text/></script>
</body>
</html>