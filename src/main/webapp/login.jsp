<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <title>登录</title>
    <link href="static/css/bootstrap.min.css" title="" rel="stylesheet" />
    <link title="orange" href="static/css/login.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/demo/demo.css">
    <script type="text/javascript" src="${path}/static/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${path}/static/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        var path='${path}'
        function  login() {
            var username=$("#username").val();
            var password=$("#password").val();
            var formData={
                userName:username,
                password:password
            };
            $.ajax({
                url:path+"/user/login",
                method:"post",
                data:formData,
                success:function (res) {
                   if(res.msg){
                       location=path+"/main";
                   }
                   else{
                       $.messager.alert("错误提示","登陆失败","error");
                   }
                }
            })
        }
    </script>

</head>

<body>

<div style="height:1px;"></div>
<div class="login">
    <header>
        <h1>登录</h1>
    </header>
    <div class="sr">
        <form>
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-user"></i>
                </label>
                <input type="text" id="username"  placeholder="这里输入登录名" class="name_inp"/>
            </div>
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-pencil"></i>
                </label>
                <input type="text" id="password" placeholder="这里输入登录密码" class="name_inp"/>
            </div>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="login()" style="width: 100px;height: 30px;text-align: center">登录</a>
            <%--<button class="dl" onclick="login()">登录</button>--%>
        </form>
    </div>
</div>

</body>
</html>
