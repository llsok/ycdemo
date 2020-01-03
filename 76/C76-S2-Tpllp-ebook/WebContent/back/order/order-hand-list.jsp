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
			<th width="100px">配送方式</th>
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
		<c:forEach items="${eorderHand}" var="orderShow">
			<tr>
				<td><label><input type="checkbox" class="ace"><span
						class="lbl"></span></label></td>
				<td>${orderShow.eoid }</td>
				<td class="order_product_name"><a
					href="${path}/back/book/detail-admin.jsp?bid=${orderShow.bid}"
					class="product_Display">${orderShow.bname }</a></td>
				<td>${orderShow.total }</td>
				<td>${orderShow.eotime }</td>
				<td>${orderShow.eotype }</td>
				<td>${orderShow.eoaddr }</td>
				<td>${orderShow.eotemp }</td>
				<td>${orderShow.uname}</td>
				<td>${orderShow.count }</td>
				<td class="td-status">${eoderState[orderShow.eostate]}</td>
				<td>${eoderMessage[orderShow.eostate]}</td>
				<td><c:if test="${orderShow.eostate == 2}" var="flag"
						scope="session">
						<a onClick="Delivery_stop(this,'${orderShow.eoid}')" title="发货"
							class="btn btn-xs btn-success"><i
							class="fa fa-cubes bigger-120"></i></a>
					</c:if> <a title="订单详细"
					href="javascript:;"
					onclick="selectSingle('${orderShow.eoid }');"
					class="btn btn-xs btn-info order_detailed"><i
						class="fa fa-list bigger-120"></i></a> <a title="删除"
					href="javascript:;"
					onclick="Order_form_del(this,${orderShow.eoid })"
					class="btn btn-xs btn-warning"><i
						class="fa fa-trash  bigger-120"></i></a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>