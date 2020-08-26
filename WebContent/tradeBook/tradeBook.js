var nowDate = new Date();

// ==================MainOrder.jsp SetDate==========================
//페이지가 로드시 Select박스의 날짜를 생성

function createDate() {
    settingYear();
    settingMonth();
    settingDay();
}
function settingYear() {
    let yearSelect = document.getElementsByName("year")[0];
    //범위 오늘년도기준 -5 ~ +2
    let startYear = nowDate.getFullYear() - 5;
    let lastYear = nowDate.getFullYear() + 2;
    let yearStr = "";
    for (i = startYear; i <= lastYear; i++) {
        if (nowDate.getFullYear() == i) {
            yearStr += "<option value=" + i + " selected>" + i + "</option>";
        } else {
            yearStr += "<option value=" + i + ">" + i + "</option>";
        }
    }
    yearSelect.innerHTML = yearStr;
}
function settingMonth() {
    let monthSelect = document.getElementsByName("month")[0];
    let startMonth = 1;
    let lastMonth = 12;
    let monthStr = "";
    for (i = startMonth; i <= lastMonth; i++) {
        if (nowDate.getMonth() + 1 == i) {
            monthStr += "<option value=" + i + " selected>" + i + "</option>";
        } else {
            monthStr += "<option value=" + i + ">" + i + "</option>";
        }
    }
    monthSelect.innerHTML = monthStr;
}
function settingDay() {
    let dateSelect = document.getElementsByName("day")[0];
    let startDate = 1;
    let today = nowDate.getDate();
    let lastDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0).getDate();
    let dayStr = "";
    for (i = startDate; i <= lastDate; i++) {
        if (i == today) {
            dayStr += "<option value=" + i + " selected>" + i + "</option>";
        } else {
            dayStr += "<option value=" + i + ">" + i + "</option>";
        }
    }
    dateSelect.innerHTML = dayStr;
}
function modelheaderline() {
    $("body").css("padding-right", "0px").removeClass("modal-open");
    $(".modal-backdrop").remove();
}
//거래처 정보 조회
function searchbooks() {
    var choice = document.querySelector(".choice").value;
    var word = document.querySelector(".searchword").value;
    location.href = "tradeBooks.jsp?searchWord=" + word + "&choice=" + choice;
}
function postNum() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = "";
            var extraAddr = "";

            if (data.userSelectedType === "R") {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if (data.userSelectedType === "R") {
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                if (data.buildingName !== "" && data.apartment === "Y") {
                    extraAddr += extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
                }

                if (extraAddr !== "") {
                    extraAddr = " (" + extraAddr + ")";
                }
            }
            document.getElementById("address1").value = data.zonecode || "";
            document.getElementById("address2").value = addr || "";
            document.getElementById("address2").focus();
        },
    }).open();
}
// 거래처별 조회(내역검색 및 날짜)를 위한 기능 ajax 를사용하기위한 초기설정
function buySeqGetBtn(seq,companyName) {
    document.getElementById("frm").setAttribute("value", seq);
    document.getElementById("companyName").setAttribute("value",companyName);
    var select = document.querySelector(".tradeselector").textContent;


    $.ajax({
        type: "GET",
        url: "./clientInfoSearch.jsp",
        dataType: "json",
        data: {
            seq: seq,
            search: document.getElementById("searchWordJw").value,
        },
        success: function (data) {
            $("#contentList").html("");
            let index = 0;
            let text = "";
            $.each(data, function (i, item) {
                index = i + 1;
                text +=
                    "<tr name='"+seq+"'>"  +
                    "<td> " +
                    index +
                    "</td>" +
                    "<td>" +
                    item.ledgerdate +
                    "</td>" +
                    "<td>" +
                    item.ledgersort +
                    "</td>" +
                    "<td>" +
                    item.ledgerproductname +
                    "</td>" +
                    "<td>" +
                    item.ledgersupplyprice +
                    "</td>" +
                    "<td>" +
                    item.ledgertaxvalue +
                    "</td>" +
                    "<td>" +
                    item.ledgernotcollectmoney +
                    "</td>" +
                    "<td>" +
                    item.ledgercollectmoney +
                    "</td>" +
                    "<td>" +
                    item.ledgertotal +
                    "</td></tr>";
            });
            $("#contentList").html(text);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("상세내역을 살펴보실경우 거래처정보란 테이블 거래처를 클릭해 주십시오.");
        },
    });
}

document.querySelector(".searchWordBtn").onclick = function () {
    const seq = document.querySelector("#frm").value;
    var select = document.querySelector(".tradeselector").textContent; //올셀렉터로 시퀀스를 다가져오려햇으나 실패.... 다중입력되었을시엔 매개로받는것이 낫다..
    /* let a= document.querySelectorAll(".buyerseq");  
      console.log(a);*/ $.ajax({
        type: "GET",
        url: "./clienttradeSearch.jsp",
        dataType: "json",
        data: {
            seq: seq,
            search: document.getElementById("searchWordJw").value,
        },
        success: function (data) {
            i = 1;
            $("#contentList").html("");
            let index = 0;
            let text = "";
            $.each(data, function (i, item) {
                index = i + 1;
                text +=
                    "<tr name='"+seq+"'>"  +
                    "<td> " +
                    index +
                    "</td>" +
                    "<td>" +
                    item.ledgerdate +
                    "</td>" +
                    "<td>" +
                    item.ledgersort +
                    "</td>" +
                    "<td>" +
                    item.ledgerproductname +
                    "</td>" +
                    "<td>" +
                    item.ledgersupplyprice +
                    "</td>" +
                    "<td>" +
                    item.ledgertaxvalue +
                    "</td>" +
                    "<td>" +
                    item.ledgernotcollectmoney +
                    "</td>" +
                    "<td>" +
                    item.ledgercollectmoney +
                    "</td>" +
                    "<td>" +
                    item.ledgertotal +
                    "</td></tr>";
            });
            $("#contentList").html(text);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("상세내역을 살펴보실경우 거래처정보란 테이블 거래처를 클릭해 주십시오.");
        },
    });
};
document.querySelector(".datesaerchBtn").onclick = function () {
    const seq = document.querySelector("#frm").value;
    const term = "false";

    $.ajax({
        type: "GET",
        url: "./clientdateSearch.jsp",
        dataType: "json",
        data: {
            seq: seq,
            date: document.querySelector(".daydate").value,
            term: term,
        },
        success: function (data) {
            $("#contentList").html("");
            let index = 0;
            let text = "";
            $.each(data, function (i, item) {
                index = i + 1;
                text +=
                    "<tr name='"+seq+"'>"  +
                    "<td> " +
                    index +
                    "</td>" +
                    "<td>" +
                    item.ledgerdate +
                    "</td>" +
                    "<td>" +
                    item.ledgersort +
                    "</td>" +
                    "<td>" +
                    item.ledgerproductname +
                    "</td>" +
                    "<td>" +
                    item.ledgersupplyprice +
                    "</td>" +
                    "<td>" +
                    item.ledgertaxvalue +
                    "</td>" +
                    "<td>" +
                    item.ledgernotcollectmoney +
                    "</td>" +
                    "<td>" +
                    item.ledgercollectmoney +
                    "</td>" +
                    "<td>" +
                    item.ledgertotal +
                    "</td></tr>";
            });
            $("#contentList").html(text);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("상세내역을 살펴보실경우 거래처정보란 테이블 거래처를 클릭해 주십시오.");
        },
    });
};

function termdatesaerchBtn() {
    let seq = document.querySelector("#frm").value;
    let term = "true";

    $.ajax({
        type: "GET",
        url: "./clientdateSearch.jsp",
        dataType: "json",
        data: {
            seq: seq,
            date1: document.querySelector(".termdate1").value,
            date2: document.querySelector(".termdate2").value,
            term: term,
        },
        success: function (data) {
            $("#contentList").html("");
            let index = 0;
            let text = "";
            $.each(data, function (i, item) {
                index = i + 1;
                text +=
                	 
                    "<tr name='"+seq+"'>"  +
                    "<td> " +
                    index +
                    "</td>" +
                    "<td>" +
                    item.ledgerdate +
                    "</td>" +
                    "<td>" +
                    item.ledgersort +
                    "</td>" +
                    "<td>" +
                    item.ledgerproductname +
                    "</td>" +
                    "<td>" +
                    item.ledgersupplyprice +
                    "</td>" +
                    "<td>" +
                    item.ledgertaxvalue +
                    "</td>" +
                    "<td>" +
                    item.ledgernotcollectmoney +
                    "</td>" +
                    "<td>" +
                    item.ledgercollectmoney +
                    "</td>" +
                    "<td>" +
                    item.ledgertotal +
                    "</td></tr>";
            });
            $("#contentList").html(text);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
            alert("상세내역을 살펴보실경우 거래처정보란 테이블 거래처를 클릭해 주십시오.");
        },
    });
}

	$(document).on('dblclick','#contentList tr',function(e){
		let buyerSeq = $(this).attr('name')
		let orderDate = $(this).children('td')[1].innerText
		let year  = orderDate.substring(0,4)
		let month = orderDate.substring(4,6)
		let day   = orderDate.substring(6)
		
		$('#detailSeq').val(buyerSeq)
		$('#detailYear').val(year)
		$('#detailMonth').val(month)
		$('#detailDay').val(day)
		
		$('#gotoOrderDetail').attr("action","../order/MainOrder.jsp")
		$('#gotoOrderDetail').submit()

	})

    $("#addBuyerModalBtn").click(function () {
        $.ajax({
            type: "GET",
            url: "./addtradeclient.jsp",
            dataType: "html",
            success: function (data) {
                $("#layerpop1").html(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("통신실패");
            },
        });
    });
    $("#stateMentOutputModalBtn").click(function () {
        const seq = document.querySelector("#frm").value;
        const year = document.querySelector("#year").value;
        const month = document.querySelector("#month").value;
        const day = document.querySelector("#day").value;
        
        $.ajax({
            type: "post",
            url: "./statement.jsp",
            dataType: "html",
            data: {
                seq: seq,
                year: year,
                month: month,
                day: day,
            },
            success: function (data) {
                $("#layerpop2").html(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                location.reload(true);
                alert("명세표 출력을 원하실경우 해당 거래처중 거래내역 목록의 거래일이 존재하는지 확인후 다시 시도해주십시오.");
            },
        });
    });
    $("#deleteBuyerModalBtn").click(function () {
    const companyclient=document.querySelector("#companyName").value
        $.ajax({
            type: "post",
            url: "./deletetradeclient.jsp",
            dataType: "html",
             data: {
            companyName: companyclient,
        },
            success: function (data) {
               alert("삭제성공");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
                alert("삭제실패");
            },
        });
    });
    