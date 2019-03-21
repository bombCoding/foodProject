<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend  style="text-align: center">菜品信息录入</legend>
</fieldset>
<form class="layui-form" method="post">
    <div style="padding: 20px; background-color: #F2F2F2;">
        <label class="layui-form-label">菜品名称</label>
        <div class="layui-input-block">
            <input type="text" name="foodName" lay-verify="title" autocomplete="off" placeholder="请输入菜品名称" class="layui-input" style="width:50%">
        </div>
        <br/>
        <label class="layui-form-label">菜品价格</label>
        <div class="layui-input-block">
            <input type="text" name="foodPrice" lay-verify="title" autocomplete="off" placeholder="请输入菜品单价" class="layui-input"  style="width:50%">
        </div>
        <br/>
        <label class="layui-form-label">是否上架</label>
        <div class="layui-input-block">
            <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
        </div>
        <br/>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">菜品描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入菜品描述信息" class="layui-textarea" style="width:50%"></textarea>
            </div>
        </div>
        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test2">多图片上传</button>
            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                预览图：
                <div class="layui-upload-list" id="demo2"></div>
            </blockquote>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>

<script src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use('upload', function(){
        var $ = layui.jquery
                ,upload = layui.upload;

        //多图片上传
        upload.render({
            elem: '#test2'
            ,url: '/upload/'
            ,multiple: true
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width:100px;height:100px;margin-left:10px">')
                });
            }
            ,done: function(res){
                //上传完毕
            }
        });

    });
    layui.use(['form', 'layedit', 'laydate'], function(){
        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

    });

</script>
</body>
</html>
