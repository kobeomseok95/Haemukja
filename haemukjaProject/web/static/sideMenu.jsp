<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="list-group">
		  <form method="get" action="<%=request.getContextPath()%>/search.re">
			   <div class="input-group">
               <select id="searchOption" name="searchOption">
                  <option id="title" value="title">제목</option>
                  <option id="nickname" value="nickname">닉네임</option>
               </select>&nbsp;
               <input type="text" name="searchContent" placeholder="검색어를 입력하세요" style="width: 160px;">
               <span class="input-group-btn" style="margin-top: 5px;">
                  <button id="searchBtn" type="submit" style="background-color: orange; width: 160px;">레시피 찾기!</button>
               </span>
               </div>
			</form>
          <h4><a href="#" onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'AS'">Asia</a></h4>
          <a href="#" class="list-group-item list-group-item-light" 
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'ASK'">한국</a>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'ASC'">중국</a>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'ASJ'">일본</a>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'ASE'">기타</a>
          <h4><a href="#" onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'EU'">Europe</a></h4>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'EUI'">이탈리아</a>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'EUS'">스페인</a>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'EUF'">프랑스</a>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'EUE'">기타</a>
          <h4><a href="#" onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'AM'">America</a></h4>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'AMU'">미국</a>
          <a href="#" class="list-group-item list-group-item-light"
          	onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'AME'">기타</a>
          <h4><a href="#" onclick="location.href='<%=request.getContextPath()%>/list.re?nCode=' + 'OC'">Other Countries</a></h4>
          <h4><a href="<%=request.getContextPath()%>/qna.qn">문의게시판</a></h4>
 </div>