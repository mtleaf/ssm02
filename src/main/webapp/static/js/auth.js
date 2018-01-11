
    function  submitForm() {
        var formData =$("#authForm").form().serialize();
        console.log(formData);
        $.ajax({
            url:path+'/auth/update',
            method:'post',
            data:formData,
            success:function (res) {
                if(res.msg){
                    $("#w").window('close');
                    $("#auth-treegrid").treegrid("reload");
                }
            }
        })
    }
function onContextMenu(e,row){
    if (row){
        e.preventDefault();
        $(this).treegrid('select', row.dbid);
        $('#mm').menu('show',{
            left: e.pageX,
            top: e.pageY
        });
    }
}
function append(){
    $('#authForm').form('clear');
    var row= $("#auth-treegrid").treegrid("getSelected");
    $("#layer").textbox("setValue",row.layer+1);
    $("#parentName").textbox("setValue",row.authName);
    $("#parentId").val(row.dbid);
    $("#dbid").val(-1);
    $('#w').window({
            modal:true,
            close:true,
            width:300,
            height:400,
            title:'增加权限',
            collapsible:false,
            minimizable:false,
            maximizale:false
        }
    ).window('open')
}
function refreshAuth(){
    $('#auth-treegrid').treegrid("reload")
}
function edit(){
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
function refreshAuth(){
    $('#auth-treegrid').treegrid("reload")
}
    $(function () {
        $("#auth-treegrid").treegrid({
            url:path+"/auth/getAll",
            idField:"dbid",
            method:"get",
            fit:true,
            rownumbers:true,
            treeField:"authName",
            onContextMenu:onContextMenu,
            columns:[[{title:"权限名称",field:"authName",with:200},
                {title:"权限编码",field:"authCode"},
                {title:"URL",field:"authURL"},
                {title:"类型",field:"type",with:80,
                    formatter:function (value,row,index) {
                        if (value == '1'){
                            return '模块';
                        }else {
                            return '资源';
                        }
                    }
                },
                {title:"排序",field:"orders",with:80},
                {title:"是否有效",field:"valid",with:80,
                    formatter:function (value,row,index) {
                        if(value == '1'){
                            return '有效';
                        }else {
                            return '<span style="color: red">无效</span>'
                        }
                    }
                },
                {title:"层级",field:"layer",with:80}
            ]]
        })

    })
