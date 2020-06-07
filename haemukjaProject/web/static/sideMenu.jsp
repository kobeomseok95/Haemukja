<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="list-group">
		  <form method="get" action="<%=request.getContextPath()%>/selectRecipe.re">
			   <div class="input-group">
               <select id="searchOption" name="recipeSearchOption">
                  <option id="recipeNickname" value="recipeNickname">닉네임</option>
                  <option id="recipeTitle" value="recipeTitle">제목</option>
               </select>&nbsp;
               <input type="text" name="recipeSearchContent" placeholder="검색어를 입력하세요" style="width: 160px;">
               <span class="input-group-btn" style="margin-top: 5px;">
                  <!-- 검색방지기능을 위해 타입을 버튼으로 수정(범석) 
                     'recipeSearchOption = recipeNickname' & 'recipeSearchContent = 고범석'
                  -->
                  <button id="searchBtn" type="button" style="background-color: orange; width: 160px;">레시피 찾기!</button>
               </span>
               </div>
		         <script>
		            $(function(){
		               $("#searchBtn").click(function(){
		                  var searchOption = $('#searchOption option:selected').val();
		                  var searchContent = $('input[name = recipeSearchContent]').val();
		                  if(searchContent == ""){
		                     alert("검색어를 입력해주세요.");
		                  }else{
		                     <%-- location.href="<%=request.getContextPath()%>/selectRecipe.re?recipeSearchOption="+searchOption+"&recipeSearchContent=+"searchContent"; --%>
		                     location.href="<%=request.getContextPath()%>/selectRecipe.re?recipeSearchOption="+searchOption+"&recipeSearchContent="+searchContent;
		                  }
		               });
		            });
		        </script>
			</form>
			<script>
			   $(function(){
			      $("#searchBtn").click(function(){
			         var searchOption = $('#searchOption option:selected').val();
			         var searchContent = $('input[name = recipeSearchContent]').val();
			         if(searchContent == ""){
			            alert("검색어를 입력해주세요.");
			         }
			      });
			   });
		  </script>
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