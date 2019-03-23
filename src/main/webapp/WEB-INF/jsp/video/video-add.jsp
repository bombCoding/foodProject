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
            <div class="layui-upload-list" style="margin-left: 120px;">
                <img class="layui-upload-img" id="demo1">
                <p id="demoText"></p>
            </div>
        </div>
        <label class="layui-form-label">视频文件</label>
        <button type="button" class="layui-btn" id="test5"><i class="layui-icon"></i>点击上传</button>
        <div style="margin-top: 50px;"> </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="formDemo">提交修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>

<script src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;
        form.render();
        //监听提交点击事件
        form.on('submit(formDemo)', function (data) {
            ///像服务端发送请求
            $.ajax({
                url: '<%=contextPath%>/video/addOrUpdate',
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

    layui.use('upload', function(){
        var $ = layui.jquery,upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/upload/'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        //视频
        upload.render({
            elem: '#test5'
            ,url: '/upload/'
            ,accept: 'video' //视频
            ,done: function(res){
                console.log(res)
            }
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
