$(function (){
    // 訂單明細
    let orderId = $("#orderId").val()
    if(orderId){
        ShowOrderItems(orderId)
    }
})

function ShowOrderItems(orderId){
    url = "OrderServlet"
    if(orderId != null){
        url += `?orderId=${orderId}`
    }

    $.ajax({
        url: url,
        type:"GET",
        dataType: "json",
        success:function (orderData){
            let paymentMethod = orderData.paymentMethod == 0 ? "信用卡":"貨到付款"
            let orderInfo = `
               <div class="single_confirmation_details">
                    <h4>訂單訊息</h4>
                    <ul>
                      <li>
                        <p>訂單編號:</p><span>${orderData.id}</span>
                      </li>
                      <li>
                        <p>日期:</p><span>${orderData.orderTimeS}</span>
                      </li>
                      <li>
                        <p>總額:</p><span>${orderData.amount}</span>
                      </li>
                      <li>
                        <p>付款方式:</p><span>${paymentMethod}</span>
                      </li>
                      <li>
                        <p>備註:</p><span>${orderData.info == ""?"&nbsp;":orderData.info}</span>
                      </li>
                      <li>
                        <p>&nbsp;</p><span>&nbsp;</span>
                      </li>
                      <li>
                        <p>&nbsp;</p><span>&nbsp;</span>
                      </li>
                    </ul>
               </div>
            `
            $(".orderInfo").html(orderInfo)

            let memberInfo = `
                <div class="single_confirmation_details">
                    <h4>購買人訊息:</h4>
                    <ul>
                      <li>
                        <p>購買人:</p><span>${member.name}</span>
                      </li>
                      <li>
                        <p>電話:</p><span>${member.phone}</span>
                      </li>
                      <li>
                        <p>信箱:</p><span>${member.email}</span>
                      </li>
                      <li>
                        <p>縣市:</p><span>${member.city}</span>
                      </li>
                      <li>
                        <p>鄉鎮市區:</p><span>${member.county}</span>
                      </li>
                      <li>
                        <p>巷弄:</p><span>${member.address}</span>
                      </li>
                      <li>
                        <p>郵遞區號:</p><span>${member.zipcode}</span>
                      </li>
                    </ul>
                  </div>
            `
            $(".memberInfo").html(memberInfo)

            let receiverInfo = `
                <div class="single_confirmation_details">
                    <h4>收件人訊息</h4>
                    <ul>
                      <li>
                        <p>收件人:</p><span>${orderData.receiver}</span>
                      </li>
                      <li>
                        <p>電話:</p><span>${orderData.receiverPhone}</span>
                      </li>
                      <li>
                        <p>信箱:</p><span>${orderData.receiverEmail}.com</span>
                      </li>
                      <li>
                        <p>縣市:</p><span>${orderData.city}</span>
                      </li>
                      <li>
                        <p>鄉鎮市區:</p><span>${orderData.county}</span>
                      </li>
                      <li>
                        <p>巷弄:</p><span>${orderData.address}</span>
                      </li>
                      <li>
                        <p>郵遞區號:</p><span>${orderData.zipcode}</span>
                      </li>
                    </ul>
                  </div>
            `
            $(".receiverInfo").html(receiverInfo)
            let orderItem = orderData.orderItem;
            let shippingSpan="";
            shipping = orderData.shipping
            if(shipping == 0){
                shippingSpan += `<th><span>免運費</span></th>`
            }else{
                shippingSpan += `<th>$ <span>${shipping}</span></th>`
            }

            let orderDetails;
            orderItem.forEach(function (item,i){
                orderDetails += `
                    <tr>
                        <th colSpan="2"><span>${item.products.name}</span></th>
                        <th>${item.quantity}</th>
                        <th>$ <span>${item.products.cost}</span></th>
                    </tr>
                `
            })

            orderDetails += `             
                <tr>
                  <th colspan="3">小計</th>
                  <th>$ <span>${orderData.amount - shipping}</span></th>
                </tr>
                <tr>
                  <th colspan="3">運費</th>
                    ${shippingSpan}
                </tr>
            `
            $(".order_details_iner tbody").html(orderDetails)

            let subTotal = `
                <tr>
                  <th scope="col" colspan="3">總額</th>
                  <th scope="col">$ <span>${orderData.amount}</span></th>
                </tr>
            `
            $(".order_details_iner tfoot").html(subTotal)
        },
        error:function (error){
            alert(error.responseText)
        }

    })
}