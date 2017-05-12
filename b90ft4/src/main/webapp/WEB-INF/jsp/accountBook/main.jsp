<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Freelancer - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/sub.css" rel="stylesheet" type="text/css" />

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/css/freelancer.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
 	<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<style>
		.dropdown-menu > li{
			color:black !important;
			background: black !important;
		}
	</style>
	
	<style>
		@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
		
		fieldset, label { margin: 0; padding: 0; }
		fieldset{ margin-left: 215px;}
		body{ margin: 20px; }
		h1 { font-size: 1.5em; margin: 10px; }
		
		/****** Style Star Rating Widget *****/
		
		.rating { 
		  border: none;
		  float: left;
		}

		.rating > input { display: none; } 
		.rating > label:before { 
		  margin: 5px;
		  font-size: 1.25em;
		  font-family: FontAwesome;
		  display: inline-block;
		  content: "\f005";
		}
		
		.rating > .half:before { 
		  content: "\f089";
		  position: absolute;
		}
		
		.rating > label { 
		  color: #ddd; 
		  float: right; 
		}
		
		/***** CSS Magic to Highlight Stars on Hover *****/
		
		.rating > input:checked ~ label, /* show gold star when clicked */
		.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
		.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 	
		
		
		
	</style>
	
</head>

<body id="page-top" class="index">
<div class="container">

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
   
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">자기 관리</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                        
                    <!-- 드롭 다운 테스트 -->
                    <li class = "dropdown">
					      <a class = "dropdown-toggle" data-toggle = "dropdown" href = "#">
					          가계부 <span class = "caret"></span>
					      </a>
					      <ul class = "dropdown-menu">
					         <li><a href = "${pageContext.request.contextPath}/accountBook/budget.do">지출/수입</a></li>
					         <li><a href = "${pageContext.request.contextPath}/accountBook/loanDept.do">대입금/차입금</a></li>
					         <li><a href = "${pageContext.request.contextPath}/accountBook/setting.do">설정</a></li>
					      </ul>
					      
				   </li>
                    <!-- 드롭 다운 테스트  -->
                    <li class="page-scroll">
                        <a href="#about">다이어리</a>
                    </li>

                    <li class="page-scroll">
                        <a href="#contact">스케쥴러</a>
                    </li>
                        
                    <li>
                        <a href="${pageContext.request.contextPath}/main/news.do">뉴스</a>
                    </li>

                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    

    <!-- Header -->
    <header>
        <div class="container" id="maincontent" tabindex="-1">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="${pageContext.request.contextPath}/web/bootstrap/freelancer/img/profile.png" alt="">
                    <div class="intro-text">
                        <h1 class="name">자기 관리를 시작해보세요!</h1>
                        <hr class="star-light">
                        <span class="skills"> 『 적은 밖에 있는것이 아니라 내 안에 있다.
                        나를 극복하는 순간, 나는 황제가 된다. 』 - 칭키스칸 </span>
                    </div>
                </div>
            </div>
        </div>
    </header>
    

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
        
            <div class="row">
            
                <div class="col-lg-12 text-center">
                    <h2>관리 마법사</h2>
                    <hr class="star-primary">
                </div>
            </div>
            
            
            
            <div class="row">
            	<!-- 가계부 -->
                <div class="col-sm-6 portfolio-item" data-toggle = "tooltip" title = "가계" >
             
                <fieldset class="rating">
				    <input type="radio" id="acc10" name="acc" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				    <input type="radio" id="acc9" name="acc" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				    
				    <input type="radio" id="acc8" name="acc" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				    <input type="radio" id="acc7" name="acc" value="3 and a half"  checked /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
					
				    
				    <input type="radio" id="acc6" name="acc" value="3"/><label class = "full" for="star3" title="Meh - 3 stars"></label>
				    <input type="radio" id="acc5" name="acc" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				    
				    <input type="radio" id="acc4" name="acc" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				    <input type="radio" id="acc3" name="acc" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
				    
				    <input type="radio" id="acc2" name="acc" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
				    <input type="radio" id="acc1" name="acc" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
				</fieldset>

                    <a href="budget.do" class="portfolio-link">
                    	<!-- 돋보기 배경 -->
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <!-- 돋보기 배경 끝 -->
                        <img src="${pageContext.request.contextPath}/web/bootstrap/freelancer/img/portfolio/cabin.png" class="img-responsive" alt="Cabin">
                    </a>
                </div>
                
                
                <div class="col-sm-6 portfolio-item">
                <fieldset class="rating">
				    <input type="radio" id="wokr10" name="work" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				    <input type="radio" id="wokr9" name="work" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				    
				    <input type="radio" id="wokr8" name="work" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				    <input type="radio" id="wokr7" name="work" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
					
				    
				    <input type="radio" id="wokr6" name="work" value="3"/><label class = "full" for="star3" title="Meh - 3 stars"></label>
				    <input type="radio" id="wokr5" name="work" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				    
				    <input type="radio" id="wokr4" name="work" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				    <input type="radio" id="wokr3" name="work" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
				    
				    
				    <input type="radio" id="wokr2" name="work" value="1"  checked/><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
				    <input type="radio" id="work1" name="work" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
				</fieldset>

                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/bootstrap/freelancer/img/portfolio/cake.png" class="img-responsive" alt="Slice of cake">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item">
                <fieldset class="rating">
				    <input type="radio" id="sch10" name="sch" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				    <input type="radio" id="sch9" name="sch" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				    
				    <input type="radio" id="sch8" name="sch" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				    <input type="radio" id="sch7" name="sch" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
					
				    
				    <input type="radio" id="sch6" name="sch" value="3"/><label class = "full" for="star3" title="Meh - 3 stars"></label>
				    <input type="radio" id="sch5" name="sch" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				    
				    <input type="radio" id="sch4" name="sch" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				    <input type="radio" id="sch3" name="sch" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
				    
				    
				    <input type="radio" id="sch2" name="sch" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
				    <input type="radio" id="sch1" name="sch" value="half"  checked /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
				</fieldset>

                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/bootstrap/freelancer/img/portfolio/game.png" class="img-responsive" alt="Game controller">
                    </a>
                </div>
                
                <div class="col-sm-6 portfolio-item">
                <fieldset class="rating">
				    <input type="radio" id="diary10" name="diary" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				    <input type="radio" id="diary9" name="diary" value="4 and a half" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
				    
				    <input type="radio" id="diary8" name="diary" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				    <input type="radio" id="diary7" name="diary" value="3 and a half" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
					
				    
				    <input type="radio" id="diary6" name="diary" value="3"/><label class = "full" for="star3" title="Meh - 3 stars"></label>
				    <input type="radio" id="diary5" name="diary" value="2 and a half" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
				    
				    <input type="radio" id="diary4" name="diary" value="2" checked /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				    <input type="radio" id="diary3" name="diary" value="1 and a half" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
				    
				    
				    <input type="radio" id="diary2" name="diary" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
				    <input type="radio" id="diary1" name="diary" value="half" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
				</fieldset>

                    <a href="#" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/web/bootstrap/freelancer/img/portfolio/safe.png" class="img-responsive" alt="Safe">
                    </a>
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
    

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/web/bootstrap/freelancer/js/freelancer.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/web/js/accountbook/barChart.js"></script>
    
    
    
</div>
<script>
$(document).ready(function(){
	evaluateStar("acc",ratio);	
});

function evaluateStar(type,n){
	if(n%10 !=0){
		n = parseInt(n) + 10 ;
	}
	$("#"+type+Math.floor(n/10)).prop("checked",true);
}
</script>
</body>

</html>
