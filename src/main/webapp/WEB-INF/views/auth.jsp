<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>auth</title>
    <script type="text/javascript" src="${path}/static/js/auth.js"></script>
</head>
<body>
<table  id="auth-treegrid" >
</table>
<div id="mm" class="easyui-menu" style="width:120px;">
    <div onclick="append()" data-options="iconCls:'icon-add'">增加</div>
    <div onclick="edit()" data-options="iconCls:'icon-edit'" >编辑</div>
    <div onclick="refreshAuth()" data-options="iconCls:'icon-reload'" >刷新</div>
    <%--<div class="menu-sep"></div>
    <div onclick="collapse()">Collapse</div>
    <div onclick="expand()">Expand</div>--%>
</div>
<%--<div style="margin:10px 0;">
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#w').window('open')">Open</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#w').window('close')">Close</a>
</div>--%>
<div id="w"  style="padding:10px;">
    <form id="authForm" method="post">
        <input type="hidden" name="dbid" id="dbid">
        <input type="hidden" name="parentId" id="parentId">
        <div style="margin-bottom:10px">
            <input class="easyui-textbox"id="authName" name="authName" style="width:100%" data-options="label:'类型名称:',required:true">
        </div>
        <div style="margin-bottom:10px">
            <input class="easyui-textbox"id="layer" name="layer" style="width:100%" data-options="label:'层级:',readOnly:true">
        </div>
        <div style="margin-bottom:10px">
            <input class="easyui-textbox"id="parentName" name="parentName" style="width:100%" data-options="label:'父类名称:'">
        </div>
        <div style="margin-bottom:10px">
            <input class="easyui-textbox"id="authCode" name="authCode" style="width:100%" data-options="label:'权限编码:'">
        </div>
        <div style="margin-bottom:10px">
            <input class="easyui-textbox"id="authURL" name="authURL" style="width:100%" data-options="label:'地址:'">
        </div>
        <div style="margin-bottom:10px">
            <input class="easyui-textbox"id="orders" name="orders" style="width:100%" data-options="label:'排序:'">
        </div>

        <div style="margin-bottom:10px">
            <select class="easyui-combobox" data-options= "panelHeight:'50px',editable:false"name="valid"  id="valid" label="是否有效" style="width:100%">
                <option value="1">有效</option>
                <option value="0">无效</option>
            </select>
        </div>
        <div style="margin-bottom:10px">
            <select class="easyui-combobox" data-options= "panelHeight:'50px',editable:false" name="type"  id="type" label="类型" style="width:100%">
                <option value="1">模块</option>
                <option value="2">资源</option>
            </select>
        </div>
    </form>
    <div style="text-align:center;padding:5px 0">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">Submit</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">Clear</a>
    </div>
</div>

<%--<script type="text/javascript">
    function formatProgress(value){
        if (value){
            var s = '<div style="width:100%;border:1px solid #ccc">' +
                '<div style="width:' + value + '%;background:#cc0000;color:#fff">' + value + '%' + '</div>'
            '</div>';
            return s;
        } else {
            return '';
        }
    }
    function onContextMenu(e,row){
        if (row){
            e.preventDefault();
            $(this).treegrid('select', row.id);
            $('#mm').menu('show',{
                left: e.pageX,
                top: e.pageY
            });
        }
    }
    var idIndex = 100;
    function append(){
        idIndex++;
        var d1 = new Date();
       // var d2 = new Date();
//
        var node = $('#tg').treegrid('getSelected');
        $('#tg').treegrid('append',{
            parent: node.id,
            data: [{
                id: idIndex,
                name: 'New Task'+idIndex,
                size:idIndex+'M',
                //persons: parseInt(Math.random()*10),
                date: $.fn.datebox.defaults.formatter(d1)
              //  end: $.fn.datebox.defaults.formatter(d2),
               // progress: parseInt(Math.random()*100)
            }]
        })
    }
    function removeIt(){
        var node = $('#tg').treegrid('getSelected');
        if (node){
            $('#tg').treegrid('remove', node.id);
        }
    }
    function collapse(){
        var node = $('#tg').treegrid('getSelected');
        if (node){
            $('#tg').treegrid('collapse', node.id);
        }
    }
    function expand(){
        var node = $('#tg').treegrid('getSelected');
        if (node){
            $('#tg').treegrid('expand', node.id);
        }
    }
</script>--%>
</body>
</html>
