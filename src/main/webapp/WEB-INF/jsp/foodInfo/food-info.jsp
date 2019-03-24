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
    <legend style="text-align: center">菜品管理界面</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">菜品信息列表</div>
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
            <input type="text" id="foodId" name="id" lay-verify="title" hidden>
            <label class="layui-form-label">菜品名称</label>
            <div class="layui-input-block">
                <input type="text" id="foodName" name="foodName" lay-verify="title" autocomplete="off" placeholder="请输入菜品名称" class="layui-input" style="width:50%">
            </div>
            <br/>
            <label class="layui-form-label">菜品价格</label>
            <div class="layui-input-block">
                <input type="text" id="foodPrice" name="foodPrice" lay-verify="title" autocomplete="off" placeholder="请输入菜品单价" class="layui-input"  style="width:50%">
            </div>
            <br/>
            <label class="layui-form-label">是否上架</label>
            <div class="layui-input-block">
                <input type="text" id="flag" name="flag" hidden>
                <input type="checkbox" checked="" name="flagStr" id="flagStr" lay-skin="switch" lay-filter="switchTest" lay-text="上架|下架">
            </div>
            <br/>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">菜品描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入菜品描述信息" id="foodDesc" class="layui-textarea" ></textarea>
                </div>
            </div>
            <label class="layui-form-label">上传图片</label>
            <div class="layui-upload">
                <input type="text" id="picStr" name="picStr" hidden>
                <button type="button" class="layui-btn" id="test2" >上传图片</button>
                <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;margin-left: 16%;">
                    预览图：
                    <div class="layui-upload-list" id="demo2"></div>
                </blockquote>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="updateFormBtn">提交修改</button>
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
            , url: '<%=contextPath%>/foodInfo/list' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {align:'center', title: '编号',type:'numbers',width:60}
                , {field: 'foodName', title: '菜名', width: 120 ,align:'center'}
                , {field: 'recommendedPrice', title: '推荐价', width: 90 ,align:'center'}
                , {field: 'flagStr', title: '状态', width: 90 ,align:'center'}
                , {field: 'flag', title: '状态列' ,hide:true}
                , {field: 'foodDesc', title: '简介', width: 600}
                , {field: 'createTime', title: '添加时间', width: 200 ,align:'center'}
                , {
                    fixed: 'right', title: '操作', toolbar: '#barDemo', width: 120
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
                        url: '<%=contextPath%>/foodInfo/delete',
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
                //更新用户
            } else if (obj.event == 'edit') {
                layer.open({
                    type: 1,
                    title: "修改信息",
                    area: ['700px', '500px'],
                    content: $("#popUpdateEmp"),
                    success: function () {
                        //回显数据
                        $("#foodName").val(data.foodName);
                        $("#foodPrice").val(data.recommendedPrice);
                        $("#foodDesc").val(data.foodDesc);
                        $("#foodId").val(data.id);
                        $("#flag").val(data.flag);
                        var pic = data.foodPics;
                        var pics = '';
                        for(var i = 0;i<pic.length;i++){
                            $('#demo2').append('<div class="pic" style="display: inline-block; width: 100px; height: 100px; margin-left: 10px;" >' +
                                    '<img src="<%=basePath%>'+ pic[i].imgUrl+'" alt="" class="layui-upload-img" style="width:100px;height:100px;">' +
                                    '<p class="delt" style="float: right;position: relative;' +
                                    'top: -102px;right: 4px;display: inline-block;overflow: fix;cursor: pointer;">x</p></div>');
                            pics = pics + pic[i].imgUrl +',';
                        }
                        $("#picStr").val(pics);
                    },
                });
            }
        });
        //更新操作
        form.on('submit(updateFormBtn)', function (data) {
            //发送ajax请求
            $.ajax({
                url: '<%=contextPath%>/foodInfo/updateOrAdd',
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
                        layer.msg('更新失败', {time: 1 * 1000}, function () {
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
            $("#flag").val('2');
            layer.tips('温馨提示：上架将会在APP中展示该信息，下架将不会展示！', data.othis)
        });
    });

    layui.use('upload', function(){
        var $ = layui.jquery
                ,upload = layui.upload;
        //多图片上传
        upload.render({
            elem: '#test2'
            ,url: '<%=contextPath%>/upload/file/img'
            ,multiple: true
            ,number: 5//最多上传文件数为5
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').append('<div class="pic" style="display: inline-block; width: 100px; height: 100px; margin-left: 10px;" >' +
                            '<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width:100px;height:100px;">' +
                            '<p class="delt" style="float: right;position: relative;' +
                            'top: -102px;right: 4px;display: inline-block;overflow: fix;cursor: pointer;">x</p></div>');
                });
            },done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }else{
                    var pic = $("#picStr").val();
                    $("#picStr").val(pic +','+res.data);
                    return layer.msg('上传成功');
                }
            }
        });
    });

    $(".delt").click(function(){
        this.parent(".pic").remove();
    });
</script>
</body>
</html>