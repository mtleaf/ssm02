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
     /*   (function($){
            function pagerFilter(data){
                if ($.isArray(data)){	// is array
                    data = {
                        total: data.length,
                        rows: data
                    }
                }
                var target = this;
                var dg = $(target);
                var state = dg.data('datagrid');
                var opts = dg.datagrid('options');
                if (!state.allRows){
                    state.allRows = (data.rows);
                }
                if (!opts.remoteSort && opts.sortName){
                    var names = opts.sortName.split(',');
                    var orders = opts.sortOrder.split(',');
                    state.allRows.sort(function(r1,r2){
                        var r = 0;
                        for(var i=0; i<names.length; i++){
                            var sn = names[i];
                            var so = orders[i];
                            var col = $(target).datagrid('getColumnOption', sn);
                            var sortFunc = col.sorter || function(a,b){
                                return a==b ? 0 : (a>b?1:-1);
                            };
                            r = sortFunc(r1[sn], r2[sn]) * (so=='asc'?1:-1);
                            if (r != 0){
                                return r;
                            }
                        }
                        return r;
                    });
                }
                var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
                var end = start + parseInt(opts.pageSize);
                data.rows = state.allRows.slice(start, end);
                return data;
            }

            var loadDataMethod = $.fn.datagrid.methods.loadData;
            var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
            $.extend($.fn.datagrid.methods, {
                clientPaging: function(jq){
                    return jq.each(function(){
                        var dg = $(this);
                        var state = dg.data('datagrid');
                        var opts = state.options;
                        opts.loadFilter = pagerFilter;
                        var onBeforeLoad = opts.onBeforeLoad;
                        opts.onBeforeLoad = function(param){
                            state.allRows = null;
                            return onBeforeLoad.call(this, param);
                        }
                        var pager = dg.datagrid('getPager');
                        pager.pagination({
                            onSelectPage:function(pageNum, pageSize){
                                opts.pageNumber = pageNum;
                                opts.pageSize = pageSize;
                                pager.pagination('refresh',{
                                    pageNumber:pageNum,
                                    pageSize:pageSize
                                });
                                dg.datagrid('loadData',state.allRows);
                            }
                        });
                        $(this).datagrid('loadData', state.data);
                        if (opts.url){
                            $(this).datagrid('reload');
                        }
                    });
                },
                loadData: function(jq, data){
                    jq.each(function(){
                        $(this).data('datagrid').allRows = null;
                    });
                    return loadDataMethod.call($.fn.datagrid.methods, jq, data);
                },
                deleteRow: function(jq, index){
                    return jq.each(function(){
                        var row = $(this).datagrid('getRows')[index];
                        deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                        var state = $(this).data('datagrid');
                        if (state.options.loadFilter == pagerFilter){
                            for(var i=0; i<state.allRows.length; i++){
                                if (state.allRows[i] == row){
                                    state.allRows.splice(i,1);
                                    break;
                                }
                            }
                            $(this).datagrid('loadData', state.allRows);
                        }
                    });
                },
                getAllRows: function(jq){
                    return jq.data('datagrid').allRows;
                }
            })
        })(jQuery);

        function getData(){
            var rows = [];
            for(var i=1; i<=800; i++){
                var amount = Math.floor(Math.random()*1000);
                var price = Math.floor(Math.random()*1000);
                rows.push({
                    inv: 'Inv No '+i,
                    date: $.fn.datebox.defaults.formatter(new Date()),
                    name: 'Name '+i,
                    amount: amount,
                    price: price,
                    cost: amount*price,
                    note: 'Note '+i
                });
            }
            return rows;
        }*/
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
     /*function initDataGrid() {
         $("#dg").datagrid({
             rownumbers: true,//显示行号
             singleSelect: true,//单选
             autoRowHeight: false,//自动行高
             pagination: true,//是否分页
             pageSize: 10,//每页条数
             method: 'post',
             fitColumns: true,
             fit: true,
             pageList: [3, 5, 8, 10, 20],
             url: path + '/role/getAll',
             columns: [[{field: 'roleName', title: '角色名称', width: 100},
                 {field: 'roleCode', title: '角色编码', width: 100},
                 {
                     field: 'valid', title: '是否有效',
                     formatter: function (value, row, index) {
                         if (value == '1') {
                             return '有效';
                         } else {
                             return '<span style="color: red">无效</span>';
                         }
                     }, width: 100
                 },
                 {field: 'orders', title: '排序', width: 100},
                 {
                     field: 'dbid', title: '授权',
                     formatter: function (value, row, index) {
                         return '<a href="javascript:void(0)" onclick="showGrantAuth2RoleWin(' + value + ')">授权</a>';
                     }, width: 100
                 }
             ]]
         });
     }*/
        $(function initDataGrid(){
            $('#dg').datagrid({
                url:path+'/role/getAll',
                rownumbers:true,
                singleSelect:true,
                autoRowHeight:false,
               <%--是否分页--%>
                pagination:true,
                fitColumns:true,
                method:'get',
                pageSize:2,
                pageNumber:1,
                pageList:[2,3,5],
                columns:[[
                    {field:'roleName',title:'角色名称',width:100},
                    {field:'roleCode',title:'角色编码',width:100},
                    {field:'valid',title:'是否有效',
                        formatter:function (value,row,index) {
                        if(value == '1'){
                            return '有效';
                        }else{
                            return '<span style="color: red">无效</span>';
                        }
                    },width:100},
                    {field:'orders',title:'排序',width:100},
                    {field:'dbid',title:'授权',
                        formatter: function (value, row, index) {
                            return '<a href="javascript:void(0)" onclick="showGrantAuth2RoleWin(' + value + ')">授权</a>';
                        }, width: 100
                    },
                ]]
            })
        });
     function showGrantAuth2RoleWin(roleId) {
         $("#roleId").val(roleId);
         // console.log(roleId);
         //显示授权的窗口
         //窗口中权限前边的复选框是否选中应该通过角色id进行查询来决定
         $("#auth2Role-tree").tree({
             url:path+"/role/getValidAuth?roleId="+roleId,
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
     }
     function searchRole() {
         var data = {
             roleName:$("#roleName").textbox("getValue"),
             roleCode:$("#roleCode").textbox("getValue"),
             valid:$("#valid").textbox("getValue")
         };
         $("#dg").datagrid("load",data);
     }
     function submitForm() {
        var nodes= $("#auth2Role-tree").tree("getChecked");
         var authIds=[];
        for(var i=0;i<nodes.length;i++){
            authIds.push(nodes[i].id);
        }
        var roleId=$("#roleId").val();
   /*    console.log(roleId);;
         console.log(authIds);*/
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
     }
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:50px;padding:10px">
    <input class="easyui-textbox" id="roleName" name="roleName" style="width:15%;margin-right: 10px" data-options="prompt:'权限名称'">&nbsp;&nbsp;&nbsp;
    <input class="easyui-textbox" id="roleCode" name="roleCode" style="width:15%;margin-right: 10px" data-options="prompt:'权限编码'">&nbsp;&nbsp;&nbsp;
    <select class="easyui-combobox" id="valid" name="valid" style="width:15%;margin-right: 10px">
        <option value="1">有效</option>
        <option value="0">无效</option>
    </select>&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="#" class="easyui-linkbutton" onclick="searchRole()" data-options="iconCls:'icon-search'">搜索</a>&nbsp;&nbsp;&nbsp;
    <a href="#"class="easyui-linkbutton"  data-options="iconCls:'icon-add'">添加</a>
</div>
<div data-options="region:'center',title:''">
    <table id="dg" title="Client Side Pagination" style="width:700px;height:300px" >
    </table>
    <div id="grantAuth2RoleWin" title="授予权限窗口" style="padding:10px;">
        <input type="hidden" id="roleId"/>
        <ul id="auth2Role-tree"></ul>
    </div>
    <div id="footer" align="center" style="padding:5px;">
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="submitForm()" style="width:80px">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="clearForm()" style="width:80px">取消</a>
    </div>
</div>

</body>
</html>
