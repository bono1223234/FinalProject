<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="pagination" value="${map.pagination}" />
<c:set var="boardList" value="${map.boardList}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PODO 상품관리</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member/itemManage.css">

    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <form action="itemManage" method="POST" name="itemManage" id="itemManage">

    <div class="top-menu">
        <nav id="mainMenu">
            <a href="${contextPath}/member/itemUpload">상품등록</a>
            <%-- <a href="${contextPath}/myShop/main">상품관리</a> --%>
             <a href="${contextPath}/shop/main">상품관리</a> 
            <a href="#">구매/판매 내역</a>
        </nav>
    </div>
    <main>
    <div class="basic1">
        <section class="basic">
            <form class="search1" action="#" method="post" id="search">
                <input id="search2" type="text" placeholder="상품명을 입력해주세요.">
                <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </section>
        
    </div>   
    <div>
        <table>
            <thead>
                <tr id="head">
                    <th>사진</th>
                    <th>판매상태</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>조회수</th>
                    <th>최근수정일</th>
                    <th>기능</th>
                </tr>
            </thead>
            <tbody>

                <c:if test="${boardList == null}">
                    판매중인 물건이 없습니다.
                </c:if>
                <c:if test="${boardList != null}">

                    <c:forEach var="item" items="${boardList}">
                        <tr>
                            <td>
                                <a><img src="${contextPath}/resources/images/items/image1.jpg"></a>
                            </td>
                            
                            <td>
                                <%-- <c:if test="${item.tradeCondition == 옵션}"> --%>
                               <select>
                                    <option>${item.tradeCondition}</option>
                                    <option>판매 중</option>
                                    <option>예약 중</option>
                                    <option>판매완료</option>
                                </select>
                            </td>
                            <td><a href="#" id="name">${item.boardTitle}</a></td>
                            <td>${item.price} 원</td>
                            <td>${item.readCount}</td>
                            <td>${item.updateDate}</td>
                            <td class="choice">
                                <button class="choice1">UP</button>
                                <a href="#" class="choice2">수정</a>
                            </td>
                        </tr>  
                    </c:forEach>
                </c:if>
                        
            </tbody>
        </table>
    </div>
 
    <%-- <ul class="pagination">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a class="active" href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">&raquo;</a>
    </ul> --%>

    <div class="pagination-area">

        <!-- 페이지네이션 a태그에 사용될 공통 주소를 저장한 변수 선언 -->
        <c:set var="url" value="?cp="/>
                            <%-- /board/list/1?cp=1  --%>


        <ul class="pagination">

            <!-- 이전 목록 마지막 번호로 이동 -->
            <li><a href="${url}${pagination.prevPage}$">&laquo;</a></li>

            <!-- 범위가 정해진 일반 for문 사용 -->
            <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                <c:choose>
                    <c:when test="${i == pagination.currentPage}">
                        <li><a class="current">${i}</a></li>
                    </c:when>

                    <c:otherwise>
                        <li><a href="${url}${i}">${i}</a></li>        
                    </c:otherwise>
                </c:choose>

            </c:forEach>
            
            <!-- 다음 목록 시작 번호로 이동 -->
            <li><a href="${url}${pagination.nextPage}">&raquo;</a></li>

        </ul>
    </div>

    </form>
    </main>

      <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>