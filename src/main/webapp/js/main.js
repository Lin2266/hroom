$(function(){
    // 顯示購物車清單
    showCart()

    // 增加購物車
    $(".add_cart").on("click",function (){

        let productId = $(this).next().val()
        if(productId == ""){
            productId = $(".s_product_text .productId").val()
        }
        // let productId = $(this).next().find(".productId").val()
        if(productId == ""){
            alert("產品id是空的，請確認產品id")
            return;
        }

        let cost = $(this).prev().children().text()
        console.log(cost)
        if(cost == "  "){
            cost = $(".s_product_text h2 span").text()
        }

        if(cost == "  "){
            alert("產品cost是空的，請確認產品cost")
            return;
        }

        let name = $(this).prev().prev().text()
        if(name == ""){
            name = $(".s_product_text h3").text()
        }

        if(name == ""){
            alert("產品name是空的，請確認產品name")
            return;
        }

        let imgUrl = $(this).parents(".single_product_item").children("img").prop("src")
        if(imgUrl == undefined){
            imgUrl = $(".product_slider_img img").prop("src")
        }

        if(imgUrl == undefined){
            alert("產品imgUrl是空的，請確認產品imgUrl")
            return;
        }

        let quantity = $(".s_product_text .input-number").val()
        console.log(quantity)
        // let accountId = "";
        addCart(productId,cost,name,imgUrl,quantity)
    })

    //  購物車刪除鈕提示
    $('.deleteCartBtn').tooltip();

    // 刪除購物車
    $(".deleteCartBtn").on("click",function (){
        let productId = $(this).parent().prev().prev().find("input").data("productid")
        deleteCart(productId)

    })

    // 增加購物車產品數量
    let productId = 0;
    let quantity = 0;
    $(".quantity").on("input",function (){
        quantity = $(this).val()
        productId = $(this).data("productid")
    })

    // 修改購物車
    $("#updateCart").on("click",function (){
        updateCart(productId,quantity)
    })

    // 商品結帳時提示登入會員
    $("#checkOut").on("click",function (){
        let checkOutUrl = $("#checkOut").prop("href")
        let checkOutIndex = checkOutUrl.lastIndexOf("/")
        let checkOutPage = checkOutUrl.slice(checkOutIndex+1);

        if(checkOutPage == "login.jsp"){
            alert("結帳前請先登入會員")
        }else{
            let  shipping = $(".shipping span").text()
            $("#checkOut").prop("href",`${checkOutUrl}?shipping=${shipping}`)
        }
    })


    // 訂單明細
    let orderId = $("#orderId").val()
    if(orderId){
        ShowOrderItems(orderId)
    }

})



function  addCart(productId,cost,name,imgUrl,quantity){
    // 去掉$符號
    // cost = cost.substring(1)
    let type = false
    if(quantity == undefined){
        quantity = 1
        type = true
    }else{
        quantity = parseInt(quantity)
    }

    cost = parseFloat(cost).toFixed(2);

    let  cart = {
        productId:productId,
        name:name,
        cost:cost,
        quantity:quantity,
        imgUrl:imgUrl,
    }

    let carts = JSON.parse(localStorage.getItem("cart"))
    if(carts){ // 若存在
        let key = false
        $.each(carts,function (index,item){
            // 同商品時累加數量
            if(item.productId == productId) {
                if(quantity == 1 && type == true){
                    item.quantity += quantity
                }else{
                    item.quantity = quantity
                }

                console.log("新增購物車產品重複時累加:" + item.quantity)
                key = true
            }
        })
        if(key != true){
            carts.unshift(cart); // [{}, {}]
        }

    }else{ // 若不存在
        carts = [cart];
    }
    localStorage.setItem("cart", JSON.stringify(carts));
    alert("已增加到購物車")
}


function showCart(){
    $(".cart_inner table tbody").html("")
    let carts = JSON.parse(localStorage.getItem("cart"))

    if(carts){
        // 計算購物車數量
        $(".main_menu .cart i").attr("data-cart-quantity",carts.length)
        let cartList = "";
        let total =0;
        // let orderItems = {
        //     productid: ,
        //     quantity:
        // }
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
                  <h5>$ ${item.cost}</h5>
                </td>
                <td>
                  <div class="form-outline">
                    <input type="number" id="typeNumber" class="form-control quantity" data-productid="${item.productId}" value="${item.quantity}" min="1" max="10"/>
                  </div>
                </td>
                <td class="total">
                  <h5>$ ${(item.cost * item.quantity).toFixed(2)}</h5>
                </td>
                <td>
                  <button type="button" class="deleteCartBtn" title="刪除">X</button>
                </td>
              </tr>
        `
        })

        $(".cart_inner table tbody").append(cartList)
        if(total == 0){
            $(".shipping").html("<span></span>")
        }else if(total > 3000){
            $(".shipping").html("<span>免運費</span>")
        }else{
            $(".shipping").html("$ <span>150.00</span>")
        }

        $(".cart_inner table tfoot .subTotal").html("<span>$ </span>" + total.toFixed(2))
    }

}

function  updateCart(productId,quantity,key){
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

function deleteCart(productId){
    let carts = JSON.parse( localStorage.getItem("cart"))
    carts =  carts.filter((item) => item.productId != productId);
    localStorage.setItem("cart", JSON.stringify(carts));
    location.reload()
}

function ShowOrderItems(orderId){
    url = "OrderServlet"
    if(orderId != null){
        url += `?orderId=${orderId}`
    }

    $.ajax({
        url: url,
        type:"GET",
        dataType: "json",
        success:function (res){
            alert(res)
        },
        error:function (error){
            alert(error.responseText)
        }

    })
}