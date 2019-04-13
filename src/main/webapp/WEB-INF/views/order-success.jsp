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
    <link href="${contextPath}/resources/css/order-success.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
      <div class="panel panel-default text-center">
      	<div class="panel-heading">
         <h3>Order Success</h3>
       </div>
       <div class="panel-body">
       
       </div>
       <div class="panel-footer plan">
		<h3 class="sumPrice">${sumPrice} </h3>( has tax )
		<c:if test="${not empty couponCode}">
       		(-10% coupon, Coupon code: ${couponCode})
       	</c:if>
		<p>
		Thank <b> ${customer.customerName } </b>,<br>
		You ordered with Order Number is <b> ${order.id} </b>.<br>
		We will ship the items to you as soon as possible to the address: <b>${customer.addressLine1}</b> and call to phone number: <b>${customer.phone}</b>.<br>
		</p>
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
	var sumPrice = <c:out value="${sumPrice}" escapeXml="false"/> ;
	for (let i = 0 ; i< itemsOrder.length ; i++){
		var food = itemsOrder[i];
		htmlPanelBody+="<p><strong>"+food.quantity+"</strong> "+food.foodName+" $" + food.buyPrice + " ("+ food.tax*100 +"% tax): $" + food.sumPrice+" </p><hr>";
	}
	$(".panel-body").html(htmlPanelBody);
    $(".sumPrice").html("$"+sumPrice);
</script>
</body>
</html>
