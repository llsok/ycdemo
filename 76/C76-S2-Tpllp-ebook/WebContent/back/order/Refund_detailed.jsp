<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
 <link href="${path}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="${path}/back/css/style.css"/>       
        <link href="${path}/back/assets/css/codemirror.css" rel="stylesheet">
        <link rel="stylesheet" href="${path}/back/assets/css/ace.min.css" />
        <link rel="stylesheet" href="${path}/back/font/css/font-awesome.min.css" />
		<script src="${path}/back/js/jquery-1.9.1.min.js"></script>
        <script src="${path}/back/assets/js/bootstrap.min.js"></script>
		<script src="${path}/back/assets/js/typeahead-bs2.min.js"></script> 
        <script src="${path}/back/js/H-ui.js" type="text/javascript"></script>          	
        <script src="${path}/back/assets/layer/layer.js" type="text/javascript" ></script>          
<title>退款详细</title>
</head>

<body >
<div class="margin clearfix">
 <div class="Refund_detailed">
    <div class="Numbering">退款单编号:<b>${orderdetialshow.eoid }</b></div>
    <div class="detailed_style">
     <!--退款信息-->
     <div class="Receiver_style">
     <div class="title_name">退款信息</div>
     <div class="Info_style clearfix">
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 退款人姓名： </label>
         <div class="o_content">${orderdetialshow.uname }</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 退款人电话： </label>
         <div class="o_content">${orderdetialshow.eotemp }</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 退款方式：</label>
         <div class="o_content">银联</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 退款数量：</label>
         <div class="o_content">${orderdetialshow.count }件</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 快递名称：</label>
         <div class="o_content">${orderdetialshow.eoespress }</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 快递单号：</label>
         <div class="o_content">3456789090</div>
        </div>
         <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 退款账户：</label>
         <div class="o_content">招商储蓄卡</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 退款账号：</label>
         <div class="o_content">345678*****5678</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 退款金额：</label>
         <div class="o_content">${orderdetialshow.total }元</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 退款日期：</label>
         <div class="o_content">暂无</div>
        </div>
        <div class="col-xs-3">  
         <label class="label_name" for="form-field-2"> 状态：</label>
         <div class="o_content">${eoderState[orderdetialshow.eostate]}</div>
        </div>
     </div>
    </div>
    <div class="Receiver_style">
    <div class="title_name">退款说明</div>
    <div class="reund_content">
      买家收到货,需要退货,如何退货呢--淘宝退款流程交易订单的交易状态是卖家已发货,有可能是因为产品问题或者其他原因需要退...  
    </div>
    </div>
    
    <!--产品信息-->
    <div class="product_style">
    <div class="title_name">产品信息</div>
    <div class="Info_style clearfix">
      <div class="product_info clearfix">
      <a href="${path}/back/book/detail-admin.jsp?bid=${orderdetialshow.bid }" class="img_link"><img src="${orderdetialshow.bimg }"></a>
      <span>
      <a href="${path}/back/book/detail-admin.jsp?bid=${orderdetialshow.bid}" class="name_link">${orderdetialshow.bname }</a>
      <br>
      <p>数量：${orderdetialshow.getCount() }本</p> 
      <p class="status">${eoderState[orderdetialshow.eostate]}</p>   
      </span>
      </div>
    </div>
    </div>
    </div>
    <div class="Button_operation">
				<button onclick="window.location.href='${path}/back/order/Refund.jsp'" class="btn btn-primary radius" type="button"><i class="icon-save "></i>返回上一步</button>
		</div>
 </div>
</div>
</body>
</html>
