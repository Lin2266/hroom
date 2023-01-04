$(function(){

		// 購買人地址選單
	let county = $("#county")
	let city = $("#city")

	$("#twzipcode").twzipcode({
		"css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
		"countyName": "city", // 指定城市 select name
		"districtName": "county", // 指定地區 select name
		"readonly": true,
		'countySel': city.val(),
		'districtSel': county.val(),
	});

	$("#twzipcode select").prop("disabled",true)

	// 收貨人地址選單
	$("#twzipcode2").twzipcode({
		"css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
		"countyName": "receiverCity", // 指定城市 select name
		"districtName": "receiverCounty", // 指定地區 select name
		"readonly": true,
	});

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

		// 收貨人驗證
		if($("#checkReceiver").prop("checked")){
			let receiverName = $("#receiverName");
			let receiverPhone = $("#receiverPhone");
			let receiverEmail = $("#receiverEmail");
			let city = $("#twzipcode2 .city :selected");
			let county = $("#twzipcode2 .county :selected") ;
			let zipCode = $("#twzipcode2 .zipCode") ;
			let receiverAddress = $("#receiverAddress");

			if(receiverName.val() == ""){
				alert("收貨人姓名不得為空")
				receiverName.focus();
				return;
			}

			if(receiverPhone.val() == ""){
				alert("收貨人電話不得為空")
				receiverPhone.focus();
				return;
			}

			if(receiverEmail.val() == ""){
				alert("收貨人信箱不得為空")
				receiverEmail.focus();
				return;
			}

			if(city.val() == ""){
				alert("縣市不得為空")
				return false;
			}

			if(county.val() == ""){
				alert("鄉鎮市區不得為空")
				return false;
			}

			if(zipCode.val() == ""){
				alert("郵遞區號不得為空")
				return false;
			}

			if(receiverAddress.val() == ""){
				alert("收貨人地址不得為空")
				receiverAddress.focus();
				return;
			}
		}

		$(".orderForm").prop("method","POST").prop("action","OrderServlet?method=addOrder")
	})
	
})

function order(){
	let carts = JSON.parse(localStorage.getItem("cart"))
	let sum = 0;
	let shipping = 0
	if($("#shipping").val() != "免運費"){
		shipping = parseFloat( $("#shipping").val());
	}

	let total =0.00;
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
		sum += cart.cost * cart.quantity;
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
	let subTotal = sum + shipping

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
                    <span>$ ${subTotal.toFixed(2)}</span>
                  </a>
                </li>
              </ul>
		`
	$(".order_box").html(orderList)
}