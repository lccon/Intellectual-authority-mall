<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div id="center11">
    <table class="layui-hide" id="test"></table>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'/rechargeRecord/findRechargeRecordForList?Page=2'
            ,width:670
            ,request: {
                pageName: 'page'//页码的参数名称，默认：page
                ,limitName: 'size' //每页数据量的参数名，默认：limit
            }
                ,parseData: function(res){
                console.log(res,res.status,res.message,res.total,res.rows);//res 即为原始返回的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": null, //解析提示文本
                    "count": res.records, //解析数据长度
                    "data": res.rows, //解析数据列表
                };
            }
            ,cols: [[
                 {field:'rechargeAmount', width:110, title: '充值金额', sort: true}
                ,{field:'consumeAmount', width:110, title: '消费金额', sort: true}
                ,{field:'accountYue', width:130, title: '帐户余额', sort: true}
                ,{field:'alipayOrderNum', width:160, title: '支付宝订单号'}
                ,{field:'wechatOrderNum', title: '微信订单号', width: 160}
            ]]
            ,page: true
        });
    });
</script>
</div>
</body>
</html>