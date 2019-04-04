<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=contextPath%>/layui/css/layui.css" media="all">
    <script type="text/javascript" src="<%=contextPath%>/static/jquery-2.1.3.min.js"></script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="text-align: center">添加公告</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <form class="layui-form" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">公告标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">公告内容</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" name="noticeInfo" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 150px">
                <button class="layui-btn" lay-submit lay-filter="formDemo"
                        style="margin-left: 120px">提交信息
                </button>
            </div>
        </form>
    </div>
</div>
<script src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
        //监听提交点击事件
        form.on('submit(formDemo)', function (data) {
            ///像服务端发送请求
            $.ajax({
                url: '<%=contextPath%>/notice/addOrUpdate',
                type: 'POST',
                data: JSON.stringify(data.field),
                contentType: 'application/json',  //数据类型格式
                success: function (result) {
                    if (result.code == 0) {
                        layer.msg('添加成功！', {time: 1 * 1000}, function () {
                            location.href = "<%=contextPath%>" + result.data;
                        });
                    } else {
                        alert("添加失败！");
                    }
                },
                error: function (errorMsg) {
                    alert("数据异常！" + errorMsg);
                }
            });
            return false;
        });
    });
</script>
</body>
</html>