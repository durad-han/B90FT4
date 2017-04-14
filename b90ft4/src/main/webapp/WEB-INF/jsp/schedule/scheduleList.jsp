<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>B90FT4 | Schedule</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div>
<!-- 위로가기 ==================================================================================================== -->
	<a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        
<!-- 상단 메뉴 시작 ==================================================================================================== -->
<div id="header-topbar-option-demo" class="page-header-topbar">
    <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
	<div class="navbar-header">
	    <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only"> toggle </span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
	    <a id="logo" href="http://14.32.66.123:9092/b90ft4/main/main.do" class="navbar-brand"><span class="fa fa-rocket"></span><span class="logo-text">B90FT4</span><span style="display: none" class="logo-text-icon">µ</span></a>
	        </div>
	        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">
              <ul class="nav navbar-nav">
              <li><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a></li>
<!-- 메뉴 옵션들 ==================================================================================================== -->
                  <li class="active"><a href="http://14.32.66.123:9092/b90ft4/main/main.do">메인</a></li>
                  <li class="dropdown"><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleList.do" data-toggle="dropdown" class="dropdown-toggle">스케줄<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                      	  <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleList.do">스케줄 리스트</a></li>
                          <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleCalendar.do">스케줄 캘린더</a></li>
                          <li><a href="http://14.32.66.123:9092/b90ft4/schedule/scheduleGraph.do">스케줄 그래프</a></li>
                          <li class="divider"></li>
                          <li><a href="#">임시메뉴</a></li>
                      </ul>
                  </li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/diary/list.do">다이어리</a></li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/accountBook/main.do">가계부</a></li>
                  <li><a href="http://14.32.66.123:9092/b90ft4/workout/workout.do">운동</a></li>
<!-- 미사용 드롭다운 샘플 ==================================================================================================== -->
                  <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">드롭다운 샘플<b class="caret"></b></a>
                      <ul class="dropdown-menu">
                          <li><a href="#">Action</a></li>
                          <li><a href="#">Another action</a></li>
                          <li><a href="#">Something else here</a></li>
                          <li class="divider"></li>
                          <li><a href="#">Separated link</a></li>
                          <li class="divider"></li>
                          <li><a href="#">One more separated link</a></li>
                      </ul>
                  </li>
              </ul>
<!-- 로그인 & 메모 ==================================================================================================== -->
              <ul class="nav navbar-nav navbar-right">
              	<li><a href="#callModal">Login</a></li>
				<li style='margin-right: 20px;'>
                <input type="checkbox" id="showAndHideMemo" name='memoOpt' value='1' checked/>
					<label for='showAndHideMemo'>메모 보기</label>
                </li>
                <li>
	                <div id="addMemo">
						<button><img src="icon_add_stickynote.gif" />메모 추가</button>
					</div>
                </li>
              </ul>
    </div>     
	</nav>
</div>
<!-- 상단메뉴 종료 ==================================================================================================== -->

<!-- 전체 래퍼 시작 ==================================================================================================== -->
<div id="wrapper">

<!-- 서브메뉴 시작 ==================================================================================================== -->
    <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
        data-position="right" class="navbar-default navbar-static-side">
    <div class="sidebar-collapse menu-scroll">
        <ul id="side-menu" class="nav">
            <div class="clearfix"></div>
<!-- 사이드바 메뉴들 ==================================================================================================== -->
            <li><a href="#"><i class="fa fa-tachometer fa-fw">
                <div class="icon-bg bg-orange"></div>
            </i><span class="menu-title">기능</span></a></li>
            <li><a href="#"><i class="fa fa-desktop fa-fw">
                <div class="icon-bg bg-pink"></div>
            </i><span class="menu-title">Schedule : </span></a>
            </li>
            <li><a href="scheduleList.do"><i class="fa fa-send-o fa-fw">
                <div class="icon-bg bg-green"></div>
            </i><span class="menu-title">Schedule List</span></a>
            </li>
            <li><a href="scheduleCalendar.do"><i class="fa fa-edit fa-fw">
                <div class="icon-bg bg-violet"></div>
            </i><span class="menu-title">Schedule Calendar</span></a>
            </li>
            <li><a href="scheduleGraph.do"><i class="fa fa-th-list fa-fw">
                <div class="icon-bg bg-blue"></div>
            </i><span class="menu-title">Schedule Graph</span></a>
            </li>
<!-- 미사용 사이드바 메뉴들 ==================================================================================================== -->
            <li><a href="#"><i class="fa fa-file-o fa-fw">
                <div class="icon-bg bg-yellow"></div>
            </i><span class="menu-title">Grids</span></a>
            </li>
            <li><a href="#"><i class="fa fa-gift fa-fw">
                <div class="icon-bg bg-grey"></div>
            </i><span class="menu-title">Grids</span></a>
            </li>
            <li><a href="#"><i class="fa fa-envelope-o">
                <div class="icon-bg bg-primary"></div>
            </i><span class="menu-title">Grids</span></a>
            </li>
            <li><a href="#"><i class="fa fa-bar-chart-o fa-fw">
                <div class="icon-bg bg-orange"></div>
            </i><span class="menu-title">Grids</span></a>
            </li>
        </ul>
    </div>
</nav>
<!-- 서브메뉴 종료 ==================================================================================================== -->
          
<!-- 주 화면 래퍼 ==================================================================================================== -->
<div id="page-wrapper">

<!-- 타이틀 영역 시작 ==================================================================================================== -->
 <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
     <div class="page-header pull-left">
         <div class="page-title">
             Schedule List</div>
     </div>
     <ol class="breadcrumb page-breadcrumb pull-right">
         <li><i class="fa fa-home"></i>&nbsp;<a href="../main/main.do">Home</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="hidden"><a href="#">Schedule List</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
         <li class="active">Schedule List</li>
     </ol>
     <div class="clearfix">
     </div>
</div>
<!-- 타이틀 영역 종료 ==================================================================================================== -->

<!-- 메인 컨텐츠 시작 ==================================================================================================== -->
<div class="page-content">
	<div id="tab-general">
	<div class="row mbl">
	
	<div class="col-lg-12">
		<div class="col-md-12">
			<div id="area-chart-spline" style="width: 50%; height: 300px; display: none;">
			</div>
		</div>
	</div>

	<div class="col-lg-12">
<!-- 페이지 컨텐츠 시작 ==================================================================================================== -->
<div class="page-content">
	<div class="row">
	
<!-- 바디 판넬 시작 ==================================================================================================== -->
	<div class="col-lg-3">
		<div class="panel">
		<div class="panel-body">
			<div id="grid-layout-table-1" class="box jplist">
				<div class="jplist-ios-button"><i class="fa fa-sort"></i>스케줄 조회 옵션</div>
				
<!-- 컨트롤 판넬 시작 ==================================================================================================== -->
				<div class="jplist-panel box panel-top">
					<div data-control-type="drop-down" data-control-name="paging" data-control-action="paging" class="jplist-drop-down form-control">
						<ul class="dropdown-menu">
					        <li><span data-number="3"> 3개씩 보이기 </span></li>
					        <li><span data-number="5"> 5개씩 보이기 </span></li>
					        <li><span data-number="10" data-default="true"> 10개씩 보이기 </span></li>
					        <li><span data-number="all"> 전부 다 보이기 </span></li>
						</ul>
					</div>
					<div data-control-type="drop-down" data-control-name="sort" data-control-action="sort" data-datetime-format="{month}/{day}/{hour}:{minutes}" class="jplist-drop-down form-control">
						<ul class="dropdown-menu">
							<li><span data-path="default">정렬하기</span></li>
							<li><span data-path=".title" data-order="asc" data-type="text">제목</span></li>
							<li><span data-path=".title" data-order="desc" data-type="text">제목 역순</span></li>
							<li><span data-path=".desc" data-order="asc" data-type="text">내용</span></li>
							<li><span data-path=".desc" data-order="desc" data-type="text">내용 역순</span></li>
							<li><span data-path=".like" data-order="asc" data-type="number" data-default="true">달성된 스케줄</span></li>
							<li><span data-path=".like" data-order="desc" data-type="number">달성되지 않은 스케줄</span></li>
							<li><span data-path=".date" data-order="asc" data-type="datetime">시간 순서</span></li>
							<li><span data-path=".date" data-order="desc" data-type="datetime">시간 역순</span></li>
						</ul>
					</div>
					<div class="text-filter-box">
						<div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".title" type="text" value="" placeholder="제목으로 검색하기" data-control-type="textbox" data-control-name="title-filter" data-control-action="filter" class="form-control"/></div>
					</div>
					<div class="text-filter-box">
						<div class="input-group"><span class="input-group-addon"><i class="fa fa-search"></i></span><input data-path=".desc" type="text" value="" placeholder="내용으로 검색하기" data-control-type="textbox" data-control-name="desc-filter" data-control-action="filter" class="form-control"/></div>
					</div>
					<div data-type="Page {current} of {pages}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
					<div data-control-type="pagination" data-control-name="paging" data-control-action="paging" class="jplist-pagination"></div>
				</div>
<!-- 컨트롤 판넬 종료 ==================================================================================================== -->
                     
<!-- 스케줄 리스트 시작 ==================================================================================================== -->
				<div class="box text-shadow">
				
				<table class="demo-tbl">
				
					<!-- scheduleMap 객체로부터 scheduleList 추출 -->
					<c:forEach var="schedules" items='${scheduleMap["scheduleList"]}'>
						<tr class="tbl-item">
							<!-- 시작일 -->
							<td class="td-block"><p class="date"><fmt:formatDate value='${schedules.start}' pattern="MM/dd hh:mm"/></p>
							<!-- 제목 -->
							<p class="title"><a href="javascript:goDetail(${schedules.scheduleNo});"><c:out value='${schedules.title }'/></a></p>
							<!-- 내용 -->
							<p class="desc"><a href="javascript:goDetail(${schedules.scheduleNo});"><c:out value='${schedules.content }'/></a></p>
							<!-- 달성여부 -->
							<p class="like">
							<c:choose>
								<c:when test='${schedules.achieve != 0}'>
									<input type="checkbox" name="achieved" checked="checked" disabled="disabled">
								</c:when>
								<c:otherwise>
									<input type="checkbox" name="achieved" >
								</c:otherwise>
							</c:choose>
							</p>
							
							</td>
						</tr>
					</c:forEach> 
				
				</table>
				    
				</div>
<!-- 스케줄 리스트 종료 ==================================================================================================== -->
                        
                        <div class="box jplist-no-results text-shadow align-center"><p>결과값이 존재하지 않습니다.</p></div>
                        <div class="jplist-ios-button"><i class="fa fa-sort"></i>스케줄 조회 옵션</div>
                        <div class="jplist-panel box panel-bottom">
                            <div data-type="{start} - {end} of {all}" data-control-type="pagination-info" data-control-name="paging" data-control-action="paging" class="jplist-label btn btn-default"></div>
                            <div data-control-type="pagination" data-control-name="paging" data-control-action="paging" data-control-animate-to-top="true" class="jplist-pagination"></div>
                        </div>
                    </div>
		</div>
		</div>
	</div>
<!-- 바디 판넬 종료 ==================================================================================================== -->

<!-- 디테일 페이지 시작 ==================================================================================================== -->
	<div class="col-lg-9">
		<div class="panel">
		<div class="panel-body">
		
			<!-- 이전 스케줄 링크 -->
			<div class="alert alert-success" id="prev"><strong>이전 스케줄</strong> 스케줄 링크</div>
			
            <div class="panel panel-orange">
				<div class="panel-heading">
				    Schedule Detail</div>
				    
				<!-- 스케줄 상세 -->
				<div class="panel-body pan" id="schDetail">
				
				<!-- 스케줄 입력 폼 시작 -->
				<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
				<div class="form-body pal">
				
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputTitle" name="title" type="text" placeholder="제목" class="form-control" />
				    </div>
				</div>
				
				<div class="row">
				    <div class="col-md-6">
				        <div class="form-group">
				            <input id="inputStart" name="start" type="date" placeholder="시작 시간" class="form-control" />
				        </div>
				    </div>
				    <div class="col-md-6">
				        <div class="form-group">
				            <input id="inputEnd" name="end" type="date" placeholder="종료 시간" class="form-control" />
				        </div>
				    </div>
				</div>
				
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputContent" name="content" type="text" placeholder="내용" class="form-control" />
				    </div>
				</div>
				
<!-- ============ 임시 하드코딩 ============	-->
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputCategory" name="category" type="text" placeholder="카테고리" value="1" class="form-control" />
				    </div>
				</div>
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputUserId" name="userId" type="hidden" placeholder="유저" value="tester01" class="form-control" />
				    </div>
				</div>
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputScheduleNo" name="scheduleNo" type="hidden" placeholder="유저" value="1" class="form-control" />
				    </div>
				</div>
				<div class="form-group">
				    <div class="input-icon right">
				        <i class="fa fa-user"></i>
				        <input id="inputAchieve" name="achieve" type="hidden" placeholder="달성" value="1" class="form-control" />
				    </div>
				</div>
<!-- ============ 임시 하드코딩============	-->
				
				<div class="form-group">
				    <select class="form-control" id="inputImportance" name="importance">
				        <option>중요도</option>
				        <option value="0"> ☆ ☆ ☆ </option>
				        <option value="1"> ★ ☆ ☆ </option>
				        <option value="2"> ★ ★ ☆ </option>
				        <option value="3"> ★ ★ ★ </option>
				    </select></div>
				<div class="form-actions text-center pal">
					<button class="btn btn-success">추가</button>
				</div>
				</div>
				</form>
				</div>
			</div>

			<!-- 다음 스케줄 링크 -->
			<div class="alert alert-success" id="next"><strong>다음 스케줄</strong> 다음 스케줄 링크</div>
 
		</div>
		</div>
	</div>
<!-- 디테일 페이지 종료 ==================================================================================================== -->
	
	</div>
</div>
<!-- 페이지 컨텐츠 종료 ==================================================================================================== -->
	</div>
	</div>
	</div>
</div>
<!-- 메인 컨텐츠 종료 ==================================================================================================== -->
                
<!-- 푸터 시작 ==================================================================================================== -->
<div id="footer">

</div>
<!-- 푸터 종료 ==================================================================================================== -->

</div>
<!-- 주 화면 래퍼 종료 ==================================================================================================== -->
</div>
<!-- 전체 래퍼 종료 ==================================================================================================== -->

</div>
<c:import url ="/WEB-INF/jsp/common/frameInclude.jsp"/>
<script src="${pageContext.request.contextPath}/web/js/schedule/scheduleMain.js"></script>

</body>
</html>
