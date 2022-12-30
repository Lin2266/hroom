$(function(){
		// 購買人地址選單
	$("#twzipcode").twzipcode({
		"css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
		"countyName": "city", // 指定城市 select name
		"districtName": "county" // 指定地區 select name
	});

	// 收貨人地址選單
	$("#twzipcode2").twzipcode({
		"css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
		"countyName": "receiverCity", // 指定城市 select name
		"districtName": "receiverCounty" // 指定地區 select name
	});

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
		let name = $("#name");
		let phone = $("#phone");
		let email = $("#email");
		let city = $("#twzipcode .city :selected");
		let county = $("#twzipcode .county :selected") ;
		let zipCode = $("#twzipcode .zipCode") ;
		let address = $("#address");

		if(name.val() == ""){
			alert("購買人姓名不得為空")
			name.focus();
			return;
		}

		if(phone.val() == ""){
			alert("購買人電話不得為空")
			phone.focus();
			return;
		}

		if(email.val() == ""){
			alert("購買人信箱不得為空")
			email.focus();
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

		if(address.val() == ""){
			alert("購買人地址不得為空")
			address.focus();
			return;
		}

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