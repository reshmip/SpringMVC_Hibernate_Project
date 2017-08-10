<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  	<link rel="stylesheet" href="resources/homePage.css" type="text/css">
  	
  	<style>
  		.headPanel{
  			background-color:rgba(0,0,0,.4);
  			background-image: url("resources/images/successImg.png");
    		background-repeat: none;
  		}
  		
  		.subtitle{
  			font-family: Times, serif, "Times New Roman" ;
  			font-size:xx-large;
  			font-style: italic;
  			font-weight: 600;
  			color: #FFFFFF;
  			text-align: center;
  		}
  		#keywords{
  			margin-left:250px;
  		}
  		#location{
  			margin-left:70px;
  		}
  		#search{
  			margin-left:70px;
  		}
  	</style>
  	<script>
  	
  	</script>
  </head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div id="header">
		<div class="container">
			<div class="row" style="">
				<div class="col-lg-12" >
					<h1>Simple landing page</h1>
					<div class="panel panel-default headPanel" style="">
					<div class="panel-body" >
					<h2 class="subtitle">Passion is the difference between having a job and having a career</h2>
					<div><br/><br/><br/></div>
					<div><br/><br/><br/></div>
					
					<div><br/><br/><br/></div>
					<div><br/><br/><br/></div>
					<div><br/><br/><br/></div>
					<div><br/><br/><br/></div>
					
					<form:form class="form-inline" action="${pageContext.request.contextPath}/searchJobByKey.htm" method="post" >
					  <div class="form-group">
					    <input type="text" class="form-control" id="keywords" name="key" placeholder="Job Title, Skills or Company" />
					    <input type="text" class="form-control" id="location" name="loc" placeholder="City,State or ZIP" />
					  </div>
					  <button type="submit" class="btn btn-default" id="search">Search Jobs</button>
							</form:form>		
				</div>
				</div>
				</div>
				</div>
				
				<div class="col-md-12">
					<div class="col-md-1"></div>
					<div class="panel col-md-10">
					
						<c:if test="${!empty requestScope.error}">
									<p style="color:red">No job found</p>
						</c:if>
						<c:if test="${!empty requestScope.success}">
							<c:forEach var="job" items="${joblist}">
							<form action="applyJobFromHome/${job.jobId}.htm" method="post">
								<div class="col-md-11">
									<div class="col-md-6">
										<div class="col-md-4">
										<label for="jobTitle">Title</label>
										</div>
										<div class="col-md-6">
									<c:out value="${job.jobTitle }"></c:out>
									</div>
									</div>
									<div class="col-md-6">
										<div class="col-md-4">
										<label for="jobTitle">Posted Date</label>
										</div>
										<div class="col-md-6">
									<c:out value="${job.jobPostedDate }"></c:out>
									</div>
									</div>
									
									<div class="col-md-6">
										<div class="col-md-4">
										<label for="jobTitle">Company</label>
										</div>
										<div class="col-md-6">
									<c:out value="${job.companyName }"></c:out>
									</div>
									</div>
									<div class="col-md-6">
										<div class="col-md-4">
										<label for="jobTitle">Location</label>
										</div>
										<div class="col-md-6">
									<c:out value="${job.locationCity }"></c:out>
									</div>
									</div>
									<div class="col-md-12"><p><br/></p>
										<div class="col-md-4">
											<label style="font-size: 14px;color:blue;">Requirements</label>
										</div>
									
									</div>
									<div class="col-md-6">
										<div class="col-md-4">
										<label for="jobTitle">Degree</label>
										</div>
										<div class="col-md-6">
									<c:out value="${job.eduLevel }"></c:out>
									</div>
									</div>
									<div class="col-md-6">
										<div class="col-md-4">
										<label for="jobTitle">Experience</label>
										</div>
										<div class="col-md-6">
									<c:out value="${job.expYears }"></c:out>
									</div>
									</div>
									<div class="col-md-12"><p><br/></p>
									<div class="col-md-4">
										<label style="font-size: 14px;color:blue;">Job Description</label>
									</div>
									<div class="col-md-6">
									<c:out value="${job.jobDescription }"></c:out>
									</div>
										
									</div>
									<div class="col-md-12">
									<hr/>
									</div>
								</div>
								<div class="col-md-1">
						<button type="submit" class="btn btn-success">Apply</button>
					</div>		
					</form>
											</c:forEach>
										</c:if>
					</div>
					
				</div>
				
				<div class="row" id="results">
				<p><br/></p>
					
				</div>
				
				
				
		</div>
	</div>
</body>
</html>
