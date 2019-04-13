/**
 * 
 */
var sumPrice = 0;

calSumPrice();

function calSumPrice(couponCheck) {
	if(couponCheck === false){
		itemsOrder=itemsOrderInit;
		sumPrice = 0;
		htmlPanelBody ="";
		for (let i = 0 ; i< itemsOrder.length ; i++){
			var food = itemsOrder[i];
			sumPrice += food.sumPrice;
			htmlPanelBody+="<p><strong>"+food.quantity+"</strong> "+food.foodName+" : $" + food.sumPrice+"("+ food.tax*100 +"% tax) </p><hr>";
		}
		$(".panel-body").html(htmlPanelBody);
	    $(".sumPrice").html("$"+sumPrice);
	}else{
		itemsOrder=[];
		sumPrice = 0;
	    var htmlPanelBody="";
	    for (var i = 0; i < $( ".quantity > input" ).length; i++) {
			let foodId = $( ".quantity > input" )[i].id;
	    	let quantity = $( ".quantity > input" )[i].value;
			if(quantity != 0 ){
				for (var j = 0; j < arrFood.length; j++) {
					let food = arrFood[j];
					if(foodId == food.id){
						food.quantity = parseInt(quantity);
						food.sumPrice = food.buyPrice*food.quantity*(1+food.tax);
						itemsOrder.push(food);
						htmlPanelBody+="<p><strong>"+food.quantity+"</strong> "+food.foodName+" : $" + food.sumPrice+"("+ food.tax*100 +"% tax) </p><hr>";
					}
			    }
			}
		}
	    
	    for(let k = 0 ; k < itemsOrder.length ; k++){
	    	sumPrice += itemsOrder[k].sumPrice;
	    }
	    var htmlInputPost = "<input type='hidden' name='orderJSON' value='"+JSON.stringify(itemsOrder)+"'/>" ;
	    $(".panel-body").html(htmlPanelBody+htmlInputPost);
	    $(".sumPrice").html("$"+sumPrice);
	}
}

jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
    jQuery('.quantity').each(function() {
      var spinner = jQuery(this),
        input = spinner.find('input[type="number"]'),
        btnUp = spinner.find('.quantity-up'),
        btnDown = spinner.find('.quantity-down'),
        min = input.attr('min'),
        max = input.attr('max');

      btnUp.click(function() {
        var oldValue = parseFloat(input.val());
        if (oldValue >= max) {
          var newVal = oldValue;
        } else {
          var newVal = oldValue + 1;
        }
        spinner.find("input").val(newVal);
        spinner.find("input").trigger("change");
        calSumPrice();
      });

      btnDown.click(function() {
        var oldValue = parseFloat(input.val());
        if (oldValue <= min) {
          var newVal = oldValue;
        } else {
          var newVal = oldValue - 1;
        }
        spinner.find("input").val(newVal);
        spinner.find("input").trigger("change");
        calSumPrice();
      });

    });
    
$( "#searchForm" ).submit(function( event ) {
	 
	  // Stop form from submitting normally
	  event.preventDefault();
	 
	  // Get some values from elements on the page:
	  var $form = $( this ),
	    term = $form.find( "input[name='couponCode']" ).val(),
	    _csrfValue = $form.find( "input[name='_csrf']" ).val(),
	    url = $form.attr( "action" );
	 
	  // Send the data using post
	  var posting = $.post( url, { couponCode: term, _csrf: _csrfValue } );
	 
	  // Put the results in a div
	  posting.done(function( data ) {
		  if( data === 'valid'){
			  sumPrice = sumPrice*0.9;
			  $(".message").html("Valid Coupon Code!").css("color", "green");
			  $(".sumPrice").html("$"+sumPrice+" (-10% coupon)");
			  $(".couponCode").val(term);
		  }else{
			  $(".couponCode").val(term);
			  calSumPrice(false);
			  $(".message").html("Invalid Coupon Code!").css("color", "red");
		  }
		  
	  });
});