$(function () {
    initDataGrid();
});
function submitForm() {
    //获取tree中选中的节点
    var nodes = $("#auth2Role-tree").tree("getChecked");
    var authIds = [];
    for(var i = 0; i < nodes.length; i++){
        authIds.push(nodes[i].id);
    }
    var roleId = $("#roleId").val();
    var formData = {
        roleId:roleId,
        authIds:authIds
    };
    $.ajax({
        url:path+"/role/grantAuth",
        method:"post",
        data:formData,
        traditional:true,//解决传递数组参数时出现的问题
        success:function (res) {
            if(res.msg){
                //关闭授权窗口
                $("#grantAuth2RoleWin").window("close");
            }
        }
    })
}
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
    // alert("haha");
    //两个输入框的内容、下拉列表的内容
    var formData = {
        roleName:$("#roleName").textbox("getValue"),
        roleCode:$("#roleCode").textbox("getValue"),
        valid:$("#valid").combobox("getValue")
    };
    // console.log(formData);
    $("#role-datagrid").datagrid("load",formData);
}
function initDataGrid() {
    $("#role-datagrid").datagrid({
        rownumbers:true,//显示行号
        singleSelect:true,//单选
        autoRowHeight:false,//自动行高
        pagination:true,//是否分页
        pageSize:10,//每页条数
        method:'post',
        fitColumns:true,
        fit:true,
        pageList:[3,5,8,10,20],
        url:path+'/role/queryRole',
        columns:[[{field:'roleName',title:'角色名称',width:100},
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
                formatter:function (value,row,index) {
                    return '<a href="javascript:void(0)" onclick="showGrantAuth2RoleWin('+value+')">授权</a>';
                },width:100}
        ]]
    });
}