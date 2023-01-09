var carts;
var shipping = 0
var total =0;
var amount=0;
var member;
$(function(){

})


// 會員資料
function memberData(id,name,phone,email,city,county,zipcode,address){

    member = {
        id: id,
        name: name,
        phone: phone,
        email: email,
        city: city,
        county: county,
        zipcode: zipcode,
        address: address,
    };
}