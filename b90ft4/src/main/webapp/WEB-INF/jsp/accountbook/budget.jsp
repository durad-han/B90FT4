<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="col-lg-12">
         <!-- 지출/비용 시작 -->
   <div class="row">
             	<!-- 달력 -->
		<div class="col-lg-6"><h3>달력</h3>

			<input type="radio" name="time" id="day"  value="1"/>
				<label for="day">
				일
				</label>
				<input type="radio" name="time" id="week" value="2"/>
				<label for="week">
				주
				</label>
				<input type="radio" name="time" id="month" value="3"/>
				<label for="month">
				월
				</label>
			<br>
	
			<input type="text" name="date">
			<div id="datepicker" placeholder="ex) 2017-03-30"></div><br>

		</div>

		<div class="col-lg-6"><h3>지출</h3>
      	   <br>
      	   <div class="panel panel-green">
			      <div class="panel-heading">지출</div>
    				 <div class="panel-body">
			            <table class="table table-hover-color" >
			                <thead>
			                <tr>
			                    <th>#</th>
			                    <th>분류</th>
			                    <th>내용</th>
			                    <th>금액</th>
			                </tr>
			                </thead>
			                <tbody>
			                <tr>
			                    <td>1</td>
			                    <td><span class="label label-sm label-success">교통비</span></td>
			                    <td>집-학원</td>
			                    <td>5,000원</td>
			                </tr>
			                <tr>
			                    <td>2</td>
			                    <td><span class="label label-sm label-info">식비</span></td>
			                    <td>본차로드</td>
			                    <td>12,000원</td>
			                </tr>
			                <tr>
			                    <td>3</td>
			                    <td><span class="label label-sm label-warning">의류비</span></td>
			                    <td>NC백화점</td>
			                    <td>89,000원</td>
			                </tr>
			                <tr>
			                    <td>4</td>
			                    <td><span class="label label-sm label-danger">통신비</span></td>
			                    <td>휴대폰</td>
			                    <td>54,350원</td>
			                </tr>
			                </tbody>
			            </table>
   			 		</div>
  				</div>
		</div>
      </div>
 </div>
<script src="${pageContext.request.contextPath}/web/js/accountbook/calendar.js"></script>
