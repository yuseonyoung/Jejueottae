<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

	<div>
		<h2>IAMPORT 결제 데모</h2>
		<li>
			<button id="iamportPayment" type="button">결제테스트</button>
		</li>
	</div>
</body>

<script type="text/javascript">
		//문서가 준비되면 제일 먼저 실행
		$(document).ready(function() {
			$("#iamportPayment").click(function() {
				payment(); //버튼 클릭하면 호출 
			});
		})

	//버튼 클릭하면 실행p|{R리}
		function payment(data) {
			IMP.init('imp47052640');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
			IMP.request_pay({// param
				pg : "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
				pay_method : "card", //지불 방법
				merchant_uid : "iamport_test_004", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
				name : "숙박", //결제창에 노출될 상품명
				amount : 100, //금액
				buyer_email : "alsl1597@naver.com",
				buyer_name : "Queka",
				buyer_tel : "01012341234"
			},
					function(rsp) { // callback
						if (rsp.success) {
							alert("완료 -> imp_uid : " + rsp.imp_uid
									+ " / merchant_uid(orderKey) : "
									+ rsp.merchant_uid);
							//주소이동시키기 해야함@@@@
							
						} else {
							alert("실패 : 코드(" + rsp.error_code + ") / 메세지("
									+ rsp.error_msg + ")");
						}
					});
		}
	</script>
	
</html>