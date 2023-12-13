<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<!-- 아이콘 추가 -->
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

<style>

    @font-face {
        font-family: 'TheJamsil5Bold';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
        font-weight: 200;
        font-style: normal;
    }

    .noticeBanner {
        position: relative; /* 부모 요소를 상대 위치로 설정 */
        width: 100%;
        height: 150px;
        overflow: hidden; /* 오버플로우를 숨기기 위해 추가 */
    }

    .noticeBanner h3 {
        position: absolute; /* 절대 위치로 설정 */
        font-size: 30px;
        font-weight: bold;
        top: 50%; /* 부모 요소의 중앙에 배치하기 위해 50%로 설정 */
        left: 50%; /* 부모 요소의 중앙에 배치하기 위해 50%로 설정 */
        transform: translate(-50%, -50%); /* 세로 및 가로 중앙에 정렬 */
        color: white; /* 텍스트 색상을 보이게 하기 위해 추가 */
        z-index: 1; /* 텍스트가 이미지 위에 오도록 설정 */
    }

    .noticeBanner img {
        width: 100%;
        height: 100%; /* 이미지의 높이를 100%로 설정하여 부모 요소에 맞게 조정 */
        object-fit: cover; /* 이미지를 확장하여 부모 요소를 완전히 채우도록 설정 */
    }

    .searchForm {
        margin: 20px 0px;
        margin-top: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .searchBtn {
        background-color: transparent;
        border: 0;
        padding: 0;
        margin-left: -30px; /* 아이콘이 input 안에 들어가도록 위치 조절 */
    }

    .searchInput {
        background-color: rgb(240, 240, 240);
        border-radius: 5px;
        width: 300px;
        border: 0;
        padding: 6px 12px;
    }


    .noticeTable {
        width: 1200px;
        border-top: 2px solid pink; /* 유지 */
        border-bottom: 1px solid lightgray; /* 유지 */
    }

    .noticeTable th, .noticeTable td {
        padding: 15px 20px;
        border-bottom: 1px solid lightgray; /* 가로 선 추가 */
    }

    .noticeTitle {
        width: 700px;
    }

    .noticeTable tbody .noticeTitle {
        transition: color 0.3s ease; /* 텍스트 색상이 0.3초 동안 서서히 변하도록 설정 */
    }

    .noticeTable tbody .noticeTitle:hover {
        color: rgb(253, 179, 191); /* 호버 시 텍스트 색상 변경 */
        cursor: pointer;
    }


    #paging-area {
        display: flex;
        justify-content: center;
        text-align: center;
        margin-top: 20px;
    }

    .pagination {
        display: inline-block;
        padding-left: 0;
        margin: 20px 0;
    }

    .page-item {
        display: inline;
    }

    .page-link {
        display: block;
        border-radius: 5px;
        border: 0;
        color: #cccccc;
        font-size: 14px;
        padding: 7px;
        min-width: 30px;
        text-align: center;
        margin-right: 5px;
        box-sizing: border-box;
        text-decoration: none;
        background-color: #f7adb8;
    }

    .page-item.disabled .page-link,
    .page-item.disabled .page-link:hover {
        color: #cccccc;
        background-color: #f696a4;
        cursor: not-allowed;
    }


</style>



</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="noticeBanner">
        <h3>공지사항</h3>
        <img src="./resources/images/NoticeBanner.jpg" alt="">
    </div>

    <div class="notice-content">
        <div class="search">
            <form id="searchForm" action="searchMember.no" method="get">
                <div class="searchForm">
                    <input class="searchInput" type="text" placeholder="검색어를 입력하세요." id="searchbar" name="keyword">
                    <button type="submit" class="searchBtn"><i class="fas fa-search"></i></button>
                </div>
            </form>
        </div>        
            
        <table id="noticeListMember" class="noticeTable" align="center">
            <thead>
                <tr style="text-align: center;">
                    <th>번호</th>
                    <th class="noticeTitle">제목</th>
                    <th>조회수</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody id="searchResultBody">
                <c:forEach var="n" items="${ requestScope.list }">
                    <tr>
                        <td class="nno" style="text-align: center;">${ n.noticeNo }</td>
                        <td class="noticeTitle">${ n.noticeTitle }</td>
                        <td style="text-align: center;">${ n.views }</td>
                        <td style="text-align: center;">${ n.enrollDate }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    
        
        <script>
            $(document).ready(function() {
                $("#noticeListMember>tbody>tr").click(function() {
                    let nno = $(this).children(".nno").text();
        
                    // AJAX를 이용하여 서버에 조회수 업데이트 요청
                    $.ajax({
                        type: "POST",
                        url: "updateViews.no",
                        data: { "nno": nno },
                        success: function(response) {
                            // 서버에서 성공적으로 응답받으면 상세화면으로 이동
                            location.href = "detailMember.no?nno=" + nno;
                        },
                        error: function(error) {
                            console.error("Error updating views: ", error);
                        }
                    });
                });
            });
        </script>
        
        <div id="paging-area">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${ requestScope.pi.currentPage eq 1 }">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" style="border: 0;"><i class="fas fa-chevron-left"></i></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="listMember.no?cpage=${ requestScope.pi.currentPage - 1 }" style="border: 0;"><i class="fas fa-chevron-left"></i></a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
                    <li class="page-item">
                        <a class="page-link" href="listMember.no?cpage=${ p }">${ p }</a>
                    </li>
                </c:forEach>
                <c:choose>
                    <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" style="border: 0;"><i class="fas fa-chevron-right"></i></a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="listMember.no?cpage=${ requestScope.pi.currentPage + 1 }" style="border: 0;"><i class="fas fa-chevron-right"></i></a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</body>
</html>