<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blinkist: Big ideas in small packages</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>


<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />

<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath }/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/blog-home.css"
	rel="stylesheet">

<!-- 검색어 자동완성 에 필요한 jquery ,css -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 아이콘  -->
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>


<!-- bootstrap -->

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/update.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/jsp/include/navigation.jsp" />
	<s:authentication property="principal" var="authUser"/> 
	<div class="container">
		<h1 id="category">${category}</h1>
		<br />
		<!-- body 부분 -->

		<input class="form-control" id="searchInput" type="search"
			name="${category }" placeholder="Search.."> <br /> <br />

		<h3>트렌드</h3>
		<br />
		<div class="row" id="demo">
			<c:forEach items="${trendList }" var="list" varStatus="status">
				<!-- 처음 여섯개는 보이게 하기 -->
				<c:if test="${list.libCheck }">

					<div class="col-lg-4 col-md-6 mb-4" id="test">
						<div class="card h-100">
							<!-- img size 470x470 으로 고정 -->
							<a href="#!" style="background-color: #e2ae5f7a;"><br /> <img
								class="card-img-top" src="${list.img_path }" width="122"
								height="180" alt="..." /> <br /> </a>
							<div class="card-body">
								<h6 class="card-title">
									<a
										href="${pageContext.request.contextPath }/content/readbook?book_no=${list.book_no}">${list.title }</a>
								</h6>
								<h5>${list.name }</h5>
								<p class="card-text">
									<i style='font-size: 20px' class='far'>&#xf017;</i>
									${list.running_time}분
								</p>
								<div class="dropdown float-right">
									<button type="button" class="btn btn-sm  "
										data-toggle="dropdown">. . .</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">Remove from library</a> <a
											class="dropdown-item" href="#">Buy book</a> <a
											class="dropdown-item" href="#">Send to Kindle</a>
									</div>
								</div>
							</div>
							<!-- Blue -->
							<div class="progress" style="height: 50px;">
								<div class="progress-bar" role="progressbar" aria-valuenow="25"
									aria-valuemin="0" aria-valuemax="100"
									style="width:${list.progress}%; height:50px">${list.progress}%</div>
							</div>
						</div>
					</div>

				</c:if>
				<c:if test="${not list.libCheck }">
					<div class="col-lg-4 col-md-6 mb-4" id="test">
						<div class="card h-100">
							<a href="#!" style="background-color: #e2ae5f7a;"><br /> <img
								class="card-img-top" src="${list.img_path }" width="122"
								height="180" alt="..." /> <br /> </a>
							<div class="card-body">
								<h6 class="card-title">
									<a
										href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}">${list.title }</a>
								</h6>
								<h5>${list.name }</h5>
								<p class="card-text">
									<i style='font-size: 20px' class='far'>&#xf017;</i>
									${list.running_time}분
								</p>
							</div>
							<div class="card-footer text-center">
								<a name="cardfooter"
									href="${pageContext.request.contextPath }/library/addlibrary?book_no=${list.book_no}&authUser=${authUser.username}">+
									Add Library</a>
							</div>
						</div>
					</div>

				</c:if>
			</c:forEach>
		</div>
		<br />
		<h3>최근 추가순</h3>
		<br />
		<div class="row" id="demo">
			<c:forEach items="${recentList }" var="list" varStatus="status">
				<!-- 처음 여섯개는 보이게 하기 -->
				<c:if test="${list.libCheck }">

					<div class="col-lg-4 col-md-6 mb-4" id="test">
						<div class="card h-100">
							<!-- img size 470x470 으로 고정 -->
							<a href="#!" style="background-color: #e2ae5f7a;"><br /> <img
								class="card-img-top" src="${list.img_path }" width="122"
								height="180" alt="..." /> <br /> </a>
							<div class="card-body">
								<h6 class="card-title">
									<a
										href="${pageContext.request.contextPath }/content/readbook?book_no=${list.book_no}">${list.title }</a>
								</h6>
								<h5>${list.name }</h5>
								<p class="card-text">
									<i style='font-size: 20px' class='far'>&#xf017;</i>
									${list.running_time}분
								</p>
								<div class="dropdown float-right">
									<button type="button" class="btn btn-sm  "
										data-toggle="dropdown">. . .</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">Remove from library</a> <a
											class="dropdown-item" href="#">Buy book</a> <a
											class="dropdown-item" href="#">Send to Kindle</a>
									</div>
								</div>
							</div>
							<!-- Blue -->
							<div class="progress" style="height: 50px;">
								<div class="progress-bar" role="progressbar" aria-valuenow="25"
									aria-valuemin="0" aria-valuemax="100"
									style="width:${list.progress}%; height:50px">${list.progress}%</div>
							</div>
						</div>
					</div>

				</c:if>
				<c:if test="${not list.libCheck }">
					<div class="col-lg-4 col-md-6 mb-4" id="test">
						<div class="card h-100">
							<a href="#!" style="background-color: #e2ae5f7a;"><br /> <img
								class="card-img-top" src="${list.img_path }" width="122"
								height="180" alt="..." /> <br /> </a>
							<div class="card-body">
								<h6 class="card-title">
									<a
										href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}">${list.title }</a>
								</h6>
								<h5>${list.name }</h5>
								<p class="card-text">
									<i style='font-size: 20px' class='far'>&#xf017;</i>
									${list.running_time}분
								</p>
							</div>
							<div class="card-footer text-center">
								<a name="cardfooter"
									href="${pageContext.request.contextPath }/library/addlibrary?book_no=${list.book_no}&authUser=${authUser.username}">+
									Add Library</a>
							</div>
						</div>
					</div>

				</c:if>
			</c:forEach>
		</div>
		<br />
		<h3>오디오 포함</h3>
		<br />
		<div class="row" id="demo">
			<c:forEach items="${audioList }" var="list" varStatus="status">
				<!-- 처음 여섯개는 보이게 하기 -->
				<c:if test="${list.libCheck }">

					<div class="col-lg-4 col-md-6 mb-4" id="test">
						<div class="card h-100">
							<!-- img size 470x470 으로 고정 -->
							<a href="#!" style="background-color: #e2ae5f7a;"><br /> <img
								class="card-img-top" src="${list.img_path }" width="122"
								height="180" alt="..." /> <br /> </a>
							<div class="card-body">
								<h6 class="card-title">
									<a
										href="${pageContext.request.contextPath }/content/readbook?book_no=${list.book_no}">${list.title }</a>
								</h6>
								<h5>${list.name }</h5>
								<p class="card-text">
									<i style='font-size: 20px' class='far'>&#xf017;</i>
									${list.running_time}분
								</p>
								<div class="dropdown float-right">
									<button type="button" class="btn btn-sm  "
										data-toggle="dropdown">. . .</button>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">Remove from library</a> <a
											class="dropdown-item" href="#">Buy book</a> <a
											class="dropdown-item" href="#">Send to Kindle</a>
									</div>
								</div>
							</div>
							<!-- Blue -->
							<div class="progress" style="height: 50px;">
								<div class="progress-bar" role="progressbar" aria-valuenow="25"
									aria-valuemin="0" aria-valuemax="100"
									style="width:${list.progress}%; height:50px">${list.progress}%</div>
							</div>
						</div>
					</div>

				</c:if>
				<c:if test="${not list.libCheck }">
					<div class="col-lg-4 col-md-6 mb-4" id="test">
						<div class="card h-100">
							<a href="#!" style="background-color: #e2ae5f7a;"><br /> <img
								class="card-img-top" src="${list.img_path }" width="122"
								height="180" alt="..." /> <br /> </a>
							<div class="card-body">
								<h6 class="card-title">
									<a
										href="${pageContext.request.contextPath }/book/viewbook?no=${list.book_no}">${list.title }</a>
								</h6>
								<h5>${list.name }</h5>
								<p class="card-text">
									<i style='font-size: 20px' class='far'>&#xf017;</i>
									${list.running_time}분
								</p>
							</div>
							<div class="card-footer text-center">
								<a name="cardfooter"
									href="${pageContext.request.contextPath }/library/addlibrary?book_no=${list.book_no}&authUser=${authUser.username}">+
									Add Library</a>
							</div>
						</div>
					</div>

				</c:if>
			</c:forEach>
		</div>


		<div class="row" id="do"></div>
		<div class="row">
			<div class="col-md-4 mb-5"></div>
			<div class="col-md-4 mb-5">
				<form
					action="${pageContext.request.contextPath }/book/allcategorybook">
					<input type="hidden" value="${category}" name="category" />
					<button id="loadMore" type="submit"
						class="btn btn-outline-success btn-block">카테고리에 포함된 모든 책
						보기</button>
				</form>
			</div>
			<div class="col-md-4 mb-5"></div>
		</div>





	</div>

	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	<script>
		var divs = document.getElementsByName('cardfooter')
		for (var i = 0; i < divs.length; i++) {
			divs.item(i).addEventListener("mouseover", changeGreen, false);
			divs.item(i).addEventListener("mouseout", changeWite, false);
		}
		function changeGreen(e) {
			e.target.parentNode.style.backgroundColor = "#0365F2";
		}
		function changeWite(e) {
			e.target.parentNode.style.backgroundColor = "white";
		}
	</script>
</body>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	var path = "${pageContext.request.contextPath }/book/viewbook?no=";

	$(function() { //화면 다 뜨면 시작
		var category = document.getElementById("category");
		//console.log(document.getElementById("hello").value);
		$("#searchInput")
				.autocomplete(
						{
							source : function(request, response) {
								//console.log(category.value);
								//console.log(document.getElementById("searchInput").name);
								$
										.ajax({
											type : 'get',
											url : "json",
											data : {
												"category" : document
														.getElementById("searchInput").name
											},
											dataType : "json",
											//request.term = $("#autocomplete").val()
											//data: {"param":"param"},
											success : function(data) {

												//서버에서 json 데이터 response 후 목록에 추가
												response($
														.map(
																data,
																function(item) { //json[i] 번째 에 있는게 item 임.
																	//console.log(item.indexof($('#searchInput').val()));
																	//console.log(item.toLowerCase());
																	//console.log(typeof(item));
																	//console.log(typeof($('#searchInput').val()));
																	//console.log($("#category").val());
																	console
																			.log(item["name"]);
																	console
																			.log(item["title"]);
																	console
																			.log(item["book_no"]);
																	if (item["name"]
																			.toLowerCase()
																			.indexOf(
																					$(
																							'#searchInput')
																							.val()) > -1
																			|| item["title"]
																					.toLowerCase()
																					.indexOf(
																							$(
																									'#searchInput')
																									.val()) > -1) {
																		return {
																			label : item
																					+ "label", //UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
																			value : item["title"]
																					+ "  by "
																					+ item["name"], //그냥 사용자 설정값?
																			no : item["book_no"]
																		//이런식으로 사용
																		}
																	}
																}));
											}
										});
							}, // source 는 자동 완성 대상
							select : function(event, ui) { //아이템 선택시
								console.log(ui);//사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
								console.log(ui.item.label); //김치 볶음밥label
								console.log(ui.item.value); //김치 볶음밥
								console.log(ui.item.test); //김치 볶음밥test

							},
							focus : function(event, ui) { //포커스 가면
								return false;//한글 에러 잡기용도로 사용됨
							},
							minLength : 2,// 최소 글자수
							autoFocus : true, //첫번째 항목 자동 포커스 기본값 false
							classes : { //잘 모르겠음
								"ui-autocomplete" : "highlight"
							},
							delay : 250, //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
							//	disabled: true, //자동완성 기능 끄기
							position : {
								my : "right top",
								at : "right bottom"
							}, //잘 모르겠음
							close : function(event) { //자동완성창 닫아질때 호출
								console.log(event);
							}
						}).autocomplete("instance")._renderItem = function(ul,
				item) { //요 부분이 UI를 마음대로 변경하는 부분
			return $("<li>") //기본 tag가 li로 되어 있음 
			.append(
					"<div>" + "<a href="+path +item.no+">" + item.value
							+ "</a>" + "</div>") //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
			.appendTo(ul);
		};
	});
	//var category=document.getElementById("category");
	//console.log(category.value);
</script>
</html>