$(function(){
		
	$("#twzipcode").twzipcode({
		"css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
		"countyName": "city", // 指定城市 select name
		"districtName": "county" // 指定地區 select name
	});
	$("#twzipcode2").twzipcode({
		"css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
	});
	$('#checkReceiver').on('click',function(){
		$('.open-close-address').toggle( "slow" );
	})
	
})