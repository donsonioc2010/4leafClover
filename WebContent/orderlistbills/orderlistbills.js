function goPage(pageNum) {
	location.href = "orderlistbills.jsp?pageNumber="+pageNum;
}

$(document).ready(function(){
	let order_date = order_date;
	$.ajax({
		type : 'POST',
		url : './addOrderBillList.jsp',
		data:{"order_date":order_date},
		success:function(data){
			alert(data);
			document.getElementById("row1").value = data.Product_name;
		}
	});
});
