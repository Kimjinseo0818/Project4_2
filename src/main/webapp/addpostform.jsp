<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        #list {
            border-collapse: collapse;
        }
        #list td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        #list td:nth-child(odd){
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            color: white;
            background-color: #006bb3;
        }
    </style>
</head>
<body>

<h1>회원 추가</h1>
<form action="addpost.jsp" method="post" enctype="multipart/form-data">
    <table id="list">
        <tr><td>이름:</td><td><input type="text" name="name"/></td></tr>
        <tr><td>사진:</td><td><input type="file" name="photo"/></td></tr>
        <tr><td>생년월일:</td><td><input type="text" name="fromdate" placeholder="YYYY-MM-DD"/></td></tr>
        <tr><td>전화번호:</td><td><input type="tel" name="phone" placeholder="010-XXXX-XXXX" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"/></td></tr>
        <tr><td>이메일:</td><td><input type="email" name="email"/></td></tr>
        <tr><td>MBTI:</td><td><input type="text" name="mbti"/></td></tr>
        <tr><td>성별:</td><td>
            <input type="checkbox" name="gender" value="남자" onclick="checkOnlyOne(this)"> 남자 <br>
            <input type="checkbox" name="gender" value="여자" onclick="checkOnlyOne(this)"> 여자
        </td></tr>
    </table>
    <br>
    <input type="submit" value="Add"/> <button type="button" onclick="location.href='posts.jsp'">Back to List</button>
</form>
<script>
    function checkOnlyOne(element) {

        const checkboxes
            = document.getElementsByName("gender");

        checkboxes.forEach((cb) => {
            cb.checked = false;
        })

        element.checked = true;
    }
</script>
</body>
</html>