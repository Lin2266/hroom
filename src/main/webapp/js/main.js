$(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $(".add_cart").on("click",function (){
        let id = 1;
        let cost = $(this).prev().text()
        let name = $(this).prev().prev().text()
        let imgUrl = $(this).parents(".single_product_item").children("img").prop("src")

        addCart(id,cost,name,imgUrl)

    })

    function  addCart(){
        const  cart = {
            id:id,
            cost:cost,
            name:name,
            imgUrl:imgUrl
        }

        localStorage.setItem("cart", JSON.stringify(cart));
        const carts = JSON.parse(localStorage.getItem("cart"))
        
        let cartTr = `
        <tr>
                <td>
                  <div class="d-flex">
                    <img src="img/product/single-product/cart-1.jpg" alt="" />
                  </div>
                </td>
                <td>
                  <div class="media-body">
                    <p>Minimalistic shop for multipurpose use</p>
                  </div>
                <td>
                  <h5>$360.00</h5>
                </td>
                <td>
                  <div class="form-outline">
                    <input type="number" id="typeNumber" class="form-control" value="1" min="1" max="10"/>
                  </div>
                </td>
                <td class="total">
                  <h5>$720.00</h5>
                </td>
                <td>
                  <button type="button" class="deleteBtn" data-toggle="tooltip" title="刪除">X</button>
                </td>
              </tr>
        `
    }
})