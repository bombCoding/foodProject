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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend style="text-align: center">公告管理界面</legend>
</fieldset>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">公告信息列表</div>
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
        <input type="text" id="noticeId" name="id" lay-verify="title" hidden>
        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-form-item">
                <label class="layui-form-label">公告标题</label>
                <div class="layui-input-block">
                    <input type="text" id ="title" name="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">公告内容</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id = "noticeInfo" name="noticeInfo" class="layui-textarea" style="height: 240px;"></textarea>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">是否展示</label>
                <div class="layui-input-block">
                    <input type="text" id="status" name="status" lay-verify="title" hidden>
                    <input type="checkbox" checked="" name="" id="statusStr"
                       lay-skin="switch" lay-filter="switchTest" lay-text="展示|不展示">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 150px">
                <button class="layui-btn" lay-submit lay-filter="updateFormBtn"
                        style="margin-left: 120px">提交修改
                </button>
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
            , url: '<%=contextPath%>/notice/list' //数据接口
            , page: true //开启分页
            , cols: [[ //表头
                {align:'center', title: '编号',type:'numbers',width:100}
                , {field: 'title', title: '公告名', width: 120 ,align:'center'}
                , {field: 'noticeInfo', title: '公告内容', width: 800 ,align:'center'}
                , {field: 'createTime', title: '发布时间', width: 200 ,align:'center'}
                , {
                    fixed: 'right', title: '操作', toolbar: '#barDemo', width: 120,align:'center'
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
                        url: '<%=contextPath%>/notice/delete',
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
                        $("#title").val(data.title);
                        $("#noticeId").val(data.id);
                        $("#noticeInfo").val(data.noticeInfo);
                        $("#status").val(data.status);
                        /*if(data.status == 1){
                            $("#statusStr").css("checked",true)
                        }else{
                            $("#statusStr").css("checked",false)
                        }*/
                    },
                });
            }
        });
        //更新操作
        form.on('submit(updateFormBtn)', function (data) {
            //发送ajax请求
            $.ajax({
                url: '<%=contextPath%>/notice/addOrUpdate',
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

</script>
</body>
</html>