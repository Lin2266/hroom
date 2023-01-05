var carts;
var shipping = 0
var total =0;
var amount=0;

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
		order['parmentMethod'] = parmentMethod
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
			let zipCode = $("#twzipcode2 .zipCode") ;
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

			if(zipCode.val() == ""){
				alert("郵遞區號不得為空")
				return false;
			}
			order['zipCode'] = zipCode.val()

			if(address.val() == ""){
				alert("收貨人地址不得為空")
				address.focus();
				return;
			}
			order['address'] = address.val()

		}

		checkOut(carts,order)
	})

})

function order(){
	carts = JSON.parse(localStorage.getItem("cart"))

	if($("#shipping").val() != "免運費"){
		shipping = parseFloat( $("#shipping").val());
	}

	let sum = 0;
	let orderList = `
			 <h2>您的訂單</h2>
              <ul class="list">
                <li>
                  <a>產品
                    <span>價格</span>
                  </a>
                </li>
                `
	carts.forEach(function (cart){
		sum +=  parseFloat(cart.cost) * cart.quantity;
		orderList +=`
                <li>
                  <a>${cart.name}
                    <span class="middle">x ${cart.quantity}</span>
                    <span class="last">$ ${cart.cost}</span>
                  </a>
                </li>
                `
	})
	total = parseFloat(sum).toFixed(2);
	amount = sum + shipping

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
                    <span>$ ${shipping}</span>
                  </a>
                </li>
                <li>
                  <a>總額
                    <span>$ ${amount.toFixed(2)}</span>
                  </a>
                </li>
              </ul>
		`
	$(".order_box").html(orderList)
}

function checkOut(carts,order){
	const cart = new Map();
	// let a = carts.splice()
	// console.log(Object.keys(carts[0]).length)
	for(let i =0; i<carts.length; i++){
		for(let j =0;j<Object.keys(carts[i]).length;j++){
			if(Object.keys(carts[i])[j] != "productId" && Object.keys(carts[i])[j] != "quantity"){
				delete carts[i].accountId
				delete carts[i].name
				delete carts[i].cost
				delete carts[i].imgUrl
			}

		}

	}

	// delete carts[0].name
	console.log(carts)
	// console.log(a)

	cart.set("orderItems",carts)
	cart.set("order",order)
	// console.log(cart)
	// console.log(JSON.stringify(Array.from(cart.entries())))
	// console.log(JSON.stringify(Object.fromEntries(cart)));


	// $(".orderForm").prop("method","POST").prop("action","OrderServlet")

	$.ajax({
		url:"OrderServlet",
		type:"POST",
		dataType: "json",
		data:JSON.stringify(Object.fromEntries(cart)),
		success:function (res){
			alert("成功" + res)
		},
		error:function (error){
			alert("失敗" + error)
		}

	})
}