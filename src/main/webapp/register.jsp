<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Montserrat:400,800');

* {
	box-sizing: border-box;
}


.login-container {
  display: grid;
  grid-template-rows: auto 1fr auto; /* 3 rows: header, login body, footer */
  height: 120vh;
  
}

.header {
  grid-row: 1;
}

.login-body {
  grid-row: 2;
}

.footer {
  grid-row: 3;
}

.loginbody {
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 250px;
	margin: 200px 0 50px;
}

.logingh1 {
	font-weight: bold;
	margin: 0;
}

.logingh2 {
	text-align: center;
}

.loginp {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
	color: white;
}

.logina {
	color: #333;
	font-size: 14px;
	text-decoration: none;
	margin: 15px 0;
}

.loginbutton {
	border-radius: 20px;
	border: 1px solid #FF4B2B;
	background-color: #FF4B2B;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

.signupbutton {
	border-radius: 20px;
	border: 1px solid #FFFFFF;
	background-color: transparent;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

.loginform {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.logincontainer {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	position: relative;
	overflow: hidden;
	width: 1200px;
	max-width: 100%;
	min-height: 600px;
}

.form-logincontainer {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.logincontainer.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.logincontainer.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@
keyframes show { 0%, 49.99% {
	opacity: 0;
	z-index: 1;
}

50


%
,
100


%
{
opacity


:


1
;


z-index


:


5
;


}
}
.overlay-logincontainer {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.logincontainer.right-panel-active .loginoverlay-container {
	transform: translateX(-100%);
}

.loginoverlay {
	background: #FFA600;
	background: -webkit-linear-gradient(to right, #FF4B2B, #FFA600);
	background: linear-gradient(to right, #FF4B2B, #FFA600);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.logincontainer.right-panel-active .loginoverlay {
	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.logincontainer.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.logincontainer.right-panel-active .overlay-right {
	transform: translateX(20%);
}

.social-container {
	margin: 20px 0;
}

.social-container a {
	border: 1px solid #DDDDDD;
	border-radius: 50%;
	display: inline-flex;
	justify-content: center;
	align-items: center;
	margin: 0 5px;
	height: 40px;
	width: 40px;
}

.NameSb {
	border-bottom: solid gray 3px;
	padding-bottom: 35px;
	margin: 15px 30px 10px 30px;
	width: 100%;
	height: 115px;
}

.NameSb2 {
	border-bottom: solid white 3px;
	padding-bottom: 15px;
	margin: 15px 30px 15px 30px;
	width: 100%;
	height: 130px;
}
</style>
<script type="text/javascript">
// 	let accheckrepeat,emaillcheckrepeat=false;
// 	document.getElementById('account').addEventListener('change', checkAccountReapeat);
	
// 	function checkAccountReapeat() {
// 		  var account = document.getElementById('account').value;
// 		  var xhr = new XMLHttpRequest();
// 		  xhr.onreadystatechange = function() {
// 		    if (xhr.readyState == XMLHttpRequest.DONE) {
// 		      if (xhr.status == 200) {
// 		        // If the account is not taken, display a message saying so
// 		        document.getElementById('account-result').innerHTML = 'Account is available';
// 		      } else {
// 		        // If the account is taken, display a message saying so
// 		        document.getElementById('account-result').innerHTML = 'Account is not available';
// 		      }
// 		    }
// 		  }
// 		  xhr.open('GET', '/check-account?account=' + account, true);
// 		  xhr.send();
// 		}





</script>
</head>
<body>
 <jsp:include page="/WEB-INF/subviews/header.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/subviews/breadcrumb.jsp"></jsp:include>	
<div class="login-container">
	<div class="loginbody">
		<form action="registerAccount" method="post" accept-charset="UTF-8"
			  class="row contact_form">

			<div class="logincontainer" id="logincontainer">

				<div class="form-logincontainer sign-in-container loginform">

					<br>
					<div class="NameSb" >
						<span id="acHelp"></span> <input type="text" name="account"
							placeholder="帳號:" id="account" required/> <label
							style="color: gray; font-size: 10px; text-align: left;">(至少6個字且必須包含英數字)
						</label>
						<br>
					</div>
					

					<div class="NameSb">
						<span id="pwHelp"></span> <input type="password" name="password"
							placeholder="密碼:" id="password" required/> <label
							style="color: gray; font-size: 10px; text-align: left;">(至少6個字且必須包含英數字、特殊字元[!@#$%^&*])
						</label><br>
					</div>



					<div class="NameSb">
						<span id="nameHelp"></span> <input type="text" name="name"
							placeholder="姓名:" id="name" /> <label
							style="color: gray; font-size: 10px; text-align: left;">(至少兩個字以上且必須全部為中文字)
						</label><br>
					</div>

				

					<div class="NameSb">
					<span id="phoneHelp"></span> 
						<input type="text" name="phone" placeholder="手機:" id="phone" />
					</div>





				</div>
				<div class="overlay-logincontainer">
					<div class="loginoverlay">

						<div class="overlay-panel overlay-right">
							


							
							
							<div class="NameSb2">
								<span id="mailHelp"></span> <input type="text" name="email"
									placeholder="信箱:" id="email" required/>
							</div>	
							
							<div class="NameSb2">
								<div class="col-md-12 form-group">
                                	<div id="twzipcode"></div>
                            	</div>

                            	<div class="col-md-12 form-group p_star">
                                	<input type="text" class="form-control" id="address" name="address" placeholder="地址:"required/>
                            	</div>
							</div>	

			
							<input type="Submit" class="signupbutton" value="註冊"
								id="idsubmit">	
								<br>		
									<a  onclick="inputValue()" class="signupbutton" id="preset">一鍵輸入註冊資料</a>				
						</div>
					</div>
				</div>
			</div>
		</form>
		
	</div>
	</div>

	
		<jsp:include page="/WEB-INF/subviews/footer.jsp"/>
		<script type="text/javascript">
	$(function(){
		  // 購買人地址選單
		 $("#twzipcode").twzipcode({
		  "css": ["city col-md-3 form-control", "county col-md-3 form-control", "zipCode col-md-3 form-control"],
		  "countyName": "city", // 指定城市 select name
		  "districtName": "county" // 指定地區 select name
		 });
		})
		
		
		
// 		let nameflag, acflag, pwdflag, mailflag ,phoneflag  = false;

	
	
// 		document.getElementById("account").addEventListener("blur", function() {

// 			let acId = document.getElementById("account");
// 			let acVal = acId.value;
// 			let acLen = acVal.length;
// 			let acsp = document.getElementById("acHelp");
// 			let acCh, flag1 = false, flag2 = false;

// 			if (acVal == "") {
// 				acsp.innerHTML = "請輸入帳號";
// 				document.getElementById("acHelp").style.color = "red";
// 				acflag = false;

// 			} else if (acLen >= 6) {
// 				for (let k = 0; k < acLen; k++) {
// 					let acCh = acVal.charAt(k).toUpperCase();
// 					if (acCh >= "A" && acCh <= "Z")
// 						flag1 = true;
// 					else if (acCh >= "0" && acCh <= "9")
// 						flag2 = true;
// 					if (flag1 && flag2)
// 						break;

// 				}
// 				if (flag1 && flag2) {
// 					acsp.innerHTML = "  正確";
// 					document.getElementById("acHelp").style.color = "green";
// 					acflag = true;

// 				} else if (flag1) {
// 					acsp.innerHTML = " 須包含數字";
// 					document.getElementById("acHelp").style.color = "red";
// 					acflag = false;

// 				} else if (flag2) {
// 					acsp.innerHTML = "  須包含英文字母";
// 					document.getElementById("acHelp").style.color = "red";
// 					acflag = false;

// 				} else {
// 					acsp.innerHTML = "  須包含英文字母、數字";
// 					document.getElementById("acHelp").style.color = "red";
// 					acflag = false;

// 				}
// 			} else {
// 				acsp.innerHTML = "  至少要6個字";
// 				document.getElementById("acHelp").style.color = "red";
// 				acflag = false;

// 			}
// 		})
// 		document.getElementById("account").addEventListener("blur", finalcheck);
// 		document.getElementById("account").addEventListener("blur", checkacrepeat);
// 		document.getElementById("account").addEventListener("blur", checkmailrepeat);
// 		document.getElementById("account").addEventListener("blur", checkbankrepeat);


		
		
		

// 		document.getElementById("password").addEventListener("blur",function() {

// 							let pwId = document.getElementById("password");
// 							let pwVal = pwId.value;
// 							let pwLen = pwVal.length;
// 							let pwsp = document.getElementById("pwHelp");
// 							let pwCh, flag1 = false, flag2 = false, flag3 = false;
// 							let pwre = new RegExp(/[!@#$%^&*]/);

// 							if (pwVal == "") {
// 								pwsp.innerHTML = "請輸入密碼";
// 								document.getElementById("pwHelp").style.color = "red";
// 								pwdflag = false;

// 							} else if (pwLen >= 6) {
// 								for (let k = 0; k < pwLen; k++) {
// 									let pwCh = pwVal.charAt(k).toUpperCase();
// 									if (pwCh >= "A" && pwCh <= "Z")
// 										flag1 = true;
// 									else if (pwCh >= "0" && pwCh <= "9")
// 										flag2 = true;
// 									else if (pwre.test(pwVal))
// 										flag3 = true;
// 									if (flag1 && flag2 && flag3)
// 										break;

// 								}
// 								if (flag1 && flag2 && flag3) {
// 									pwsp.innerHTML = "  正確";
// 									document.getElementById("pwHelp").style.color = "green";
// 									console.log("success!!!!!!")
// 									pwdflag = true;
// 								} else if (flag1 && flag2) {
// 									pwsp.innerHTML = "須包含特殊字元";
// 									document.getElementById("pwHelp").style.color = "red"
// 									pwdflag = false;

// 								} else if (flag2 && flag3) {
// 									pwsp.innerHTML = "  須包含英文字母";
// 									document.getElementById("pwHelp").style.color = "red"
// 									pwdflag = false;

// 								} else if (flag1 && flag3) {
// 									pwsp.innerHTML = "  須包含數字";
// 									document.getElementById("pwHelp").style.color = "red"
// 									pwdflag = false;

// 								} else if (flag1) {
// 									pwsp.innerHTML = "  須包含數字、特殊字元";
// 									document.getElementById("pwHelp").style.color = "red";
// 									pwdflag = false;

// 								} else if (flag2) {
// 									pwsp.innerHTML = "  須包含英文字母、特殊字元";
// 									document.getElementById("pwHelp").style.color = "red";
// 									pwdflag = false;

// 								} else {
// 									pwsp.innerHTML = "須包含英文字母、數字";
// 									document.getElementById("pwHelp").style.color = "red";
// 									pwdflag = false;

// 								}
// 							} else {
// 								pwsp.innerHTML = "  至少要6個字";
// 								document.getElementById("pwHelp").style.color = "red";
// 								pwdflag = false;

// 							}
// 						})
// 		document.getElementById("password").addEventListener("blur", finalcheck);
// 			document.getElementById("password").addEventListener("blur", checkacrepeat);
// 		document.getElementById("password").addEventListener("blur", checkmailrepeat);
// 		document.getElementById("password").addEventListener("blur", checkbankrepeat);
		
		
		

// 		document.getElementById("name").addEventListener("blur",function() {
// 							let name = document.getElementById("name");
// 							let nameVal = name.value;
// 							let nameLen = nameVal.length;
// 							let namespn = document.getElementById("nameHelp");
// 							let namere = new RegExp(/^[\u4e00-\u9fa5]+$/);
// 							if (nameVal == "") {
// 								namespn.innerHTML = "  請輸入姓名";
// 								document.getElementById("nameHelp").style.color = "red";
// 								nameflag = false;

// 							} else {
// 								if (nameLen < 2) {
// 									namespn.innerHTML = "  至少兩個字";
// 									document.getElementById("nameHelp").style.color = "red"
// 									nameflag = false;

// 								} else {
// 									if (namere.test(nameVal)) {
// 										namespn.innerHTML = "  正確";
// 										document.getElementById("nameHelp").style.color = "green";
// 										nameflag = true;

// 									} else {
// 										namespn.innerHTML = "  須為中文字";
// 										document.getElementById("nameHelp").style.color = "red"
// 										nameflag = false;
// 									}
// 								}
// 							}
// 						})

// 		document.getElementById("name").addEventListener("blur", finalcheck);
// 		document.getElementById("name").addEventListener("blur", checkacrepeat);
// 		document.getElementById("name").addEventListener("blur", checkmailrepeat);
// 		document.getElementById("name").addEventListener("blur", checkbankrepeat);
		
		
		

// 		document.getElementById("email").addEventListener("blur",function() {
// 							let mailId = document.getElementById("email");
// 							let mailVal = mailId.value;
// 							let mailLen = mailVal.length;
// 							let mailsp = document.getElementById("mailHelp");
// 							let mailre = new RegExp(/^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/);

// 							if (mailVal == "") {
// 								mailsp.innerHTML = "請輸入信箱";
// 								document.getElementById("mailHelp").style.color = "red";
// 								mailflag = false;
// 							} else {
// 								for (let k = 0; k < mailLen; k++) {
// 									let mailCh = mailVal.charAt(k).toUpperCase();
// 									if (mailre.test(mailVal)) {
// 										mailsp.innerHTML = " 正確";
// 										document.getElementById("mailHelp").style.color = "green";
// 										mailflag = true;
// 									}

// 									else {
// 										mailsp.innerHTML = "請輸入正確的信箱格式";
// 										document.getElementById("mailHelp").style.color = "red";
// 										mailflag = false;
// 									}
// 								}

// 							}

// 						})
// 		document.getElementById("email").addEventListener("blur", finalcheck);
// 		document.getElementById("email").addEventListener("blur", checkacrepeat);
// 		document.getElementById("email").addEventListener("blur", checkmailrepeat);
// 		document.getElementById("email").addEventListener("blur", checkbankrepeat);

		
		
		
// 		document.getElementById("phone").addEventListener("blur",function() {
// 							let phone = document.getElementById("phone");
// 							let phoneVal = phone.value;
// 							let phoneLen = phoneVal.length;
// 							let phonespn = document.getElementById("phoneHelp");
// 							let phonere = new RegExp("^09\\d{8}$");
// 							if (phoneVal == "") {
// 								phonespn.innerHTML = "請輸入手機號碼";
// 								document.getElementById("phoneHelp").style.color = "red";
// 								phoneflag = false;

// 							} else {
// 								console.log(phoneVal);
// 								if (phonere.test(phoneVal)) {
// 									phonespn.innerHTML = "正確";
// 									document.getElementById("phoneHelp").style.color = "green"
// 									phoneflag = true;

// 								} else {
// 									phonespn.innerHTML = "請輸入正確的手機號碼";
// 									document.getElementById("phoneHelp").style.color = "red"
// 									phoneflag = false;
// 								}
// 							}
// 						})

// 		document.getElementById("phone").addEventListener("blur", finalcheck);
// 		document.getElementById("phone").addEventListener("blur", checkacrepeat);
// 		document.getElementById("phone").addEventListener("blur", checkmailrepeat);
// 		document.getElementById("phone").addEventListener("blur", checkbankrepeat);

		
		
		
		
		
		
		
		

		
// /////////////////一鍵輸入
// 		function inputValue(){
// 			document.getElementById("account").value="EEIT151";
// 			document.getElementById("password").value="EEIT151!";
// 			document.getElementById("name").value="姿澈慧";
// 			document.getElementById("email").value="eeit15119@outlook.com";			
// 			document.getElementById("phone").value="0972324316";
// 		}
		
// ////////////////		
		
		
		
		
// 		function finalcheck() {
// 			if (nameflag && acflag && pwdflag && mailflag && phoneflag  && accheckrepeat && emaillcheckrepeat) {
// 				console.log(nameflag+','+acflag+','+pwdflag+','+mailflag+','+phoneflag+','+birthflag+','+accheckrepeat+','+emaillcheckrepeat)
// 				document.getElementById("idsubmit").removeAttribute("disabled")
// 			} else {
// 				console.log(nameflag+','+acflag+','+pwdflag+','+mailflag+','+phoneflag+','+birthflag+','+accheckrepeat+','+emaillcheckrepeat+)
// 				document.getElementById("idsubmit").setAttribute("disabled","true");
// 			}
// 		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.js"></script>