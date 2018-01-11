$(function () {
    initDataGrid();
});
function submitForm() {
    var nodes = $("#role2User-dg").datagrid("getSelections");
    console.log(nodes);
}
function showGrantRole2UserWin(userId) {
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
function initDataGrid() {
    $("#user-datagrid").datagrid({
        rownumbers:true,//显示行号
        singleSelect:true,//单选
        autoRowHeight:false,//自动行高
        pagination:true,//是否分页
        pageSize:10,//每页条数
        method:'post',
        fit:true,
        fitColumns:true,
        pageList:[3,5,8,10,20],
        url:path+'/user/queryUser',
        columns:[[{field:'userName',title:'用户名',width:100},
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
                formatter:function (value,row,index) {
                    return '<a href="javascript:void(0)" onclick="showGrantRole2UserWin('+value+')">授予角色</a>';
                },width:100}
        ]]
    });
}