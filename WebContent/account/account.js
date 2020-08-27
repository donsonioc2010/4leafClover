
function searchBuyer() {
	//Ajax로 비동기통신으로 HTML 받아서TABLE에 적용하기
	var choice = document.getElementById("choice").value;
	var search = document.getElementById("search").value;
	if(search.trim()!=""){
	 	location.href = "./account.jsp?word=" + search + "&category=" + choice; // 내가 검색한 항목 
	}else{
		location.href = "./account.jsp"; // 검색하지 않았을 경우 원래 페이지로
	}
}

function getInfo(seq){     			// 거래처목록 td tag에 onclick에 id줘서 가져오기 
	let seqNum = seq;
	$.ajax({
		type:'POST',       			// post 방식으로 받기
		url:'./getBuyerInfo.jsp', 	// 받아오기
		data:{"seq":seqNum},        // 시퀀스로 받기(dao에 seq으로 받아오는거 만들기)
		
		success:function(data){  // document.getElementById("내가넣을태그의id값").value = data.(getBuyerInfo파일의 별명)
			$('#updateBuyerSeq').val(seq)
			$("#companyname").val(data.buyerCompanyName);	// 거래처명
			$("#ceoname").val(data.buyerceoname);			// 대표자명
			$("#condition").val(data.buyercondition);		// 업태
			$("#kinds").val(data.buyerkinds);				// 종목
			$("#companynum").val(data.buyercompanynum);		// 사업자번호
			$("#address1").val(data.buyeraddress1);			// 우편번호
			$("#address2").val(data.buyeraddress2);			// 기본주소
			$("#address3").val(data.buyeraddress3);			// 하위주소
			$("#admin").val(data.buyeradmin);				// 담당자
			$("#email").val(data.buyeremail);				// 이메일
			$("#telnum").val(data.buyertel);				// 전화번호
			$("#firstday").val(data.buyerfirstday);			// 첫거래일
			$("#memo").val(data.buyermemo);					// 메모
			$("#homepage").val(data.buyerhomepage);			// 홈페이지
		}
	})
}