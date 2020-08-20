var form = document.querySelector("#regeform");

function goBack() {
    location.href = "../login/login.html";
}
function isSame() {
    //비밀번호가 맞는지 확인 맞으면 class명 same에 같다고 작성
	if(form.pw.value != form.pwCheck.value){
		same.innerHTML="<strong style='color:red;'>비밀번호가 맞지않습니다</strong>"
	}else{
		same.innerHTML="<strong style='color:black'>비밀번호가 일치합니다</strong>"
		var a = document.getElementsByClassName
	}
}
function id_check() {
	if(form.userid.value=="")
		form.userid.focus();
	else{
		$.ajax({
			type:'POST',
			url:'./idCheck.jsp',
			data:{
				"id":form.userid.value
			},
			success:function(data){
				if(data.result == true){
					checkID.innerHTML="<strong style='color:red;'>중복된 아이디입니다.</strong>"
					form.userid.value=""
				}else{
					checkID.innerHTML="<strong style='color:black'>사용가능 아이디입니다.</strong>"
				}
			},
		})
	}
}
function DaumPostcode() {
  new daum.Postcode({
    oncomplete: function (data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var addr = ""; // 주소 변수
      var extraAddr = ""; // 참고항목 변수
       //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
      if (data.userSelectedType === "R") {
        // 사용자가 도로명 주소를 선택했을 경우
        addr = data.roadAddress;
      } else {
        // 사용자가 지번 주소를 선택했을 경우(J)
        addr = data.jibunAddress;
      }
       // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById("postNum").value = data.zonecode;
      document.getElementById("roadAddress").value = addr;
      // 커서를 상세주소 필드로 이동한다.
      document.getElementById("wAddress").focus();
    },
  }).open();
}
function check_form(){
	if(form.userid.value.trim() == "")
		form.userid.focus()
	else if(form.userpw.value.trim() == "" || form.confirmuserpw.value.trim() == "")
		form.userpw.focus()
	else if(form.username.value.trim() == "")
		form.username.focus()
	else if(form.companyName.value.trim() == "")
		form.companyName.focus()
	else if(form.comNum1.value.trim()==""||form.comNum2.value.trim()==""||form.comNum3.value.trim()=="")
		form.comNum1.focus();
	else if(form.business_condition.value.trim()=="")
		form.business_condition.focus();
	else if(form.business_kind.value.trim()=="")
		form.business_kind.focus()
	else if(form.useremail.value.trim()=="")
		form.useremail.focus()
	else if(form.tel2.value.trim()==""||form.tel3.value.trim()=="")
		form.tel2.focus()
	else if(form.phone1.value.trim()==""||form.phone2.value.trim()==""||form.phone3.value.trim()=="")
		form.phone1.focus()
	else if(form.postNum.value.trim()=="")
		form.searchAddr.focus()
	else if(form.wAddress.value.trim()=="")
		form.wAddress.focus();
	else
		form.submit();
}