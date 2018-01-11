<%@ page import="com.hwua.ssm.entity.Auth" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>RBAC</title>
    <meta charset="UTF-8">
    <title>Full Layout - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/jquery-easyui-1.5.3/demo/demo.css">
    <script type="text/javascript" src="${path}/static/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/static/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function () {

            var treeData=[{
                "id":1,
                "text":"My Documents",
                "children":[{
                    "id":11,
                    "text":"Photos",
                    "state":"closed",
                    "children":[{
                        "id":111,
                        "text":"Friend",
                        "url":"auth/toMain"
                    },{
                        "id":112,
                        "text":"Wife",
                        "url":"role/toMain"
                    },{
                        "id":113,
                        "text":"Company",
                        "url":"user/toMain"
                    }]
                },{
                    "id":12,
                    "text":"Program Files",
                    "children":[{
                        "id":121,
                        "text":"Intel"
                    },{
                        "id":122,
                        "text":"Java",
                        "attributes":{
                            "p1":"Custom Attribute1",
                            "p2":"Custom Attribute2"
                        }
                    },{
                        "id":123,
                        "text":"Microsoft Office"
                    },{
                        "id":124,
                        "text":"Games",
                        "checked":true
                    }]
                },{
                    "id":13,
                    "text":"index.html"
                },{
                    "id":14,
                    "text":"about.html"
                },{
                    "id":15,
                    "text":"welcome.html"
                }]
            }]
            $("#my-tree").tree({
               data:treeData,
               onClick:function (node) {
                   if(!node.children){
                       if($("#main-tab").tabs("exists",node.text)){
                           $("#main-tab").tabs("select",node.text);
                       }else{
                        //   alert(node.url),
                           $("#main-tab").tabs(
                               "add",{
                                   title:node.text,
                                   content:"<iframe width='100%' height='100%' frameborder='0' " +
                                   " src="+node.url+"/>",
//                                   content:"<h1>哈哈哈</h1>",
                                   closable:true,
                               }
                           );
                       }

                   }
               }
            });
        });
    </script>
</head>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">人力资源管理系统</div>
<div data-options="region:'west',split:false,title:'系统功能'" style="width:150px;">
    <div class="easyui-accordion"  data-options="fit:true">
      <%--  <div title="Help">
            <ul id="my-tree">
            </ul>
        </div>--%>
        <%--<div title="About" data-options="state:'closed'">
            <ul class="easyui-tree" data-options="url:'${path}/static/temp/tree_data1.json',method:'get',animate:true"></ul>
        </div>
        <div title="Help">
            <ul id="my-tree">
            </ul>
        </div>--%>
        <%--<div title="TreeMenu"  >
            <ul class="easyui-tree">
                <li>
                    <span>Foods</span>
                    <ul>
                        <li>
                            <span>Fruits</span>
                            <ul>
                                <li>apple</li>
                                <li>orange</li>
                            </ul>
                        </li>
                        <li>
                            <span>Vegetables</span>
                            <ul>
                                <li>tomato</li>
                                <li>carrot</li>
                                <li>cabbage</li>
                                <li>potato</li>
                                <li>lettuce</li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>--%>
        <c:forEach items="${sessionScope.auths}" var="auth">
                <div title="${auth.authName}">
                    <ul  id="tree-${auth.dbid}"></ul>
                    <script type="text/javascript">
                        <%
                        Auth auth = (Auth)pageContext.getAttribute("auth");
                        String json = JSON.toJSONString(auth.getChildren());
                        pageContext.setAttribute("json",json);
                        %>
                        var treeData='${json}';
                        treeData=JSON.parse(treeData);
                        console.log(treeData);
                        var path='${path}';
                        $("#tree-${auth.dbid}").tree({
                            data:treeData,
                            onClick:function (node) {
                                if(node.children.length==0){
                                    console.log(1);
                                    if($("#main-tab").tabs("exists",node.text)){
                                        $("#main-tab").tabs("select",node.text);
                                        console.log(2);
                                    }else{
                                        //   alert(node.url),
                                        console.log(3);
                                        $("#main-tab").tabs(
                                            "add",{
                                                title:node.text,
                                                content:"<iframe width='100%' height='100%' frameborder='0' " +
                                                " src="+path+node.authURL+"/>",
//                                   content:"<h1>哈哈哈</h1>",
                                                closable:true,
                                            }
                                        );
                                    }

                                }
                            }
                        })
                    </script>
                </div>
        </c:forEach>
    </div>

</div>
<%--<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>--%>
<div data-options="region:'center',title:'业务面板'">
    <div id="main-tab" class="easyui-tabs" data-options="fit:true"></div>
</div>
</body>
</html>
