
$(function(){

	let county = $("#county")
	let city = $("#city")
	// 購買人地址選單
	$("#twzipcode").twzipcode({
		"css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
		"countyName": "city", // 指定城市 select name
		"districtName": "county", // 指定地區 select name
		"readonly": true,
		'countySel': city.val(),
		'districtSel': county.val(),
	});

	// 購買人資料禁止編輯，修改到會員資料
	$("#twzipcode select").prop("disabled",true)

	// 收貨人地址選單
	$("#twzipcode2").twzipcode({
		"css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
		"countyName": "receiverCity", // 指定城市 select name
		"districtName": "receiverCounty", // 指定地區 select name
		"readonly": true,
	});

	// 訂單內容
	order()

	// 購買人跟收貨人不同勾選
	$("#checkReceiver").on("click",function(){
		$('.open-close-address').toggle( "slow" );
	})

	// 購買人跟收貨人不同勾選時，input都加上required驗證
	$("#checkReceiver").on("click",function (){
		if($("#checkReceiver").prop("checked")){
			$(".addressee input").prop("required",true)
		}else{
			$(".addressee input").prop("required",false)
		}
	})


// 送出訂單
	$("#OrderSub").on("click",function (){
		let order = {}
		// 0信用卡 1貨到付款
		let parmentMethod = $("input[name='paymentMethod']:checked").val();

		let info = $("#info")
		// 信用卡要用綠界
		if(parmentMethod == 0){
			console.log("綠界")
		}
		// order['member'] = member
		order['parmentMethod'] = parseInt(parmentMethod)
		order['shipping'] = shipping
		order['amount'] = amount
		order['info'] = info.val()


		// 收貨人驗證
		if($("#checkReceiver").prop("checked")){
			let receiver = $("#receiver");
			let receiverPhone = $("#receiverPhone");
			let receiverEmail = $("#receiverEmail");
			let city = $("#twzipcode2 .city :selected");
			let county = $("#twzipcode2 .county :selected") ;
			let zipcode = $("#twzipcode2 .zipCode") ;
			let address = $("#receiverAddress");

			if(receiver.val() == ""){
				alert("收貨人姓名不得為空")
				receiver.focus();
				return;
			}
			order['receiver'] = receiver.val()

			if(receiverPhone.val() == ""){
				alert("收貨人電話不得為空")
				receiverPhone.focus();
				return;
			}
			order['receiverPhone'] = receiverPhone.val()

			if(receiverEmail.val() == ""){
				alert("收貨人信箱不得為空")
				receiverEmail.focus();
				return;
			}
			order['receiverEmail'] = receiverEmail.val()

			if(city.val() == ""){
				alert("縣市不得為空")
				return false;
			}
			order['city'] = city.val()

			if(county.val() == ""){
				alert("鄉鎮市區不得為空")
				return false;
			}
			order['county'] = county.val()

			if(zipcode.val() == ""){
				alert("郵遞區號不得為空")
				return false;
			}
			order['zipcode'] = zipcode.val()

			if(address.val() == ""){
				alert("收貨人地址不得為空")
				address.focus();
				return;
			}
			order['address'] = address.val()

		}

		const orderMap = new Map();
		order['orderItem'] = []

		for(let i =0; i<carts.length; i++){
			let orderItems = {
				products:{
					id:carts[i].productId,
				},
				quantity:carts[i].quantity,
			}

			order['orderItem'].push(orderItems)

		}
		console.log(order['orderItem'])

		checkOut(order)
	})

})

function checkOut(order){

	$.ajax({
		url:"OrderServlet",
		type:"POST",
		dataType: "json",
		data:JSON.stringify(order),
		success:function (res){
			alert(res[0].message)
			localStorage.clear()
			location.href=`order_items.jsp?orderId=${res[0].orderId}`
		},
		error:function (error){
			alert(error.responseText)
		}

	})
}

function order(){
	carts = JSON.parse(localStorage.getItem("cart"))
	let shippingSpan;
	shipping = $("#shipping").val()
	shipping = parseInt(shipping)
	if($("#shipping").val() == "免運費"){
		shippingSpan = ` <span>免運費</span>`
		shipping = 0
	}else{
		shippingSpan = `<span>$ ${shipping}</span>`
	}

	let orderList = `
			 <h2>您的訂單</h2>
              <ul class="list">
                <li>
                  <a>商品
                    <span>價格</span>
                  </a>
                </li>
                `
	if(carts){
		carts.forEach(function (cart){
			total += cart.cost * cart.quantity;
			orderList +=`
                <li>
                  <a>${cart.name}
                    <span class="middle">x ${cart.quantity}</span>
                    <span class="last">$ ${cart.cost}</span>
                  </a>
                </li>
                `
		})
	}

	amount = total + shipping

	orderList +=`
              </ul>
              <ul class="list list_2">
                <li>
                  <a>小計
                    <span>$ ${total}</span>
                  </a>
                </li>
                <li>
                  <a>運費
                    ${shippingSpan}
                  </a>
                </li>
                <li>
                  <a>總額
                    <span>$ ${amount}</span>
                  </a>
                </li>
              </ul>
		`
	$(".order_box").html(orderList)
}
