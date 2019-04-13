<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href="${contextPath}/resources/css/home.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">

	<h2>Menu Categories</h2>
	<hr>
	<script>
	var arrFood = [],itemsOrder = [];
	</script>
	<c:if test="${not empty menuCategories}">
	    <c:forEach items="${menuCategories}" var="menuCategory">
	    	<h3>${menuCategory.textDescription}</h3>
	    	<hr>
	    		<script>
		    		<c:forEach items="${menuCategory.foods}" var="food">
		    			var objectFood = {
		    				id : ${food.id},
		    				foodName: "${food.foodName}",
		    				buyPrice: ${food.buyPrice},
		    				tax : ${food.tax}
		    			};
		    			arrFood.push(objectFood);
					</c:forEach>
	    		</script>
	    		
				<div class="row" style="width: 75%;">
	    			<c:forEach items="${menuCategory.foods}" var="food">
		    			<div class="col-sm-3">
		    				<div class="card">
		    					<img src="${contextPath}/resources/img/menu-categories/${menuCategory.id}/${food.urlImage}" alt="${food.foodName}" style="width: 100px; height: 100px;">
								<h4>${food.foodName}</h4>
								<p class="price">${food.buyPrice}$</p>
								<p class="price">Tax:${food.tax}</p>
								<p>${food.foodDescription}</p>
								<div class="footer"> 
									<div class="quantity">
									  <input id="${food.id}" type="number" min="0" max="99" step="1" value="0">
									</div>
								</div>
							</div>
						</div>
	    			</c:forEach>
				</div>
				
				<div class="panel panel-default text-center" style='position: fixed'>
					<form method="POST" action="${contextPath}/order-confirm">
				        <div class="panel-heading">
				          <h3>Items order</h3>
				        </div>
				        <div class="panel-body">
				        
				        </div>
				        <div class="panel-footer plan">
				          <h3 class="sumPrice">$0</h3>
				          <h4>( has tax )</h4>
				          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				          <button class="btn btn-lg">Order</button>
				        </div>
			        </form>
				</div>    
		</c:forEach>
	</c:if>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
</body>
</html>
