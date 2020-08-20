<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="../init.css" />
    <link rel="stylesheet" href="./regeister.css" />
  </head>
  <body lang="ko">
  <center>
      <form action="regeisterAf.jsp" method="post" name="regeister_member" id="regeform">
        <table width="800">
          <tr height="40">
            <td align="center"><b>[회원가입]</b></td>
          </tr>
        </table>
        <table
          width="700"
          height="600"
          cellpadding="0"
          style="border-collapse: collapse; font-size: 9pt;"
        >
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">회원 ID</td>
            <td>
              <input type="text" name="userid" />
              &nbsp;
              <a href="javascript:id_check()">[ID 중복 검사]</a>
              <br>
              <span id="checkID"></span>
            </td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">비밀번호</td>
            <td>
              <input
                type="password"
                name="userpw"
                id="pw"
                onchange="isSame()"
              />
            </td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">비밀번호 확인</td>
            <td>
              <input
                type="password"
                name="confirmuserpw"
                id="pwCheck"
                onchange="isSame()"
              />&nbsp;&nbsp;
              <span id="same"></span>
            </td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">대 표 자 명</td>
            <td>
              <input type="text" name="username" maxlength="4" />
            </td>
          </tr>
                    <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">회 사 이 름</td>
            <td>
              <input type="text" name="companyName" />
            </td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">사업자번호</td>
            <td>
              <input
                type="text"
                name="comNum1"
                size="3"
                maxlength="3"
                onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
              />-
              <input
                type="text"
                name="comNum2"
                size="2"
                maxlength="2"
                onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
              />-
              <input
                type="text"
                name="comNum3"
                size="5"
                maxlength="5"
                onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
              />
            </td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">업태</td>
            <td><input type="tel" name="business_condition" /></td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">종목</td>
            <td><input type="text" name="business_kind" /></td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">이메일</td>
            <td><input type="email" name="useremail" /></td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">전화번호</td>
            <td>
              <select name="tel1" id="tel1">
                <option value="02">02</option>
                <option value="031">031</option>
                <option value="033">033</option>
                <option value="043">043</option>
                <option value="041">041</option>
                <option value="054">054</option>
                <option value="055">055</option>
                <option value="063">063</option>
                <option value="061">061</option>
                <option value="064">064</option>
                <option value="070">070</option>
              </select>
              <input
                type="tel"
                name="tel2"
                size="4"
                maxlength="4"
                onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
              />-
              <input
                type="tel"
                name="tel3"
                size="4"
                maxlength="4"
                onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
              />
            </td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr class="register" height="30">
            <td width="5%" align="center">*</td>
            <td width="15%">핸드폰번호</td>
            <td>
              <input
                type="tel"
                name="phone1"
                size="4"
                maxlength="3"
                onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
              />-
              <input
                type="tel"
                name="phone2"
                size="4"
                maxlength="4"
                onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
              />-
              <input
                type="tel"
                name="phone3"
                size="4"
                maxlength="4"
                onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"
              />
            </td>
          </tr>
          <tr height="7">
            <td colspan="3"><hr /></td>
          </tr>
          <tr>
            <td width="5%" align="center">*</td>
            <td width="15%">주 소</td>
            <td>
              <input
                type="text"
                size="10"
                name="postNum"
                id="postNum"
                placeholder="우편번호"
                readonly="readonly"
                onclick="DaumPostcode()"
              />
              <input
                type="button"
                name="searchAddr"
                onclick="DaumPostcode()"
                value="우편번호 찾기"
              /><br /><br />
              <input
                type="text"
                size="60"
                name="roadAddress"
                id="roadAddress"
                placeholder="도로명주소"
                readonly="readonly"
                onclick="DaumPostcode()"
              />
              <br /><br />
              <input
                type="text"
                name="wAddress"
                id="wAddress"
                placeholder="상세주소"
                size="60"
              />
            </td>
          </tr>
        </table>
        <br />
        <table>
          <tr height="40">
            <td>
              <input type="button" value="돌아가기" onclick="goBack();" />
              <input type="button" value="회원가입" onclick="check_form();"/>
            </td>
          </tr>
        </table>
      </form>
</center>
    <script src="./regeister.js"></script>
  </body>
</html>
