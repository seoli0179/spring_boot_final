
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리스트 페이지</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/courseBoard.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/course/course.css'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/detailSearch.css'/>"/>
	
	<!-- icon kit -->
	<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/list.css'/>">

	<script src="<c:url value='/tools/jquery-3.6.0.min.js' /> "></script>
	<%-- <script src="<c:url value='/js/list.js' />"></script>
     --%></head>

  <link rel="stylesheet" href="/resources/demos/style.css">


<!-- //제이쿼리 ui css
 --> <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 
<!--  //제이쿼리 style css
 --> <link rel="stylesheet" href="/resources/demos/style.css">
 
<!--  //제이쿼리 js
 --> <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
<!--  //제이쿼리 ui js
 --> <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<body>
<!-- top -->
<c:import url="/WEB-INF/views/layout/top.jsp" />

<!-- 검색창 -->
	<div id="course-box" class="course-box main-title-box">
                    <h1 class="h1">Search</h1>
                    <span>관심있는 전시를 검색해보세요.</span>
	                    <div class="courseboard-search-box">
	                        <div class="searchbar-box">
	                            <div class="searchbar-border tag-box" type="text">
	                                <ul id="tagList">
	                                    <input class="inner-searchbar" id="inner-searchbar" type="text" placeholder="검색어를 입력하세요.">
	                                </ul>
	                                <div id="filterList" style="position: relative;">
	
	                                </div>
	                            </div>
	                            <input class="black-btn courseBoard-searchBtn" type="button" value="검색">
	                            <input id="show" class="white-btn detailSearch courseBoard-searchBtn" type="button" value="상세검색">
	                        </div>
	                        <div id="tag-caution" class="vibration">태그는 3개까지만 선택할 수 있습니다.</div>
	                    </div>
                </div>
			<!-- 팝업 시작 -->
	<div class="background">
		<div class="window">
			<div class="popup">
				<button id="close" class="close-btn">
 				<img src="../image/close.png" alt="" class="close-btnimg">
 				<!-- Close icons created by ariefstudio - Flaticon -->
				
				</button>
				<div id="container-deatil-search">
					<!-- 상세 검색 라디오 버튼 -->
					<p class="subttitle-1">Artchive 전시 상세 검색</p>
					<hr>
				<div class="container-list">
					<div class="exsearchcontainer1">
						<div class="exsearch item1">
						
							<form id="detail-search" class="">

								<fieldset id="extrip-day">
									<p class="subttitle">언제 가실건가요?</p>
									<br>
									<div class="exsearch item1">
										<input type="radio" id="today" onclick='getRadioText(event)'
										name="search-when"value="today"> 
										<label for="today">오늘</label> 
										<input 	type="radio" id="this-week" onclick='getRadioText(event)' 
										name="search-when" value="this-week"> 
											<label for="this-week">이번주</label>
										<input type="radio" id="next-week" onclick='getRadioText(event)'
										name="search-when" value="next-week"> <label for="next-week">다음주</label>
										<input type="radio" id="this-month" onclick='getRadioText(event)' 
										name="search-when" value="this-month"> <label for="this-month">이번달</label>
										<input type="radio" id="self-select" onclick='getRadioText(event)' 
										name="search-when" value="self-select"> <label for="self-select">직접선택</label>
									</div>
								</fieldset>
							<!-- 기간 설정 -->
							<br>
							
						</div>
						<div class="exsearch item2">
<!-- 							<form method="get" action="form-action.html">
 -->								<fieldset>
									<p class="subttitle">어떤 지역으로 가시나요?</p>
									<br>
									<ul>
										<li><label><input type="checkbox" name="ex-place"  onclick='getCheckboxValue4()' 
												value="전체" checked> 서울</label></li>
										<li><label><input type="checkbox" name="ex-place"  onclick='getCheckboxValue4()' 
												value="경인"> 경인</label></li>
										<li><label><input type="checkbox" name="ex-place" onclick='getCheckboxValue4()' 
												value="부산"> 부산</label></li>
										<li><label><input type="checkbox" name="ex-place" onclick='getCheckboxValue4()' 
												value="제주"> 제주</label></li>
										<li><label><input type="checkbox" name="ex-place" onclick='getCheckboxValue4()' 
												value="강원"> 강원</label></li>
										<li><label><input type="checkbox" name="ex-place" onclick='getCheckboxValue4()' 
												value="전라"> 전라</label></li>
										<li><label><input type="checkbox" name="ex-place" onclick='getCheckboxValue4()'
												value="경상"> 경상</label></li>
										<li><label><input type="checkbox" name="ex-place" onclick='getCheckboxValue4()'
												value="기타지역"> 기타지역</label></li>
									</ul>
								</fieldset>

						</div>
						<div class="exsearch item3">
							<fieldset>
								<p class="subttitle">가격은 ?</p>
																	<br>
								
								<div class = "exprice">
									<input type="radio" id="price-free" onclick='getRadioText2(event)' name="ex-price"	value="price-free"> 
									<label for="price-free">무료</label> 
									<input type="radio" id="price" onclick='getRadioText2(event)' name="ex-price" value="price"> 
									<label for="price">유료</label>
									<input type="radio" id="idc" onclick='getRadioText2(event)' name="ex-price" value="idc">
									<label for="idc">전체</label>
								</div>
							</fieldset>
						</div>

						
						<div class="exsearch item4">
							<fieldset>
								<p class="subttitle">전시 범위</p>
																	<br>
								
								<div class = "exprice">
									<input type="radio" id="upcoming-ex" onclick='getRadioText3(event)' name="abcd1"	value="price-free" "> 
									<label for="upcoming-ex">예전 전시</label> 
									<input type="radio" id="pre-ex" onclick='getRadioText3(event)' name="abcd1" value="price"> 
									<label for="pre-ex">예정된 전시</label>
								
								</div>
							</fieldset>
						</div>		
						</div>
										
					<div class =" exsearchcontainer2 ">
							<fieldset id="exdate">
								
									<p class="subttitle">직접 선택 하시겠어요?</p>
									<br>
										<label for="from"></label>
										<input type="text" id="fromex" name="from">
										<label for="list-to"> - </label>
										<input type="text" id="toex" name="to">
										
							</fieldset>


					<!-- 기간 설정 끝-->

					<!-- 어떤 전시 가고 싶은지 확인하는 -->
							<div class="exsearch-item5">
						<!-- 		<fieldset id=" exfarite">
									<p class="subttitle">어떤 전시에 가고 싶은가요?</p>
										<div class="favorite-type">
											<button class="btn-exfavorite">전시분야</button>
											<button class="btn-exfavorite">전시분야</button>
											<button class="btn-exfavorite">전시분야</button>
											<button class="btn-exfavorite">전시분야</button>
											<button class="btn-exfavorite">전시분야</button>
											<button class="btn-exfavorite">전시분야</button>
											<button class="btn-exfavorite">전시분야</button>
											<button class="btn-exfavorite">전시분야</button>
										</div>
								</fieldset> -->
							</div>
						
					</div>

					<!-- 토글 조건 -->
					<div class=exsearchcontainer3>
						<!-- <div class="extoggle">
							<input type="checkbox" id="toggle" hidden>
							<p class="subttitle2">이전 전시도 보여 드릴까요?</p>
														<br>
							
							<label for="toggle" class="toggleSwitch"> <span
								class="toggleButton"></span>
							</label>
						</div>
							
							<div>
							<p class="subttitle2">예정 된 전시도 보여 드릴까요?</p>
							<br>
							
							<label for="toggle" class="toggleSwitch"> <span
								class="toggleButton"></span>
							</label> -->
							</div>
							</div>
							
					<div class="exsearchcontainer5">
						<div class="exsearch item5">
						<!-- <p> -->
							<p id="firstTxt">어떤 전시 관람이 궁금하신가요?</p>
								<!-- </p> -->
																<br>
								
								<ul class="barList" id="search-view">
								<li>
								<div id='result'></div>
								</li>
								<li>
								<div id='result2'></div>
								</li>
								<li>
								<div id='result3'></div>
								</li>
								<li>
								<div id='result4'></div>
								</li>
														
								</ul>
								<br>
								<em>이런 조건을 찾으셨군요? 검색해 드릴게요!</em>
								
						</div>
								
						
						<div class="exsearch item6">
						<!-- <p> -->
							<button type="button" id="SearchBtn" value="검색" onclick="location.href='searchResult'">검색</button>
						
<!-- 							<input type="submit" id="SearchBtn" value="검색"> 
 -->							<input type="reset" class="white-btn" value="초기화">
								<!-- </p> -->
						</div>							
						
					</div>
					</div>
					<!-- 제출 리셋 -->


				</div>
								</form>
				
				<div>
					<div></div>
				</div>
			</div>
		</div>
		</div>
		</div>
<!-- 팝업 끝 -->
	</div>
</div>

<!-- area -->
<div id="searchAreaBox">
	<div id="searchArea">
		<div id="allArea" class="AREA tabTag selected">
			<ul>
				<li><a href="#"><i class="fa-solid fa-border-all"></i>전체</a></li>
			</ul>
		</div>
		<div id="capitalArea" class="AREA tabTag">
			<ul>
				<li><a href="#"><i class="fa-solid fa-landmark"></i>박물관</a></li>
			</ul>
		</div>
		<div id="busanArea" class="AREA tabTag">
			<ul>
				<li><a href="#"><i class="fa-solid fa-panorama"></i>미술전시</a></li>
			</ul>
		</div>
		<div id="jejuArea" class="AREA tabTag">
			<ul>
				<li><a href="#"><i class="fa-solid fa-bullhorn"></i>축제</a></li>
			</ul>
		</div>
		<div id="kangwonArea" class="AREA tabTag">
			<ul>
				<li><a href="#"><i class="fa-solid fa-apple-whole"></i>교육·체험</a></li>
			</ul>
		</div>
		<div id="jeonArea" class="AREA tabTag">
			<ul>
				<li><a href="#"><i class="fa-solid fa-list-ul"></i>기타</a></li>
			</ul>
		</div>
	</div><!-- searchArea -->

	<%--	<div id="ExhibitionBOX">--%>
	<%--		<input type="button" class="exhibitionABC" id="exhibitionA" value="현재전시"/>--%>
	<%--		<input type="button" class="exhibitionABC" id="exhibitionB" value="예정전시"/>--%>
	<%--		<input type="button" class="exhibitionABC" id="exhibitionC" value="지난전시"/>--%>
	<%--	</div>--%>
	
</div>

<!-- 전시 리스트 -->
<p class="subttitle">검색결과</p>
<div class="list-con">
	<ul class="row">
		<c:forEach var="exhbn" items="${exhbnList}" varStatus="status">
			<li class="cell">
				<div class="img-box">
					<a href="/exhbn/detail/${exhbn.exhbnId}"><img src="${exhbn.exhbnImgUrl}" alt=""></a>
				</div>
				<section id="ex-all">
					<div class="ex-place">${exhbn.exhbnPlace}</div>
					<div class="ex-title">${exhbn.exhbnTitle}</div>
					<div class="ex-period"><fmt:formatDate value = "${exhbn.exhbnStartDate}" type ="date" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value = "${exhbn.exhbnEndDate}" type ="date" pattern="yyyy.MM.dd"/></div>
				</section>
			</li>
		</c:forEach>
	</ul>
</div>
<!-- .list-wrap -->

<!-- footer -->
<c:import url="/WEB-INF/views/layout/bottom.jsp" />
<!-- footer -->
<script>


	function show() {
		document.querySelector(".background").className = "background show";
	}

	function close() {
		document.querySelector(".background").className = "background";
	}

	document.querySelector("#show").addEventListener("click", show);
	document.querySelector("#close").addEventListener("click", close);


</script>
  <script>
   //datepicker//
  $( function() {
    var dateFormat = "yy/mm/dd",
      fromex = $( "#fromex" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#toex" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
  <script type="text/javascript">
  function getRadioText(event)  {
	  const radioId = event.target.id;
	  const query = 'label[for="'+ radioId + '"]'
	  const text = 
	        document.querySelector(query).innerText;
	  
	  document.getElementById('result').innerText = text;
	}
  </script>
  <script type="text/javascript">
  function getRadioText2(event)  {
	  const radioId = event.target.id;
	  const query = 'label[for="'+ radioId + '"]'
	  const text = 
	        document.querySelector(query).innerText;
	  
	  document.getElementById('result2').innerText = text;
	}
  </script>
    <script type="text/javascript">
  function getRadioText3(event)  {
	  const radioId = event.target.id;
	  const query = 'label[for="'+ radioId + '"]'
	  const text = 
	        document.querySelector(query).innerText;
	  
	  document.getElementById('result3').innerText = text;
	}
  
  <script type="text/javascript">
  function getCheckboxText4(event)  {
	  const CheckboxId = event.target.id;
	  const query = 'label[for="'+ CheckboxId + '"]'
	  const text = 
	        document.querySelector(query).innerText;
	  
	  document.getElementById('result4').innerText = text;
	}
  </script>
  
  <script type="text/javascript">
  function getCheckboxValue4()  {
	  // 선택된 목록 가져오기
	  const query = 'input[name="ex-place"]:checked';
	  const selectedEls = 
	      document.querySelectorAll(query);
	  
	  // 선택된 목록에서 value 찾기
	  let result = '';
	  selectedEls.forEach((el) => {
	    result += el.value + ' ';
	  });
	  
	  // 출력
	  document.getElementById('result4').innerText
	    = result;
	}
  </script>
</body>
</html>
</body>
</html>