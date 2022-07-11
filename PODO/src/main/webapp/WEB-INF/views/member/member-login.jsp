<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/login.css">

    <title>login</title>
</head>


<body>
    <main>

        <header>
            header

        </header>

        <div id="login-contaioner">
            <h3>로그인</h3>
            <form action="login" method="POST" name="login-form" id="login-form">
                <fieldset id="login-area">

                    <section>
                        <input type="text" id="ID-box" name="memberId" maxlength="20" placeholder="아이디를 입력해주세요.">
                        <input type="password" id="PW-box" name="memberPw" placeholder="비밀번호를 입력해주세요.">
                    </section>

                    <section>
                        <button id="loginBtn" class="loginBtn">로그인</button>
                    </section>

                </fieldset>



                <div class="under-login">
                    <label>   
                        <input type="checkbox" name="saveId"  id="saveId"> 아이디 저장
                    </label>
                        <a href="#">아이디 찾기  |</a>  
                        <a href="#">비밀번호 찾기</a>
                </div>

            </form>

            <section id="outside-login">
            <span><button>회원가입</button></span>

                <button>카카오로 시작하기</button>
                <!-- 네이버 로그인 버튼 노출 영역 -->
                <div id="naver_id_login"></div>
            </section>
        </div>

        <footer>
            footer

        </footer>

    </main>

    <script type="text/javascript">

        var naver_id_login = new naver_id_login("7CM27UMDND6X1zZ8Ekqr", "http://127.0.0.1:5500/podo/PODO/src/main/webapp/resources/html/naver-login-callback.html");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("white", 2,40);
        naver_id_login.setDomain("http://127.0.0.1:5500/podo/PODO/src/main/webapp/resources/html/naver-login.html");
        naver_id_login.setState(state);
        naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();

  </script>
</body>
</html>