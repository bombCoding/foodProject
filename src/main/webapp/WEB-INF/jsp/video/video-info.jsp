<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+contextPath+"/";
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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="text-align: center">视频管理界面</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">视频信息列表</div>
                <form action="" method="post">
                    <table id="demo" lay-filter="test"></table>
                </form>
            </div>
        </div>
    </div>
</div>

<%--隐藏编辑弹窗表单--%>
<div class="layui-row" id="popUpdateEmp" style="display:none;">
    <form class="layui-form" method="post">
        <div style="padding: 20px; background-color: #F2F2F2;">
            <input type="text" id="videoId" name="id" lay-verify="title" hidden>
            <label class="layui-form-label">视频名称</label>
            <div class="layui-input-block">
                <input type="text" id="foodName" name="videoName" lay-verify="title" autocomplete="off" placeholder="请输入视频标题" class="layui-input" style="width:30%">
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
                    <textarea placeholder="请输入菜品描述信息，200字以内" id="videoDesc" name="videoDesc" class="layui-textarea" ></textarea>
                </div>
            </div>
            <label class="layui-form-label">封面图片</label>
            <div class="layui-upload">
                <input type="text" id="videoPic" name="videoPic" hidden>
                <button type="button" class="layui-btn" id="test1">点击上传</button>
                <div class="layui-upload-list" style="margin-left: 120px;">
                    <img class="layui-upload-img" id="demo1" style="width:100px;height:100px;">
                    <p id="demoText"></p>
                </div>
            </div>
            <label class="layui-form-label">视频文件</label>
            <input type="text" id="videoUrl" name="videoUrl" lay-verify="title" hidden>
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
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit" onclick="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="<%=contextPath%>/layui/layui.js"></script>
<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var form = layui.form;
        //第一个实例
        table.render({
            elem: '#demo'
            , height: 400
            , url: '<%=contextPath%>/video/list' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {align:'center', title: '编号',type:'numbers',width:100}
                , {field: 'videoName', title: '视频菜名', width: 150,align:'center'}
                , {field: 'videoUrl', title: '视频地址', width: 200,align:'center'}
                , {field: 'videoPic', title: '视频封面图', width: 200,align:'center'}
                , {field: 'videoDesc', title: '视频内容简介', width: 300,align:'center'}
                , {field: 'createTime', title: '添加时间', width: 200,align:'center'}

                , {
                    fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150 ,align:'center'
                }
            ]]
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event == 'del') {
                layer.confirm('确认删除这条信息吗！', function (index) {
                    //异步像服务器发送删除请求
                    $.ajax({
                        url: '<%=contextPath%>/video/delete',
                        type: 'POST',
                        data: {'id': data.id},
                        dataType:'JSON',
                        success: function (result) {
                            if (result.code == 0) {
                                layer.msg("删除成功!" , {icon: 6});
                                obj.del();
                                layer.close(index);

                            } else {
                                layer.msg("删除失败!", {icon: 5});
                                layer.close(index);
                            }
                        },
                        error: function (errorMsg) {
                            layer.msg("数据异常!" + errorMsg, {icon: 5});
                            layer.close(index);
                            location.reload();
                        },
                    });
                });
                //更新信息
            } else if (obj.event == 'edit') {
                layer.open({
                    type: 1,
                    title: "修改信息",
                    area: ['700px', '500px'],
                    content: $("#popUpdateEmp"),
                    success: function () {
                        //回显数据
                        $("#videoId").val(data.id);
                        $("#foodName").val(data.videoName);
                        $("#videoDesc").val(data.videoDesc);
                        $("#videoPic").val(data.videoPic);
                        $("#demo1").attr("src",'<%=basePath%>'+ data.videoPic);
                        $("#videoUrl").val(data.videoUrl);
                    },
                });
            }
        });
        //更新操作
        form.on('submit(formDemo)', function (data) {
            //发送ajax请求
            $.ajax({
                url: '<%=contextPath%>/video/updateOrAdd',
                data: JSON.stringify(data.field),
                type: 'POST',
                contentType: 'application/json',  //数据类型格式
                success: function (result) {
                    if (result.code == 0) {
                        layer.closeAll();
                        layer.msg('更新成功', {time: 1 * 1000}, function () {
                            location.reload();
                        });
                    } else {
                        layer.closeAll();
                        layer.msg(result.msg, {time: 1 * 1000}, function () {
                            location.reload();
                        });
                    }
                },
                error: function (errorMsg) {
                    alert("数据异常！" + errorMsg);
                    location.reload();
                },
            });
            return false;
        });
        form.on('switch(switchTest)', function(data){
            var status = this.checked ? '1' : '2';
            $("#status").val(status);
            layer.tips('温馨提示：上架将会在APP中展示该信息，下架将不会展示！', data.othis)
        });
    });
    layui.use('upload', function(){
        var $ = layui.jquery,upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '<%=contextPath%>/upload/file/img'
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
                }else{
                    $("#videoPic").val(res.data);
                    return layer.msg('上传成功');
                }
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
            ,url: '<%=contextPath%>/upload/file/video'
            ,accept: 'video' //视频
            ,done: function(res){
                if(res.code > 0){
                    return layer.msg('上传失败');
                }else{
                    $("#videoUrl").val(res.data);
                    return layer.msg('上传成功');
                }
            }
        });
    });

</script>
</body>
</html>