/*$(document).ready(function(){
    $("#popbutton").click(function(){
	   $('div.modal').modal({
			remote : 'statement.jsp',
			keyboard: true
	   });
    });*/
	
 /*   $("#layerpop1").click(function(){
	
        $('div.modal').modal({
            remote : 'tradeclient.jsp',
			keyboard: true
       });
});//명세서
    });*/


function modelheaderline(){
    $('body').css("padding-right", "0px").removeClass("modal-open");
    $('.modal-backdrop').remove();
}
  //거래처 정보 조회
function searchbooks() {
    var choice = document.querySelector('.choice').value;
    var word = document.querySelector('.searchword').value;
    location.href = 'tradeBooks.jsp?searchWord=' + word + '&choice=' + choice;
  }
  // 거래처별 조회(내역검색 및 날짜)를 위한 기능 ajax 를사용하기위한 초기설정
 function buySeqGetBtn(seq){
     document.getElementById("frm").setAttribute('value',seq);
     var select =document.querySelector(".tradeselector").textContent;
     // let a= document.querySelectorAll(".buyerseq");	
     //allselector 로 시퀀스를 다가져오려햇으나 실패.... 다중입력되었을시엔 매개로받는것이 낫다..
    	
	   $.ajax({
	       type: "GET",
           url : "./clientInfoSearch.jsp",
           dataType : "json",
           data : {
             "seq": seq,
        	 "search":document.getElementById('searchWordJw').value,
        	 
            },
           success : function(data){
              
               $("#contentList").html('')
        		
               let text=''
               $.each(data, function (i, item) {
        	   
                text +=
                  "<tr> "
                + "<td> "+i+"</td>"
                + "<td>"+item.ledgerdate+"</td>"
                + "<td>"+item.ledgersort+"</td>"
                + "<td>"+item.ledgerproductname+"</td>"
                + "<td>"+item.ledgersupplyprice+"</td>"
                + "<td>"+item.ledgertaxvalue+"</td>"
                + "<td>"+item.ledgercollectmoney+"</td>"
                + "<td>"+item.ledgernotcollectmoney+"</td>"
                + "<td>"+item.ledgertotal+"</td>"
                + "<td>"+item.ledgercompanytotal+"</td></tr>"
                
        
               });
               $("#contentList").html(text);       
    	  	 
           },
           error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
               alert("상세내역을 살펴보실경우 거래처정보란 테이블 거래처를 클릭해 주십시오.")
           } 
       });
  }
  
  
 
     document.querySelector(".searchWordBtn").onclick = function () {
       const seq= document.querySelector('#frm').value;
     var select =document.querySelector(".tradeselector").textContent;
     /* let a= document.querySelectorAll(".buyerseq");	
      console.log(a);*/  //올셀렉터로 시퀀스를 다가져오려햇으나 실패.... 다중입력되었을시엔 매개로받는것이 낫다..
    	
	   $.ajax({
	       type: "GET",
           url : "./clienttradeSearch.jsp",
           dataType : "json",
           data : {
             "seq": seq,
        	 "search":document.getElementById('searchWordJw').value
            },
           success : function(data){
               
               $("#contentList").html('')
        		
               let text=''
               $.each(data, function (i, item) {
        	   
                text +=
                  "<tr> "
                + "<td> "+i+"</td>"
                + "<td>"+item.ledgerdate+"</td>"
                + "<td>"+item.ledgersort+"</td>"
                + "<td>"+item.ledgerproductname+"</td>"
                + "<td>"+item.ledgersupplyprice+"</td>"
                + "<td>"+item.ledgertaxvalue+"</td>"
                + "<td>"+item.ledgercollectmoney+"</td>"
                + "<td>"+item.ledgernotcollectmoney+"</td>"
                + "<td>"+item.ledgertotal+"</td>"
                + "<td>"+item.ledgercompanytotal+"</td></tr>"
                
        
               });
               $("#contentList").html(text);       
    	  	  
           },
           error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
               alert("상세내역을 살펴보실경우 거래처정보란 테이블 거래처를 클릭해 주십시오.")
           } 
       });
  }
     document.querySelector(".datesaerchBtn").onclick = function() {
	       const seq= document.querySelector('#frm').value;
	       const term= 'false';
	   
	    	
		   $.ajax({
		       type: "GET",
	           url : "./clientdateSearch.jsp",
	           dataType : "json",
	           data : {
	             "seq": seq,
	        	 "date":document.querySelector('.daydate').value,
	        	 "term":term
	            },
	           success : function(data){
	               
	               $("#contentList").html('')
	        		
	               let text=''
	               $.each(data, function (i, item) {
	        	   
	                text +=
	                  "<tr> "
	                + "<td> "+i+"</td>"
	                + "<td>"+item.ledgerdate+"</td>"
	                + "<td>"+item.ledgersort+"</td>"
	                + "<td>"+item.ledgerproductname+"</td>"
	                + "<td>"+item.ledgersupplyprice+"</td>"
	                + "<td>"+item.ledgertaxvalue+"</td>"
	                + "<td>"+item.ledgercollectmoney+"</td>"
	                + "<td>"+item.ledgernotcollectmoney+"</td>"
	                + "<td>"+item.ledgertotal+"</td>"
	                + "<td>"+item.ledgercompanytotal+"</td></tr>"
	                
	        
	               });
	               $("#contentList").html(text);       
	    	  	  
	           },
	           error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	               alert("상세내역을 살펴보실경우 거래처정보란 테이블 거래처를 클릭해 주십시오.")
	           } 
	       });
	  }
     
    function termdatesaerchBtn() {
	       const seq= document.querySelector('#frm').value;
	     const term= 'true';
	   
	    	
		   $.ajax({
		       type: "GET",
	           url : "./clientdateSearch.jsp",
	           dataType : "json",
	           data : {
	             "seq": seq,
	        	 "date1":document.querySelector('.termdate1').value,
	        	 "date2":document.querySelector('.termdate2').value,
	        	 "term":term
	            },
	           success : function(data){
	               
	               $("#contentList").html('')
	        		
	               let text=''
	               $.each(data, function (i, item) {
	        	   
	                text +=
	                  "<tr> "
	                + "<td> "+i+"</td>"
	                + "<td>"+item.ledgerdate+"</td>"
	                + "<td>"+item.ledgersort+"</td>"
	                + "<td>"+item.ledgerproductname+"</td>"
	                + "<td>"+item.ledgersupplyprice+"</td>"
	                + "<td>"+item.ledgertaxvalue+"</td>"
	                + "<td>"+item.ledgercollectmoney+"</td>"
	                + "<td>"+item.ledgernotcollectmoney+"</td>"
	                + "<td>"+item.ledgertotal+"</td>"
	                + "<td>"+item.ledgercompanytotal+"</td></tr>"
	                
	        
	               });
	               $("#contentList").html(text);       
	    	  	  
	           },
	           error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
	               alert("상세내역을 살펴보실경우 거래처정보란 테이블 거래처를 클릭해 주십시오.")
	           } 
	       });
	  }