<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0abe8b87a0cfb2b20b1b55e88c710c57&libraries=services"></script>  
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute; top:0;left:0;bottom:0; padding:5px;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;overflow-y: auto; }
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
/* ======================================================================= */
body {
    background-color: #F5F6F7;
    font-size: 14px;
    color: #222;
    line-height: 1.5em;
    margin: 0;
}
.member {
    /* border: 1px solid #000; */
    width: 900px;
    margin: auto;
    padding: 0 20px;
}
.member .logo {
    display: block;
    margin: 50px auto;
}
.member .field.time {
    /* border: 1px solid red; */
    margin-bottom: 5px;
}
.member input:not(input[type="radio"]), .member select {
    padding: 15px;
    width: 100%;
    box-sizing: border-box;
    border: 1px solid #dadada;
    margin-bottom: 5px;
}
.field.choice div {
    border: 1px solid #dadada;
    padding: 15px;
    background-color: #fff;
    margin-bottom: 5px;
}
input[type=radio] {
    accent-color:#318234;
}
.field.date article {
    display: flex;
    gap: 10px;
}
.field.date button {
    flex: 1;
    background-color: #ffffff;
    border: 1px solid #dadada;
    margin-bottom: 5px;
    padding: 15px;
    cursor: pointer;
}
.field.search article {
    display: flex;
    gap: 10px;
}
.field.search button,
.field.search input,
.field.search select {
    flex: 1;
    background-color: #ffffff;
    border: 1px solid #dadada;
    margin-bottom: 5px;
    padding: 15px;
    cursor: pointer;
}
.field.search button:hover,
.field.date button:hover {
    background-color: #318234;
    color: white;
}
.result button {
    flex: 1;
    background-color: #318234;
    border: 1px solid #dadada;
    color: white;
    margin-bottom: 5px;
    padding: 15px;
    cursor: pointer;
}
.result button:hover {
    background-color: rgb(191, 109, 61);
    color: white;
}
.placehold-text {
    /* border: 1px solid #000; */
    position: relative;
    display: block;
}
.datepicker {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    background-color: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    z-index: 9999;
}
    .page-transition {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: white;
        z-index: 9999;
        transition: transform 1s ease-in-out;
    }

    .page-transition.incoming {
        transform: translateY(100%);
    }

    .page-transition.outgoing {
        transform: translateY(-100%);
    }

    #chatbotButton {
position: fixed;
bottom: 12.5vh; /* Adjust this to move up and down */
right: 20px;
z-index: 100;
}
#chatbotModal .modal-dialog {
max-width: 400px;
margin: 30px auto;
}
    </style>
</head>

<body>
    <div class="member">
        <!-- 2. 항목 선택하기 -->
        <div class="field choice">
            <b>선택</b>
            <div>
                <label><input type="radio" name="gender">Beauty</label>
                <label><input type="radio" name="gender">Hotel</label> 
                <label><input type="radio" name="gender">Hospital</label> 
            </div>
        </div>

        <div class="field date">
            <b>이용 기간 / 반려동물 수 및 크기</b>
            <article>
                <button id="dateButton">        <!-- 클릭했을때 새 창이 출력되면서 그 창에달력이 출력 -->
                    <span id="startDate"></span>
                    <span> ~ </span>
                    <span id="endDate"></span>
                    <span>•</span>
                    <span id="nightCount">1박</span>
                </button>
                <button id="countButton">       <!-- 클릭했을때 동물의 수와 크기를 체크 할 수 있는 창이 출력 -->
                    <span>
                        반려동물 수, 반려동물 크기
                    </span>
                </button>
                <button id="typeButton">        <!-- 클릭했을때 동물의 종류를 선택 할 수 있는 창이 출력 -->
                    <span>
                        반려동물 종류
                    </span>
                </button>
            </article>
        </div>

        <!-- 3. 위치 검색 -->
        <div class="field search">
            <b>위치검색</b>
            <article>
                <button>
                    <span>현재 위치</span>
                </button>  
                <input type="text" placeholder="직접 입력">           
                <select>
                    <option value="">서울</option>
                    <option value="">경기도</option>
                    <option value="">경상도</option>
                    <option value="">강원도</option>
                    <option value="">충청도</option>
                    <option value="">전라도</option>
                    <option value="">제주도</option>
                </select>
                <button id="resultButton">
                    <span>
                        결과 확인하기
                    </span>
                </button>
            </article>
        </div>
    </div>
    <script>
        // 날짜 포맷팅 함수
        function formatDate(date) {
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();
            var weekDay = ["일", "월", "화", "수", "목", "금", "토"][date.getDay()];
    
            return `${month < 10 ? '0' + month : month}.${day < 10 ? '0' + day : day} (${weekDay})`;
        }

        // 오늘 날짜 설정
        var today = new Date();
        var tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000); // 내일 날짜 계산
        var todayFormatted = formatDate(today);
        var tomorrowFormatted = formatDate(tomorrow);

        // 선택한 날짜 초기화
        var startDateSpan = document.getElementById("startDate");
        var endDateSpan = document.getElementById("endDate");
        startDateSpan.textContent = todayFormatted;
        endDateSpan.textContent = tomorrowFormatted;

        // 날짜 선택 버튼 클릭 시 달력 표시/숨김 처리
        var dateButton = document.getElementById("dateButton");
        var datepicker = document.querySelector(".datepicker");
        // dateButton 클릭 이벤트 처리
        document.getElementById("dateButton").addEventListener("click", function() {
        // 페이지 전환 효과 클래스 추가
        document.body.classList.add("page-transition", "outgoing");

        // 새로운 페이지로 이동
        window.location.href ="${pageContext.request.contextPath}/api/calendar";
    });

        // countButton 클릭 이벤트 처리
        document.getElementById("countButton").addEventListener("click", function() {
        // 페이지 전환 효과 클래스 추가
        document.body.classList.add("page-transition", "outgoing");

        // 새로운 페이지로 이동
        window.location.href = "${pageContext.request.contextPath}/api/countsize";
    });

        // typeButton 클릭 이벤트 처리
        document.getElementById("typeButton").addEventListener("click", function() {
        // 페이지 전환 효과 클래스 추가
        document.body.classList.add("page-transition", "outgoing");

        // 새로운 페이지로 이동
        window.location.href = "${pageContext.request.contextPath}/api/kind";
    }); 
        // 페이지 로드 시 초기화
        window.addEventListener("load", function() {
        // 페이지 전환 효과 클래스 제거
        document.body.classList.remove("page-transition");
    });
    </script>


    <div class="map_wrap" style="display: flex; justify-content: center;">
        <div id="map" style="width: 640px; height: 450px; position: relative; overflow: hidden;"></div>
        <div id="menu_wrap" class="bg_white" style="height: 440px; position:relative; width: 250px;">
            <div class="option">
                <div>
                    <form onsubmit="searchPlaces();return false;">
                       
                        <input type="text" value="" id="keyword" size="15"> 
                        <button type="submit">검색하기</button>
                    </form>
                </div>
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>
    </div>



<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
       
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

</script></body>