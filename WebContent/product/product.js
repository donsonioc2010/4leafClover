var form = document.getElementById('productForm')

$('#searchBtn').click(function(){
	//검색하는 기능 구현하기 Ajax로 데이터 가져와서 뿌려주기
	let word = $('#searchWord');
	if(word.val().trim()!=''){
		let searchType = $('#searchType').val()
		$.ajax({
			type:'GET',
			url:'./productAjax.jsp',
			datatype:'html',
			data:{
				'searchType':searchType,
				'searchWord':word.val().trim()
			},
			success:function(data){
				$('#productListTable tbody').html(data)
			},error:function(){
				alert('에러')
			}
		})
	}else{
		location.href = './product.jsp';
	}
})

//
$('#popExitBtn').click(function(){
	window.self.close();
})

//productAdd.jsp에서 등록버튼을 누를시에 Db에 보내기전에 유효성검사를 하는 기능
$('#insertProduct').click(function(){
	if($('#productName').val().trim()!=''){
		if($('#productTradePrice').val().trim()!=''){
			if($('#productPieceBox').val().trim()!=''){
				 $('body form').submit()
			}else{$('#productPieceBox').focus();}
		}else{$('#productTradePrice').focus()}
	}else{$('#productName').focus()}
})

//상품추가를 눌렀을시에 PopUp을 띄워서 추가페이지를 띄워줌
$("#addProductbtn").click(function(){
	let openUrl = 'http://'+location.host + '/ProductManagementSystem/product/productAdd.jsp'
	let popTitle = "AddProduct"
	let popOption = "width=550,height=450,left=500,top=50,status=no,scrollbars=yes"
	window.open(openUrl,popTitle,popOption)	 
});

//productSeqInfo.jsp에서 수정버튼을 눌렀을 시에 사용되는 기능
$('#ProductUpdateBtn').click(function(){
	if($('#productName').val().trim()!=''){
		if($('#productTradePrice').val().trim()!=''){
			if($('#productPieceBox').val().trim()!=''){
				 $('body form').submit()
			}else{$('#productPieceBox').focus();}
		}else{$('#productTradePrice').focus()}
	}else{$('#productName').focus()}
})

//productSeqInfo.jsp에서 삭제버튼을 눌렀을시에 data를 선택했을경우 삭제를 진행하는 기능
$('#deleteBtn').click(function(){
	let productSeq = $('#productNum').val().trim()
	if(productSeq ==''){
		alert('상품이 선택되지 않았습니다')
	}else{
		location.href='./productDelete.jsp?productSeq='+productSeq
	}
})
//상품정보들이 있는 테이블을 클릭했을시에 작동되는 함수
$('#productListTable tbody tr').click(function(e){
	// 1.상품번호 뽑기 ProductNum
	let productSeq=e.currentTarget.children[0].innerText;
	let openUrl = "./productSeqInfo.jsp?productSeq="+productSeq
	let popTitle = "ProductInfo"
	let popOption = "width=550,height=500,left=500,top=50,status=no,scrollbars=yes"
	window.open(openUrl,popTitle,popOption)	
});

//끝났나?