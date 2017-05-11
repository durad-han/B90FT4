<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Cog + I : My Page</title>
    
<c:import url ="/WEB-INF/jsp/common/topInclude.jsp"/>
</head>

<body id="page-top" class="index">

<div class="container">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

<%@include file="/WEB-INF/jsp/common/menuInclude.jsp"%>

    <!-- Portfolio Grid Section -->
    <section id="portfolio" >
        <div class="container">
        <br><br><br><br><br><br><br><br>
		<div class="row">
		
			<div class="col-lg-12">
        		<ul id="generalTab" class="nav nav-tabs responsive" style="width: 80%;">
                    <li id="infoTab" class="active"><a href="#info-tab" data-toggle="tab">기본정보</a></li>
                    <li id="bodyTab"><a href="#body-tab" data-toggle="tab">신체정보</a></li>
                    <li id="logTab"><a href="#log-tab" data-toggle="tab">사용기록</a></li>
                </ul>
			</div>
			
		<div class="row">
			<div class="col-lg-12">
			<div id="generalTabContent" class="tab-content responsive">
            	<div id="info-tab" class="tab-pane fade in active" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">${user.userId}님의 기본정보</div>
                	<div class="panel-body">
                	
							<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
							<div class="form-body pal">
									
									<div class="form-group">
									        <input id="null" name="null" type="text" placeholder="기본값" class="form-control" />
									</div>
									
									<div class="form-group">
									        <input id="null" name="null" type="text" placeholder="기본값2" class="form-control" />
									</div>
									    
									<div class="form-actions text-center pal">
										<button class="btn btn-warning">수정</button>
									</div>
							</div>
							</form>
                	</div>
                </div>
               	</div>
               	
            	<div id="body-tab" class="tab-pane fade" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">${user.userId}님의 신체정보</div>
                	<div class="panel-body">
                	
							<form name="insertSchedule" action="insertSchedule.do" onsubmit="return scheduleForm();" method="post">
							<div class="form-body pal">
									
									<div class="form-group">
								        <input id="null" name="null" type="text" placeholder="머리" class="form-control" />
									</div>
									<div class="form-group">
								        <input id="null" name="null" type="text" placeholder="어깨" class="form-control" />
									</div>
									<div class="form-group">
								        <input id="null" name="null" type="text" placeholder="무릎" class="form-control" />
									</div>
									<div class="form-group">
								        <input id="null" name="null" type="text" placeholder="발" class="form-control" />
									</div>
									    
									<div class="form-actions text-center pal">
										<button class="btn btn-warning">수정</button>
									</div>
							</div>
							</form>
                	</div>
                </div>
               	</div>
               	
            	<div id="log-tab" class="tab-pane fade" style="min-height:200px;overflow: auto;">
				<div class="panel panel-green">
             		<div class="panel-heading">${user.userId}님의 사용기록</div>
                	<div class="panel-body">
                	
							<div class="form-body pal">
									
									<div class="form-group">
									        <input id="null" name="null" type="text" placeholder="뭘 보여줄까" class="form-control" />
									</div>
									    
							</div>
                	</div>
                </div>
               	</div>
               	
            </div>
           	</div>
        </div>
			
		</div>
		</div>
    </section>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

</div>
<c:import url ="/WEB-INF/jsp/common/bottomInclude.jsp"/>
<c:import url ="/WEB-INF/jsp/schedule/scheduleInclude.jsp"/>
</body>

</html>
