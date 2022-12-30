<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file ="../Common/style.jsp" %>
</head>
<body>
   <%@ include file="../Common/Top.jsp"%>
    <!-- 지도를 표시할 div 입니다 -->
   <div id="camp_02" class="clearfix">
      <div class="sec1 sec_dvd">
         <div class="container">
            <div class="stit text-center">
               <h2 class="dft mb-none font-weight-bold">오시는 길</h2>
               <div class="lined"></div>
            </div>
            <div class="tabs tab_box conbox">

               <div class="tab-content">
                  <div id="tab1" class="tab-pane active">
                     <div class="map_box" align="center">
                        <div id="map" style="width: 800px; height: 500px;"></div>
                        <script type="text/javascript"
                           src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a564718858956849162754777f734eb8"></script>
                        <script>
                           var mapContainer = document
                                 .getElementById('map'), // 지도를 표시할 div 
                           mapOption = {
                              center : new kakao.maps.LatLng(
                            		  37.6359060, 126.8699738), // 지도의 중심좌표
                              level : 3
                           // 지도의 확대 레벨
                           };

                           // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                           var map = new kakao.maps.Map(mapContainer,
                                 mapOption);

                           //마커가 표시될 위치입니다 
                           var markerPosition = new kakao.maps.LatLng(
                        		   37.6359060, 126.8699738);

                           // 마커를 생성합니다
                           var marker = new kakao.maps.Marker({
                              position : markerPosition
                           });

                           // 마커가 지도 위에 표시되도록 설정합니다
                           marker.setMap(map);

                           // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
                           // marker.setMap(null);
                        </script>
                     </div>
                  </div>
               </div>
            </div>

            <div class="map_main">
               <ul class="list-unstyled mb-none row text-center">
                  <li class="col-sm-4 col-xs-12">
                     <h5 class="dft mb-none font-weight-light">
                        <span class="font-weight-bold f_pop">ADD.</span> 서울특별시 종로구 번지 3호
                        4 KR 서울특별시 종로구 관철동 180 5 층
                     </h5>
                  </li>
                  <li class="col-sm-4 col-xs-12">
                     <h5 class="dft mb-none font-weight-light">
                        <span class="font-weight-bold f_pop">TEL.</span> 02-123-4567
                     </h5>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="../Common/Bottom.jsp" %>
</body>
</html>