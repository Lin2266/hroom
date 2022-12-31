$(function(){
    //  購物車刪除鈕提示
    $('[data-toggle="tooltip"]').tooltip();

    // 增加購物車
    $(".add_cart").on("click",function (){
        let id = 1;
        let cost = $(this).prev().text()
        let name = $(this).prev().prev().text()
        let imgUrl = $(this).parents(".single_product_item").children("img").prop("src")

        addCart(id,cost,name,imgUrl)

    })

    showCart()

    $("#typeNumber").on("input",function (){
        console.log("123")
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
    console.log(carts)
    if(carts){ // 若存在
        carts.unshift(cart); // [{}, {}]
    }else{ // 若不存在
        carts = [cart];
    }

    localStorage.setItem("cart", JSON.stringify(carts));

}


function showCart(){
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
                    <input type="number" id="typeNumber" class="form-control" value="${item.quantity}" min="1" max="10"/>
                  </div>
                </td>
                <td class="total">
                  <h5>${(item.cost * item.quantity).toFixed(2)}</h5>
                </td>
                <td>
                  <button type="button" class="deleteCartBtn" data-toggle="tooltip" title="刪除">X</button>
                </td>
              </tr>
        `
        })

        $(".cart_inner table tbody").append(cartList)
        $(".cart_inner table tfoot .subTotal").html(total.toFixed(2))
    }

}

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