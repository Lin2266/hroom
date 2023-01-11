$(function (){
    if(member == null){
        alert("請登入會員")
        location.href="login.jsp";
    }
    showCheckOrder()
})

function showCheckOrder(){

    $.ajax({
        url:`OrderServlet?type=getAll`,
        type:"GET",
        dataType: "json",
        success:function (res){
            let orderHistory = "";
            res.forEach(function (order,no){
                orderHistory += `
                <tr>
                    <th scope="row">${no + 1}</th>
                    <td>${order.orderTimeS}</td>
                    <td>${order.parmentMethod == 1? "貨到付款":"信用卡"}</td>
                    <td>${order.amount}</td>
                    <td>${order.processing_status}</td>
                    <td><a href="order_items.jsp?type=get&orderId=${order.id}" class="view_order_items">明細</a></td>
                  </tr>
            `
            })

            $(".check_order tbody").html(orderHistory)
        },
        error:function (error){
            alert(error.responseText)
        }

    })
}