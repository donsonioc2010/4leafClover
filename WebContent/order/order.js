var nowDate = new Date()
var openPage = opener.document
var form = ''
// ==================MainOrder.jsp SetDate==========================
	//페이지가 로드시 Select박스의 날짜를 생성
	function loadDate(y,m,d,seq){
		settingYearload(y);
		settingMonthload(m);
		settingDayload(d);
		document.getElementsByName('buyerSeq')[0].value = seq
		searchList();
		form = document.getElementById('dataForm')
	}
		function settingYearload(y){
		let yearSelect = document.getElementsByName('year')[0]
		//범위 오늘년도기준 -5 ~ +2
		let startYear = nowDate.getFullYear() - 5
		let lastYear = nowDate.getFullYear() + 2
		let yearStr=""
		for(i=startYear; i<=lastYear; i++){
			if(y==i){
				yearStr+="<option value="+i+" selected>"+i+"</option>"
			}else{
				yearStr+="<option value="+i+">"+i+"</option>"
			}
		}
		yearSelect.innerHTML = yearStr
	}
	function settingMonthload(m){
		let monthSelect = document.getElementsByName('month')[0]
		let startMonth = 1
		let lastMonth = 12
		let monthStr=""
		for(i=startMonth; i<=lastMonth; i++){
			if(m == i){
				monthStr+="<option value="+i+" selected>"+i+"</option>"
			}else{
				monthStr+="<option value="+i+">"+i+"</option>"
			}
		}
		monthSelect.innerHTML = monthStr
	}
	function settingDayload(d){
		let dateSelect = document.getElementsByName('day')[0]
		let startDate = 1
		let today=nowDate.getDate()
		let lastDate = new Date(nowDate.getFullYear(),nowDate.getMonth()+1,0).getDate()
		let dayStr=''
		for(i=startDate; i<=lastDate; i++){
			if(i==d){
				dayStr+="<option value="+i+" selected>"+i+"</option>"
			}else{
				dayStr+="<option value="+i+">"+i+"</option>"
			}
		}	
		dateSelect.innerHTML = dayStr
	}
	
	function createDate(){
		settingYear();
		settingMonth();
		settingDay();	
		form = document.getElementById('dataForm')
	}
	function settingYear(){
		let yearSelect = document.getElementsByName('year')[0]
		//범위 오늘년도기준 -5 ~ +2
		let startYear = nowDate.getFullYear() - 5
		let lastYear = nowDate.getFullYear() + 2
		let yearStr=""
		for(i=startYear; i<=lastYear; i++){
			if(nowDate.getFullYear()==i){
				yearStr+="<option value="+i+" selected>"+i+"</option>"
			}else{
				yearStr+="<option value="+i+">"+i+"</option>"
			}
		}
		yearSelect.innerHTML = yearStr
	}
	function settingMonth(){
		let monthSelect = document.getElementsByName('month')[0]
		let startMonth = 1
		let lastMonth = 12
		let monthStr=""
		for(i=startMonth; i<=lastMonth; i++){
			if((nowDate.getMonth()+1) == i){
				monthStr+="<option value="+i+" selected>"+i+"</option>"
			}else{
				monthStr+="<option value="+i+">"+i+"</option>"
			}
		}
		monthSelect.innerHTML = monthStr
	}
	function settingDay(){
		let dateSelect = document.getElementsByName('day')[0]
		let startDate = 1
		let today=nowDate.getDate()
		let lastDate = new Date(nowDate.getFullYear(),nowDate.getMonth()+1,0).getDate()
		let dayStr=''
		for(i=startDate; i<=lastDate; i++){
			if(i==today){
				dayStr+="<option value="+i+" selected>"+i+"</option>"
			}else{
				dayStr+="<option value="+i+">"+i+"</option>"
			}
		}	
		dateSelect.innerHTML = dayStr
	}
	
	//YearBox혹은 MonthBox를 변경할때마다 해당월의 마지막날짜에 맞게 DateSelect박스 조절
	function getMonthDay(){
	//GetComponent And Active
		let dateSelect = document.getElementsByName('day')[0]
	//Year,Month Get
		let year = document.getElementsByName('year')[0].value
		let month = document.getElementsByName('month')[0].value
	//SettingDate 
		//0을 해야 해당월의 마지막날로 셋팅이됨(month를 -1하고 1일로 하는 방법도 있다)
		let setDate = new Date(year,month,0)
	//initDate 
		let startDate = 1
		let lastDate = setDate.getDate()
		let dayStr = ""
	//문자열생성
		for(i=startDate; i<=lastDate; i++){
			if(i==1){
				dayStr+="<option value="+i+" selected>"+i+"</option>"
			}else{
				dayStr+="<option value="+i+">"+i+"</option>"
			}
		}
		dateSelect.innerHTML = dayStr
	}

//MainOrder.jsp PopUp========================================
	//order.jsp에서 company_listjsp 팝업 띄우기
	function popCompanyList() {
		let openUrl = "company_list.jsp"
		let popTitle = "CompanyList"
		let popOption = "width = 550, height = 600, top = 300, status = no, scrollbars = yes"
		window.open(openUrl,popTitle,popOption)	
	}

//Company_list.jsp => Order.jsp로 선택한 Data를  보내는 함수 =========================
	function SendCompanyInfo() {
		let CompanyListChkBox = document.getElementsByName("chkBox");
		/*	Company_list.jsp 에 정의한 내용
			name=BuyerSeqNum
			0=BuyerCompanyNum(회사번호), 1=BuyerTelNum(회사번호), 
			2=BuyerCompanyName(회사명), 3=BuyerCeo(대표명)
		*/
		for(i=0; i<CompanyListChkBox.length; i++){
			if(CompanyListChkBox[i].checked){
				let BuyerSeq = CompanyListChkBox[i].value
				let Buyer = document.getElementsByName(BuyerSeq)
				
				//order.jsp = company_list.jsp
				openPage.getElementsByName("buyerSeq")[0].value = BuyerSeq
				openPage.getElementsByName("buyerCompanyName")[0].value = Buyer[2].innerHTML
				openPage.getElementsByName("buyerCeo")[0].value = Buyer[3].innerHTML.trim()
				openPage.getElementsByName("buyerCompanyNum")[0].value = Buyer[0].value
				openPage.getElementsByName("buyerTelNum")[0].value = Buyer[1].value
				opener.$('#getSearchList').trigger('click')//오픈페이지 실행
				break
			}
		} //버튼을누르면 선택을 했건 안했건 팝업을 끔
		window.close()
	}
	
//MainOrder.jsp 파일에서 검색버튼을 클릭시에 해당 일자의 주문내역을 전부 가져옴
	function searchList(){
		//1.BuyerSeq확인하기
		let buyerSeq = document.getElementsByName('buyerSeq')[0].value.trim()
		
		if(buyerSeq!=''){ 
			$.ajax({
				type:'POST',
				url:'./detailListSearch.jsp',
				dataType:'json',
				data:{
					"year":document.getElementsByName('year')[0].value,
					"month":document.getElementsByName('month')[0].value,
					"day":document.getElementsByName('day')[0].value,
					"buyerSeq":buyerSeq
				},
				success:function(data){
					if(data[0]!=null){
						settingOrder(data)
						settingDetail(data)
					}else{
						noHaveData()
					}
				},error:function(){
					alert('err')
				}
			})
		}else{
			alert('거래처를 선택해주세요')
		}
		//2 만약 있으면 yyyymmdd형식으로 가져감과 동시에 Ajax로 리스트내역을 가져오기
		//3 가져온 List를 orderList에 추가하기
	}
//검색했을때 데이터 열어주기
	function settingOrder(data){
		let order=data[0]
		document.getElementsByName('orderNum')[0].value=order.OrderNum
		document.getElementsByName('orderTotalPrice')[0].value=order.OrderTotal
		document.getElementsByName('orderSupplyPrice')[0].value=order.OrderSupplyValue
		document.getElementsByName('orderTaxPrice')[0].value=order.OrderTaxValue
		document.getElementsByName('notCollectMoney')[0].value=order.OrderNotCollectMoney
		document.getElementsByName('CollectMoney')[0].value=order.OrderCollectMoney
	}		
	function settingDetail(data){
		let order=data
		let row = ''
		for(i=1;i<Object.keys(order).length;i++){
			let detail=order[i]
			
			//"productSeq", "orderCount", "orderPrice", "PriceTax", "PriceSum"
			let count = Number(detail.orderCount)
			let orderPrice = Number(detail.orderPrice)/ count
			let tax = Number(detail.PriceTax)/count
			row+="<tr>"
				+	"<td class='cell1'>"
				+		"<input type='text'name='productSeq'value='"+detail.productSeq+"'class='no-write'readonly>"	
				+	"</td>"
				+	"<td class='cell2'>"
				+		"<input type='text'name='productName'value='"+detail.productName+"'class='no-write'style='width:94%'readonly>"
				+		"<button type='button'onclick='popProductList(this)'name='popProduct'>..</button>"			
				+	"</td>"			
				+	"<td class='cell3'>"
				+		"<input type='text'value='"+detail.productStandard+"'name='productStandard'readonly>"			
				+	"</td>"
				+	"<td class='cell4'>"		
				+		"<input type='number'value='"+count+"'name='orderCount'class='no-write'min='0'step='1'readonly>"			
				+	"</td>"			
				+	"<td class='cell5'>"
				+		"<input type='text'value='"+orderPrice+"'name='orderSupply'class='no-write'readonly>"
				+	"</td>"
				+	"<td class='cell6'>"
				+		"<input type='text'value='"+tax+"'name='orderTax'class='no-write'readonly>"
				+	"</td>"
				+	"<td class='cell7'>"
				+		"<input type='text'value='"+detail.PriceSum+"'name='orderTotal'class='no-write'readonly>"
				+	"</td>"
				+"</tr>"
				
		}
		document.getElementsByName('CollectMoney')[0].removeAttribute('disabled')
		document.getElementsByName('updateDetail')[0].removeAttribute('disabled')
		document.getElementById('statement').removeAttribute('disabled')
		document.getElementById('convertExcel').removeAttribute('disabled')
		document.getElementById('deleteBtn').removeAttribute('disabled')
		document.getElementById('orderSaveBtn').setAttribute('disabled',true)
		document.getElementById('addTdBtn').setAttribute('disabled',true)
		document.getElementById('detailList').innerHTML = row;

	}
	function noHaveData(){
		document.getElementsByName('orderNum')[0].value=''
		document.getElementsByName('orderTotalPrice')[0].value='0'
		document.getElementsByName('orderSupplyPrice')[0].value='0'
		document.getElementsByName('orderTaxPrice')[0].value='0'
		document.getElementsByName('notCollectMoney')[0].value='0'
		document.getElementsByName('CollectMoney')[0].value='0'
		document.getElementById('detailList').innerHTML=''
		
		document.getElementById('deleteBtn').setAttribute('disabled',true)
		document.getElementsByName('CollectMoney')[0].setAttribute('disabled',true)
		document.getElementsByName('updateDetail')[0].setAttribute('disabled',true)
		document.getElementById('addTdBtn').removeAttribute('disabled')
		document.getElementById('orderSaveBtn').removeAttribute('disabled')
		document.getElementById('statement').setAttribute('disabled',true)
		document.getElementById('convertExcel').setAttribute('disabled',true)
	}
//tbody에 이벤트추가하기
	//tbody의 하위 tr,td의 Value가 변경이 있을때마다 dayResult안의 컴포넌트들에 변경사항에 맞게 값바꾸기
	function calculTotal(){
		let indexlength=document.getElementsByName('productSeq').length
		let totalSupply=0
		let totalTax=0
		let totalPrice=0
		for(i = 0; i<indexlength;i++){
			//해당 tr변경
			let orderCount = document.getElementsByName('orderCount')[i].value
			let orderSupply = Number(document.getElementsByName('orderSupply')[i].value)
			let orderTax = Number(document.getElementsByName('orderTax')[i].value)
			let orderTotal = document.getElementsByName('orderTotal')[i]
			totalSupply += orderSupply * orderCount
			totalTax	+= orderTax * orderCount
			totalPrice  += (orderSupply+orderTax)*orderCount
			
			orderTotal.value = (orderSupply+orderTax)*orderCount
		}
		document.getElementsByName('orderTotalPrice')[0].value=totalPrice
		document.getElementsByName('orderSupplyPrice')[0].value=totalSupply
		document.getElementsByName('orderTaxPrice')[0].value=totalTax
		document.getElementsByName('notCollectMoney')[0].value=totalPrice
		document.getElementsByName('CollectMoney')[0].value=0
		document.getElementsByName('CollectMoney')[0].removeAttribute('disabled')
	}
	function takeMoney(){
		let totalPrice = document.getElementsByName('orderTotalPrice')[0].value
		let notCollectMoney = Number(document.getElementsByName('notCollectMoney')[0].value)
		let collectMoney = Number(document.getElementsByName('CollectMoney')[0].value)
		if(collectMoney<=totalPrice){
			document.getElementsByName('notCollectMoney')[0].value = totalPrice-collectMoney
		}else{
			alert('총합계보다 많은 금액 입력이 불가능 합니다')
			document.getElementsByName('CollectMoney')[0].value = 0
		}
	}
	
	function updateMoney(){
		//수정버튼을 누를시에 작용하는 function
		form.action='updateOrderList.jsp'
		form.submit()
	}
	
//추가버튼 클릭시 tbodyRow추가
	function addRow(){
		let confirmCompany = document.getElementsByName('buyerCompanyName')[0].value.trim()
		let row = null
		let tbody = document.getElementById('detailList')
		if(confirmCompany!=''){
			row="<tr>"
				+	"<td class='cell1'>"
				+		"<input type='text'name='productSeq'class='no-write'readonly>"	
				+	"</td>"
				+	"<td class='cell2'>"
				+		"<input type='text'name='productName'class='no-write'style='width:94%'readonly>"
				+		"<button type='button'onclick='popProductList(this)'name='popProduct'>..</button>"			
				+	"</td>"			
				+	"<td class='cell3'>"
				+		"<input type='text'name='productStandard'readonly>"			
				+	"</td>"
				+	"<td class='cell4'>"		
				+		"<input type='number'name='orderCount'class='no-write'min='0'step='1'disabled>"			
				+	"</td>"			
				+	"<td class='cell5'>"
				+		"<input type='text'name='orderSupply'class='no-write'readonly>"
				+	"</td>"
				+	"<td class='cell6'>"
				+		"<input type='text'name='orderTax'class='no-write'readonly>"
				+	"</td>"
				+	"<td class='cell7'>"
				+		"<input type='text'name='orderTotal'class='no-write'readonly>"
				+	"</td>"
				+"</tr>"
				//쓰기싫었는데 ㅠㅠ
				$(tbody).append(row);
		}else{
			alert('거래처를 선택해 주십시오')
		}
	}		
	
//MainOrder.jsp 저장버튼누를시에 DB로 데이터 Submit 유효성검사 실시하기
	function orderSave(){
		let companyName = document.getElementsByName('buyerCompanyName')[0].value.trim()
		if(companyName!=''){
			let totalPrice = document.getElementsByName('orderTotalPrice')[0].value.trim()
			let supplyPrice = document.getElementsByName('orderSupplyPrice')[0].value.trim()
			let taxPrice = document.getElementsByName('orderTaxPrice')[0].value.trim()
			let notCollectMoney = document.getElementsByName('notCollectMoney')[0].value
			let collectMoney = document.getElementsByName('CollectMoney')[0].value

			if(totalPrice ==''||totalPrice =='0'){
				if(supplyPrice ==''||supplyPrice =='0'){
					if(taxPrice ==''||taxPrice =='0'){
						if(notCollectMoney!=''){
							if(collectMoney!=''){
								alert('최소합계 0원 이상이어야 합니다.')
							}
						}
					}
				}
			}else{
				document.getElementById("dataForm").submit()
			}
		}else{
			alert('거래처를 선택해주세요')
		}
	}
	

	//둘다 날짜와 buyerSeq만 피룡함
//거래명세서 yyyymmdd
	function tradingStatement(){
		$.ajax({
			type:'POST',
			url:'../orderlistbills/informCheck.jsp',
			data:{
				"orderNum":form.orderNum.value,
				"seq":form.buyerSeq.value
			},
			success:function(data){
				if(data.result){
					form.action='../orderlistbills/orderlistbills.jsp'
					form.submit()
				}
			},
		})
	}
	
	
//물품선택 PopUp띄우기 
	function popProductList(obj){
		let companyName = document.getElementsByName('buyerCompanyName')[0].value.trim()
		if(companyName != ''){
			let componentIndex = document.getElementsByName('popProduct')
			for(i=0;i<componentIndex.length;i++){
				if(obj===componentIndex[i]){
					let openUrl = "product_list.jsp?inputNum="+i
					let popTitle = "product_list"
					let popOption = "width = 400, height = 600, top = 300, status = no, scrollbars = yes"
					
					window.open(openUrl, popTitle, popOption);
				}
			}
		}else{
			alert('거래처를 선택해주십시오')
		}
	}	
	
//Company_List.jsp 에서 검색에 따른 검색결과
	//엔터키로 조회
	function searchEnter(){
		if(window.event.keyCode==13){
			searchCompany()
		}
	}


		function SearchCompany(){
			//비동기로 가져와야함
		let searchWord = $('#searchWord').val().trim()
		let type = $('#searchType').val()
		if(type!='1'){
			if(searchWord!=''){
				$.ajax({
					type:'GET',
					url:'./searchCompanyList.jsp',
					datatype:'html',
					data:{
						'searchWord':searchWord,
						'type':type
					},
					success:function(data){
						console.log('??')
						$('.popup_LeftBox table #companyList').html(data)
					},error:function(){
						alert('에러')
					}
				})
			}else{
				$('#searchWord').focus()
			}
		}else{
			$.ajax({
				type:'GET',
				url:'./searchCompanyList.jsp',
				datatype:'html',
				data:{
					'searchWord':searchWord,
					'type':type
				},
				success:function(data){
					$('.popup_LeftBox table #companyList').html(data)
				},error:function(){
					alert('에러')
				}
			})
		}
	}
//productList.jsp=======================
	//검색버튼 눌렀을대 검색되는 기능 추가하기

$('#searchProductBtn').click(function(){
	searchProduct()
})
function enterSearchProduct(){
	searchProduct()
}
function searchProduct(){
	let searchWord = $('#searchProductWord').val().trim()
	
	if(searchWord!=''){
		$.ajax({
			type:'GET',
			url:'./searchProductList.jsp',
			datatype:'html',
			data:{
				'searchWord':searchWord
			},
			success:function(data){
				$('.popup_LeftBox table #productList').html(data)
			},error:function(){
				alert('에러')
			}
		})
	}
}
	
	
	//product_list.jsp => order.jsp로 Value를 보내는 기능
	function SendProductInfo(inputNum){
		let productListChkBox = document.getElementsByName("chkBox");
		//선택된 checkbox index를 찾기
		for(i=0; i<productListChkBox.length; i++){
			if(productListChkBox[i].checked){
				let companyName = openPage.getElementsByName('buyerCompanyName')[0].value.trim()
				if(companyName != ''){
					let productSeq = productListChkBox[i].value;
					let productName = document.getElementsByName('productName')[i].innerText
					let productSupply = document.getElementsByName('productSupply')[i].innerText
					let productStandard = document.getElementsByName('productStandard')[i].innerText
					
					//열려있는 페이지
					let openPagePrpductSeq = openPage.getElementsByName('productSeq')[inputNum]
					let openPageProductName = openPage.getElementsByName('productName')[inputNum]
					let openPageStandard = openPage.getElementsByName('productStandard')[inputNum]
					let openPageSuplyPrice = openPage.getElementsByName('orderSupply')[inputNum]
					
					//금액 관련
					let price = Number(productSupply)
					let tax = price / 10
					
					//팝업창 => OrderList로 Value이동
					openPagePrpductSeq.value = productSeq
					openPageProductName.value = productName
					openPageStandard.value = productStandard
					openPage.getElementsByName('orderCount')[inputNum].value = 0
					openPageSuplyPrice.value = price
					openPage.getElementsByName('orderTax')[inputNum].value = tax
					openPage.getElementsByName('orderTotal')[inputNum].value = 0
					openPage.getElementsByName('orderCount')[inputNum].removeAttribute('disabled')
				}else{
					alert('거래처를 선택해주십시오')
				}
				window.close();
			}
		}
	}
//deleteBtn(List내역 하루치 전체 삭제 기능)
	function deleteList(){
		form.action='./deleteList.jsp'
		form.submit()
	}
	
//function util 1=>01
	//한글자 숫자를 2글자로 변형
	function changeNumber(num){
		let strNum = num+''
		if(strNum.length==1){
			strNum='0'+strNum
		}
		return strNum
	}
	
	function translateExcel(){
		let orderDate = $('#year').val()+changeNumber($('#month').val())+changeNumber($('#day').val())
		let buyerSeq = document.getElementsByName('buyerSeq')[0].value
		/*$.ajax({
				type:'POST',
				url:'./orderListToExcel.jsp',
				data:{
					'buyerSeq':buyerSeq,
					'orderDate':orderDate
				},
				success:function(data){
					
				},error:function(){
					alert('에러')
				}
			})*/
		let openUrl = "orderListToExcel.jsp?buyerSeq="+buyerSeq+"&orderDate="+orderDate
		let popTitle = "excelDownload"
		let popOption = "width = 400, height = 200, top = 300, status = no, scrollbars = yes"
		
		window.open(openUrl, popTitle, popOption);
	}