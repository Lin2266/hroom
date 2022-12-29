<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品維護</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="row justify-content-center">
		<h1>商品維護系統</h1>
	
	</div>
	<div class="row justify-content-center">
	<div>
	
		<form action="sale_person_mod" method="post">
		<table border="1">
			<tr>
		      <td>Id：<INPUT TYPE="text" NAME="ssid" size="10"></td>
			  <td>Kind：<INPUT TYPE="text" NAME="ssid" size="10"></td>
			  <td>Brand：<INPUT TYPE="text" NAME="ssid" size="10"></td>
			  <td>Name：<INPUT TYPE="text" NAME="ssid" size="10"></td>
			  <td>Color：<INPUT TYPE="text" NAME="ssid" size="10"></td>
			  <td>Description：<INPUT TYPE="text" NAME="ssid" size="10"></td>
			  <td>Cost：<INPUT TYPE="text" NAME="ssid" size="10"></td>
			  <td>Stock：<INPUT TYPE="text" NAME="ssid" size="10"></td>
			</tr>      
		</table><br>
		<div align="center">
		<button id="btnInsert" type="submit" class="btn btn-primary">查詢</button>
		<button id="btnUpdaye" type="submit" class="btn btn-primary">新增</button>
		<INPUT TYPE="submit" id="cleanbutton" value="清除" onclick="clean()"> 
		</div>
	</form>
		</div>

		<div class="col-sm-12">
			<div id="content"></div>
		</div>
	</div>


</body>
<script src="js/Students.js"></script>
<script>
		$(document).ready(function(){
			var contentType="${contentType}";
			console.log("contentType:"+contentType);
			var userInput=[];
			<c:forEach var="item" items="${userInput}">
				userInput.push(${item});
			</c:forEach>
			var table="<form name='form1'><table class='table table-striped table-hover'><thead><tr><th>請假</th><th>座號</th><th>姓名</th><th>性別</th><th>身高</th><th>體重</th><th>視力</th><th>本年度是否施打疫苗</th><th>疫苗施打日期</th><th>清除</th></tr></thead><tbody>";
			var tr="";
			
		   	$.each(students,function(idx,item){
				tr+="<tr>";	
					tr+="<td><input type='checkbox' id='chkInd'><input type='text' name='chkConfirm' value='N' hidden></td>";
					tr+="<td><input type='text' name='id' size='5' disabled value='"+item.id+"'></td>";
					tr+="<td><input type='text' name='name' size='5' disabled value='"+item.name+"'></td>";
					if(item.gender=='男'){
						tr+="<td><select name='gender'><option value=''>--</option><option value='男' selected>男</option><option value='女'>女</option></select></td>";
					}else if(item.gender=='女'){
						tr+="<td><select name='gender'><option value=''>--</option><option value='男'>男</option><option value='女' selected>女</option></select></td>";
					}else {
						tr+="<td><select name='gender'><option value=''>--</option><option value='男'>男</option><option value='女'>女</option></select></td>";
					}
					tr+="<td><input type='text' name='height' size='5' value='"+item.height+"'></td>";
					tr+="<td><input type='text' name='weight' size='5' value='"+item.weight+"'></td>";
					tr+="<td><input type='text' name='vision' size='5' value='"+item.vision+"'></td>";
					tr+="<td><input type='checkbox' id='vaccine'><input type='text' name='vaccine' value='N' hidden></td>";
					tr+="<td><input type='text' name='date' size='10' disabled  value='"+ item.date+"'></td>";
					tr+="<td><input type='button' id='clean' value='清除'></td>";
					tr+="</tr>";
			   });
										
			table+=tr+"</tbody></table></form>";
			
			$("#content").html(table);
			
			if("view"==contentType){
				$("#btnReset").on("click",function(){
				
					$("form").prop("action","studentsServlet?method=init");
				});
			}

			$("input[id='chkInd']").on("click",function(){
				if($(this).prop("checked")){
					$(this).closest("tr").find("select[name='gender'], input[name='height'], input[name='weight'], input[name='vision'], input[id='vaccine'], input[name='date'], input[id='clean']").prop("disabled",true);
					$(this).closest("tr").find("input[name='chkConfirm']").val('Y');
				}
				else{					
					$(this).closest("tr").find("input[name='chkConfirm']").val('N');
					if($("input[id='vaccine']").prop("checked")){
						$(this).closest("tr").find("select[name='gender'], input[name='height'], input[name='weight'], input[name='vision'], input[id='vaccine'],input[name='date'], input[id='clean']").prop("disabled",false);
					}else{
						//$(this).closest("tr").find("input[name='date']").prop("disabled",true);
						$(this).closest("tr").find("select[name='gender'], input[name='height'], input[name='weight'], input[name='vision'], input[id='vaccine'], input[id='clean']").prop("disabled",false);
					}
				}
			});

			//vaccine
			$("input[id='vaccine']").on("click",function(){
				if($(this).prop("checked")){
					$(this).closest("tr").find("input[name='date']").prop("disabled",false);
					$(this).closest("tr").find("input[name='vaccine']").val('Y');
				}
			  	else{ 
					$(this).closest("tr").find("input[name='date']").prop("disabled",true);
					$(this).closest("tr").find("input[name='vaccine']").val('N');
				}
			});
			//clean
			$("input[id='clean']").on("click",function(){
				$(this).closest("tr").find("input[name='height']").val('');
				$(this).closest("tr").find("input[name='weight']").val('');
				$(this).closest("tr").find("input[name='vision']").val('');
				$(this).closest("tr").find("select[name='gender']").val('');
				$(this).closest("tr").find("input[id='vaccine']").prop("checked",false);
				$(this).closest("tr").find("input[name='date']").val('');
			});
			//sent
            $("#btnSend").on("click",function(){
            	$('input[name="id"]').prop('disabled', false);
                $('input[name="name"]').prop('disabled', false);
                $('select[name="gender"]').prop('disabled', false);
                $('input[name="height"]').prop('disabled', false);
                $('input[name="weight"]').prop('disabled', false);
                $('input[name="vision"]').prop('disabled', false);
                $('input[name="name"]').prop('disabled', false);
                $('input[name="date"]').prop('disabled', false);
                $(this).hide();
				//console.log($("form[name='form1']").serializeArray());
				
				var elementName = $("form[name='form1']").serializeArray().map(function(item){

					return item.name;
				});
				
				//console.log(elementName);
				
				var formData={};
				
				//收集控制項名稱
				$.each(elementName,function(idx,item){
					formData[item]=[];
				});
				
				//console.log(formData);
				//開始塞值
				
				$.each($("form[name='form1']").serializeArray(),function(){
					formData[this.name].push(this.value);
				});
				//console.log("=================");
				//console.log(formData);
				
				$.ajax({
					url:"studentsServlet?method=doRender",
					data: JSON.stringify(formData),
				    type: "POST",
				    dataType: "json",
				    contentType: "application/json;charset=utf-8",
				    success:function(response){
				    	$("#content").html("");
				    	console.log("hi");
				    	var newtable="<table class='table table-striped table-hover'><thead><tr><th>請假</th><th>座號</th><th>姓名</th><th>性別</th><th>身高</th><th>體重</th><th>視力</th><th>本年度是否施打疫苗</th><th>疫苗施打日期</th><th>清除</th></tr></thead><tbody>";
				    	var tr="";
				    	$.each(response,function(idx,item){
					    tr+="<tr>";
						tr+="<td>"+item.chkConfirm+"</td>";
						tr+="<td>"+item.id+"</td>";
						tr+="<td>"+item.name+"</td>";
						tr+="<td>"+item.gender+"</td>";
						tr+="<td>"+item.height+"</td>";
						tr+="<td>"+item.weight+"</td>";
						tr+="<td>"+item.vision+"</td>";
						tr+="<td>"+item.vaccine+"</td>";
						tr+="<td>"+item.date+"</td>";
						tr+="<td><input type='button' name='clean' value='清除' hidden></td>";
						tr+="</tr>";
						});
				    	newtable+=tr+"</tbody></table>";
						$("#content").html(newtable);
				    },
				    error:function(response){
				    	console.log("fail");
				    }
				});				
			   });	
			
		});
		
</script>

</body>
</html>