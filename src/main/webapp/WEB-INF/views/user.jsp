<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/22
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>role</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/demo/demo.css">
    <script type="text/javascript" src="${path}/static/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${path}/static/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        function addRole(){
            var row= $("#auth-treegrid").treegrid("getSelected");
            var parent= $("#auth-treegrid").treegrid("getParent",row.dbid);
            $("#parentName").textbox("setValue",parent.authName);
            $("#layer").textbox("setValue",row.layer);
            $("#authName").textbox("setValue",row.authName);
            $("#authCode").textbox("setValue",row.authCode);
            $("#authURL").textbox("setValue",row.authURL);
            $("#orders").textbox("setValue",row.orders);
            $("#type").combobox("setValue",row.type);
            $("#valid").combobox("setValue",row.valid);
            $("#parentId").val(row.parentId);
            $("#dbid").val(row.dbid);
            $('#w').window({
                    modal:true,
                    close:true,
                    width:300,
                    height:400,
                    title:'编辑权限',
                    collapsible:false,
                    minimizable:false,
                    maximizale:false
                }
            ).window('open')
        }
        var path='${path}'
        $(function initDataGrid(){
            $('#udg').datagrid({
                url:path+'/user/queryUser',
                rownumbers:true,
                singleSelect:true,
                autoRowHeight:false,
                <%--是否分页--%>
                pagination:true,
                fitColumns:true,
                method:'get',
                pageSize:5,
                pageNumber:1,
                pageList:[5,10,20],
                columns:[[
                    {field:'userName',title:'用户名',width:100},
                    {field:'realName',title:'真实姓名',width:100},
                    {field:'valid',title:'是否有效',
                        formatter:function (value,row,index) {
                            if(value == '1'){
                                return '有效';
                            }else{
                                return '<span style="color: red">无效</span>';
                            }
                        },width:100},
                    {field:'dbid',title:'授予角色',
                        formatter: function (value, row, index) {
                            return '<a href="javascript:void(0)" onclick="showGrantAuth2RoleWin(' + value + ')">授予角色</a>';
                        }, width: 100
                    },
                ]]
            })
        });
      /*  function showGrantAuth2RoleWin(roleId) {
            $("#roleId").val(roleId);
            // console.log(roleId);
            //显示授权的窗口
            //窗口中权限前边的复选框是否选中应该通过角色id进行查询来决定
            $("#auth2Role-tree").tree({
                url:path+"/user/getValidAuth?userId="+userId,
                method:"get",
                checkbox:true,
                cascadeCheck:false
            });
            $("#grantAuth2RoleWin").window({
                iconCls:'icon-save',
                footer:'#footer',
                modal:true,
                width:300,
                height:400,
                collapsible:false,
                minimizable:false,
                maximizable:false,
                resizable:false
            }).window("open");
        }*/
        function showGrantAuth2RoleWin(userId) {
            $("#userId").val(userId);
            $("#role2User-dg").datagrid({
                url:path+"/user/queryValidRole?userId="+userId,
                method:"get",
                rownumbers:true,
                columns:[[{field:"dbid",checkbox:true},
                    {field:"roleName",title:"角色名称",width:100},
                    {field:"roleCode",title:"角色编码",width:100}]],
                onLoadSuccess:function (data) {//数据加载完成时执行
                    var rows = data.rows;
                    for(var i = 0; i < rows.length; i++){
                        if(rows[i].checked){
                            //此行应该被选中
                            $(this).datagrid("selectRow",i);
                        }
                    }
                }
            });
            $("#grantRole2UserWin").window({
                iconCls:'icon-save',
                footer:'#footer',
                modal:true,
                width:300,
                height:400,
                collapsible:false,
                minimizable:false,
                maximizable:false,
                resizable:false
            }).window("open");
        }
        function searchUser() {
            var data = {
                userName:$("#userName").textbox("getValue"),
                realName:$("#realName").textbox("getValue"),
                valid:$("#valid").textbox("getValue")
            };
            $("#udg").datagrid("load",data);
        }
        function submitForm() {
            var nodes = $("#role2User-dg").datagrid("getSelections");
            var roleIds=[];
            for(var i=0;i<nodes.length;i++){
                roleIds.push(nodes[i].dbid);
            }
            var userId=$("#userId").val();
          //  console.log(roleIds);
           // console.log(userId);
            var formData={
                userId:userId,
                roleIds:roleIds
            }
            $.ajax({
                url:path+"/user/grantRole",
                method:"post",
                data:formData,
                traditional:true,
                success:function(res){
                    if(res.msg){
                        console.log(res);
                        $("#grantRole2UserWin").window("close");
                    }
                }
            })
        }
        /*function submitForm() {
            var nodes= $("#auth2Role-tree").tree("getChecked");
            var authIds=[];
            for(var i=0;i<nodes.length;i++){
                authIds.push(nodes[i].id);
            }
            var roleId=$("#roleId").val();
            /!*    console.log(roleId);;
                  console.log(authIds);*!/
            var formData={
                roleId:roleId,
                authIds:authIds
            };
            $.ajax({
                url:path+"/role/grantAuth",
                method:"post",
                data:formData,
                traditional:true,
                success:function (res) {
                    if(res.msg){
                        $("#grantAuth2RoleWin").window("close");
                    }
                }

            })
        }*/
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:50px;padding:10px">
    <input class="easyui-textbox" id="userName" name="userName" style="width:15%;margin-right: 10px" data-options="prompt:'用户名'">&nbsp;&nbsp;&nbsp;
    <input class="easyui-textbox" id="realName" name="realName" style="width:15%;margin-right: 10px" data-options="prompt:'真实姓名'">&nbsp;&nbsp;&nbsp;
    <select class="easyui-combobox" id="valid" name="valid" style="width:15%;margin-right: 10px">
        <option value="1">有效</option>
        <option value="0">无效</option>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="#" class="easyui-linkbutton" onclick="searchUser()" data-options="iconCls:'icon-search'">搜索</a>&nbsp;&nbsp;&nbsp;
    <a href="#"class="easyui-linkbutton"  data-options="iconCls:'icon-add'">添加</a>
</div>
<div data-options="region:'center',title:''">
    <table id="udg" title="Client Side Pagination" style="width:700px;height:300px" >
    </table>
    <div id="grantRole2UserWin" title="授予角色窗口" style="padding:10px;">
        <input type="hidden" id="userId"/>
        <table id="role2User-dg"></table>
    </div>
    <div id="footer" align="center" style="padding:5px;">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="submitForm()" style="width:80px">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="clearForm()" style="width:80px">取消</a>
    </div>
</div>

</body>
</html>
