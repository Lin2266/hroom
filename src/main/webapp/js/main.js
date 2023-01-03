$(function(){
    // 顯示購物車清單
    showCart()

    // 增加購物車
    $(".add_cart").on("click",function (){
        let productId = $(this).next().val()
        let cost = $(this).prev().children().text()
        let name = $(this).prev().prev().text()
        let imgUrl = $(this).parents(".single_product_item").children("img").prop("src")
        let accountId = "";
        addCart(productId,cost,name,imgUrl,accountId)
    })

    //  購物車刪除鈕提示
    $('.deleteCartBtn').tooltip();

    // 刪除購物車
    $(".deleteCartBtn").on("click",function (){
        let productId = $(this).parent().prev().prev().find("input").data("productId")
        let carts = JSON.parse( localStorage.getItem("cart"))
        carts =  carts.filter((item) => item.productId != productId);
        localStorage.setItem("cart", JSON.stringify(carts));
        location.reload()
    })

    // 增加購物車產品數量
    let productId = 0;
    let quantity = 0;
    $(".quantity").on("input",function (){
        quantity = $(this).val()
        productId = $(this).data("productId")
    })

    // 修改購物車
    $("#updateCart").on("click",function (){

        updateCart()

    })

    // 提示結帳時登入會員
    $("#checkOut").on("click",function (){
        let checkOutUrl = $("#checkOut").prop("href")
        let checkOutIndex = checkOutUrl.lastIndexOf("/")
        let checkOutPage = checkOutUrl.slice(checkOutIndex+1);

        if(checkOutPage == "login.jsp"){
            alert("結帳前請先登入會員")
        }

    })


    $('.emailBtn').on("click",function (){

    })

})



function  addCart(productId,cost,name,imgUrl,accountId){
    // 去掉$符號
    // cost = cost.substring(1)
    cost = parseFloat(cost).toFixed(2);

    let  cart = {
        productId:productId,
        name:name,
        cost:cost,
        quantity:1,
        imgUrl:imgUrl,
        accountId:accountId
    }

    let carts = JSON.parse(localStorage.getItem("cart"))
    if(carts){ // 若存在
        carts.unshift(cart); // [{}, {}]
    }else{ // 若不存在
        carts = [cart];
    }

    localStorage.setItem("cart", JSON.stringify(carts));

}


function showCart(){
    $(".cart_inner table tbody").html("")
    let carts = JSON.parse(localStorage.getItem("cart"))

    if(carts){
        $(".main_menu .cart i").attr("data-cart-quantity",carts.length)
        let cartList = "";
        let total =0;
        $.each(carts,function (index,item){
            total +=  item.cost * item.quantity;

            cartList += `
        <tr>
                <td>
                  <div class="d-flex">
                    <img src="${item.imgUrl}" alt="" />
                  </div>
                </td>
                <td>
                  <div class="media-body">
                    <p>${item.name}</p>
                  </div>
                <td>
                  <h5>${item.cost}</h5>
                </td>
                <td>
                  <div class="form-outline">
                    <input type="number" id="typeNumber" class="form-control quantity" data-productId="${item.productId}" value="${item.quantity}" min="1" max="10"/>
                  </div>
                </td>
                <td class="total">
                  <h5>${(item.cost * item.quantity).toFixed(2)}</h5>
                </td>
                <td>
                  <button type="button" class="deleteCartBtn" title="刪除">X</button>
                </td>
              </tr>
        `
        })

        $(".cart_inner table tbody").append(cartList)
        if(total > 1000){
            $(".shipping").html("免運費")
        }else{
            $(".shipping").html("$50.00")
        }

        $(".cart_inner table tfoot .subTotal").html(total.toFixed(2))
    }

}

function  updateCart(productId){
    let carts = JSON.parse( localStorage.getItem("cart"))
    carts.forEach(function (cart,i){
        if(carts[i].productId == productId){
            carts[i].quantity = parseInt(quantity)
            console.log("數量更改為:" + carts[i].quantity)
        }
    })
    localStorage.setItem("cart", JSON.stringify(carts));
    location.reload()
}

// email 驗證
function emailVerify(){
    //please input the test email to see is valid
    var strEmail = "foxfirejack@gmail.com";
    console.log(typeof  strEmail)
    //Regular expression Testing
    emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;

    //validate ok or not
    if(strEmail.search(emailRule)!= -1){
        alert("true");
    }else {
        alert("false");
    }
}