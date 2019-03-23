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
    <legend  style="text-align: center">菜品视频录入</legend>
</fieldset>
<form class="layui-form" method="post">
    <div style="padding: 20px; background-color: #F2F2F2;">
        <label class="layui-form-label">视频名称</label>
        <div class="layui-input-block">
            <input type="text" id="foodName" name="foodName" lay-verify="title" autocomplete="off" placeholder="请输入视频标题" class="layui-input" style="width:25%">
        </div>
        <br/>
        <label class="layui-form-label">是否上架</label>
        <div class="layui-input-block">
            <input type="checkbox" id="flag" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
        </div>
        <br/>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">菜品描述</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入菜品描述信息，200字以内" id="foodDesc" class="layui-textarea" style="width:50%"></textarea>
            </div>
        </div>
        <label class="layui-form-label">封面图片</label>
        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test1">点击上传</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
                <p id="demoText"></p>
            </div>
        </div>
        <label class="layui-form-label">视频文件</label>
        <button type="button" class="layui-btn" id="test5"><i class="layui-icon"></i>点击上传</button>
        <div style="margin-top: 50px;"> </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" onclick="submit1()">立即提交</button>
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
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width:100px;height:100px;margin-left:10px"><input name="imgName" type="hidden" value="'+file.name+'"/>')
                });
            }
            ,done: function(res){
                //上传完毕
            }
        });

    });
    layui.use([ 'layedit', 'laydate'], function(){
        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

    });
    function submit1(){
        var foodName = $("#foodName").val(),
                foodPrice = $("#foodPrice").val(),
                flag = $("#flag").val(),
                foodDesc = $("#foodDesc").val();
        var pic =[];
        $("#demo2 input[name='imgName']").each(function(){
            pic.push($(this).val())
        });
        $.ajax({
            type:"POST",
            url:'<%=contextPath%>/foodInfo/addFood',
            data:{foodName:$("#foodName").val(),
                foodPrice:$("#foodPrice").val(),
                flag:$("#flag").val(),
                foodDesc:$("#foodDesc").val(),
                pic:pic},
            dataType:"json",
            success:function(data){
                alert(data)
            }

        })

    }
</script>
</body>
</html>
