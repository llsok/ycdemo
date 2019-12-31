<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<select class="select"id="btype" name="btype" onblur="gradeChange()">
					<option>请选择</option>
					<c:forEach items="${adminShowBtypes}" var="bt">
						<option value="${adminRealBtypes[bt.btid] }">${adminBtypesEdit[bt.btid] }</option>
					</c:forEach>
			</select>