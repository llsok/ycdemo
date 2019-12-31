<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table class="table table-striped table-bordered table-hover"
	id="sample-table">
	<thead>
		<tr>
			<th width="25px"><label><input type="checkbox"
					class="ace"><span class="lbl"></span></label></th>
			<th width="120px">订单编号</th>
			<th width="250px">书籍名称</th>
			<th width="80px">交易金额</th>
			<th width="100px">交易时间</th>
			<th width="180px">配送地区</th>
			<th width="100px">联系电话</th>
			<th width="100px">买家姓名</th>
			<th width="80px">数量</th>
			<th width="70px">状态</th>
			<th width="100px">说明</th>
			<th width="200px">操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${eorderRefund}" var="orderReShow">
			<tr>
				<td><label><input type="checkbox" class="ace"><span
						class="lbl"></span></label></td>
				<td>${orderReShow.eoid }</td>
				<td class="order_product_name"><a
					href="${path}/back/book/detail-admin.jsp?bid=${orderReShow.bid}"
					class="product_Display">${orderReShow.bname }</a></td>
				<td>${orderReShow.total }</td>
				<td>${orderReShow.eotime }</td>
				<td>${orderReShow.eoaddr }</td>
				<td>${orderReShow.eotemp }</td>
				<td>${orderReShow.uname }</td>
				<td>${orderReShow.count }</td>
				<td class="td-status"><c:if test="${orderReShow.eostate !=4 }"
						var="flag" scope="session">
						<span class="label label-defaunt radius">${eoderState[orderReShow.eostate]}</span>
					</c:if> <c:if test="${not flag}">
						<span class="label label-success radius">${eoderState[orderReShow.eostate]}</span>
					</c:if></td>
				<td>${eoderMessage[orderReShow.eostate]}</td>
				<td><c:if test="${orderReShow.eostate ==4 }" var="flag"
						scope="session">
						<a onClick="Delivery_Refund(this,'${orderReShow.eoid }')" title="退款"
							class="btn btn-xs btn-success">退款</a>
					</c:if> <a title="退款订单详细"
					onclick="showDetail('${orderReShow.eoid }')"
					class="btn btn-xs btn-info Refund_detailed">详细</a> <a title="删除"
					href="javascript:;"
					onclick="Order_form_del(this,'${orderReShow.eoid }')"
					class="btn btn-xs btn-warning">删除</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>