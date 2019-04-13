<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/order-confirm.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">

	<h2>Order</h2>
	<hr>
	<div class="row">
		 <div class="col-sm-6">
		 	<h3 class="form-signin-heading">Items selected</h3>
	        <hr>
	        <div class="panel panel-default text-center">
		        <div class="panel-body">
		        
		        </div>
		        <div class="panel-footer plan">
		        	<form action="${contextPath}/check-coupon" id="searchForm">
						<div class="form-group">
							<table>
							<tr>
							    <th><input name="couponCode" type="text" class="form-control" placeholder="Coupon Code"
							    size=20 style="width: 150px;"/>
	                   				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                   				</th>
							    <th><input type="submit" value="Check" class="btn btn-lg btn-normal"></th>
							</tr>
							<tr>
							    <th>
							    	<span class="message"></span>
	                   			</th>
							    <th></th>
							</tr>
							</table>
			            </div>
			        </form>
					<h3 class="sumPrice">$0</h3>
					<h4>( has tax )</h4>
		        </div>
			</div>    
	    </div>
		<div class="col-sm-6">
			<form:form method="POST" action="${contextPath}/order" modelAttribute="customerForm" class="form-signin">
		        <h3 class="form-signin-heading">Your information</h3>
		        <hr>
		        <spring:bind path="customerName">
		            <div class="form-group ${status.error ? 'has-error' : ''}">
		                <form:input type="text" path="customerName" class="form-control" placeholder="Full Name"
		                            autofocus="true"></form:input>
		                <form:errors path="customerName"></form:errors>
		            </div>
		        </spring:bind>
		
		        <spring:bind path="phone">
		            <div class="form-group ${status.error ? 'has-error' : ''}">
		                <form:input type="number" path="phone" class="form-control" placeholder="Phone number"></form:input>
		                <form:errors path="phone"></form:errors>
		            </div>
		        </spring:bind>
		
		        <spring:bind path="addressLine1">
		            <div class="form-group ${status.error ? 'has-error' : ''}">
		                <form:input type="text" path="addressLine1" class="form-control"
		                            placeholder="Address Line 1"></form:input>
		                <form:errors path="addressLine1"></form:errors>
		            </div>
		        </spring:bind>
		        
		        <spring:bind path="city">
		            <div class="form-group ${status.error ? 'has-error' : ''}">
		                <form:input type="text" path="city" class="form-control"
		                            placeholder="City"></form:input>
		                <form:errors path="city"></form:errors>
		            </div>
		        </spring:bind>
		        
		        <input type="hidden" name="orderJSON" value='${orderJSON}'/>
		        <input class="couponCode" type="hidden" name="couponCode" value=''/>
		
		        <button class="btn btn-lg btn-primary btn-block" type="submit">Order</button>
		    </form:form>
	    </div>
    </div>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
<script>
	var arrFood = [],itemsOrderFirst = [],itemsOrder = [];
	itemsOrder = <c:out value="${orderJSON}" escapeXml="false"/> ;
	itemsOrderInit = <c:out value="${orderJSON}" escapeXml="false"/> ;
	var htmlPanelBody ="";
	var sumPrice = 0; 
	for (let i = 0 ; i< itemsOrder.length ; i++){
		var food = itemsOrder[i];
		sumPrice += food.sumPrice;
		htmlPanelBody+="<p><strong>"+food.quantity+"</strong> "+food.foodName+" : $" + food.sumPrice+"("+ food.tax*100 +"% tax) </p><hr>";
	}
	$(".panel-body").html(htmlPanelBody);
    $(".sumPrice").html("$"+sumPrice);
</script>
</body>
</html>
