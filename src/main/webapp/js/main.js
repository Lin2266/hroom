$(function(){
    // 顯示購物車清單
    showCart()

    // 增加購物車
    // 測試用id
    let AutoId = 1
    $(".add_cart").on("click",function (){

        let cost = $(this).prev().text()
        let name = $(this).prev().prev().text()
        let imgUrl = $(this).parents(".single_product_item").children("img").prop("src")

        addCart(AutoId,cost,name,imgUrl)
        AutoId++;
    })

    //  購物車刪除鈕提示
    $('.deleteCartBtn').tooltip();

    // 刪除購物車
    $(".deleteCartBtn").on("click",function (){
        let id = $(this).parent().prev().prev().find("input").data("id")
        let carts = JSON.parse( localStorage.getItem("cart"))
        carts =  carts.filter((item) => item.id !== id);
        localStorage.setItem("cart", JSON.stringify(carts));
        location.reload()
    })

    // 增加購物車產品數量
    let id = 0;
    let quantity = 0;
    $(".quantity").on("input",function (){
        quantity = $(this).val()
        id = $(this).data("id")
        console.log(id)
        // let sum =0.0;
        // let count = 0.0;
        // let subtotal =0.0;

        // let total = $(this).parents().parents().next().children("h5")
        // let cost = $(this).parents().parents().prev().children().html()
        // let subTotal = $(this).parents("tbody").next("tfoot").children("tr:nth-child(1)").children("td:last-child").children("h5")
        // cost = parseFloat(cost).toFixed(2)
        // quantity = parseFloat(quantity).toFixed(2)
        // subtotal = parseFloat(subTotal.html())

        // 單價*數量 = 總額
        // sum = cost * quantity
        // total.html(parseFloat(sum).toFixed(2).toString())
        // 總額 - 單價 = 新增的價額
        // count = sum - cost
        // subtotal += count
        // subTotal.html(parseFloat(subtotal).toFixed(2))


    })

    $("#updateCart").on("click",function (){
        console.log(" 更新購物車:產品編號 "+ id)
        let carts = JSON.parse( localStorage.getItem("cart"))
        carts.forEach(function (cart,i){
            if(carts[i].id == id){
                carts[i].quantity = parseInt(quantity)
                console.log("數量更改為:" + carts[i].quantity)
            }
        })
        localStorage.setItem("cart", JSON.stringify(carts));
        location.reload()
    })

    $('.emailBtn').on("click",function (){

    })

})



function  addCart(id,cost,name,imgUrl,shipping){
    cost = cost.substring(1)
    cost = parseFloat(cost).toFixed(2);
    let  cart = {
        id:id,
        name:name,
        cost:cost,
        quantity:1,
        imgUrl:imgUrl,
        shipping:shipping
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
                    <input type="number" id="typeNumber" class="form-control quantity" data-id="${item.id}" value="${item.quantity}" min="1" max="10"/>
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
        $(".cart_inner table tfoot .subTotal").html(total.toFixed(2))
    }

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