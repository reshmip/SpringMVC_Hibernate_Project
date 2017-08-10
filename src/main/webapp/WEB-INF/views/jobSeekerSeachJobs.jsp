<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<title>Job Seeker Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="jobseekerHeader.jsp"></jsp:include>


	<div class="container">
		<div class="row" style="min-height: 300px;">
			<div class="col-sm-10">
				<div>
					<p>
						<br />
					</p>
				</div>
				<div>
					<p>
						<br />
					</p>
				</div>
				<div>
					<p>
						<br />
					</p>
				</div>

				<h3>Welcome user: ${sessionScope.userObj.firstName}</h3>


				<div class="col-xs-2">
					<!-- required for floating -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs tabs-left">
						<li><a href="${pageContext.request.contextPath}/jshome.htm">View Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/updateProfile.htm">Update Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/resume.htm">Resume</a></li>
						<li><a href="${pageContext.request.contextPath}/getJobRecords.htm?pageNumber=0">View Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/appliedList.htm">Applied Jobs</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/searchJobInList.htm">Search Jobs</a></li>
					</ul>
				</div>

				<div class="col-xs-10">
					<div class="tab-pane" id="savedJobs">
					
				<div class="col-md-12">
					<p><br/></p>
				</div>	
				<div><p><br/></p></div>	
				<div></div>
    <div class="panel panel-info">
    
        <div class="panel-heading clearfix">
            <h4 class="panel-title pull-left" style="padding-top: 4px;"></h4>
            <div class="col-md-12">
            <form:form  action="${pageContext.request.contextPath}/searchJobKey.htm" method="post" >
                <div class="col-md-5">
                    <input type="text" class="form-control col-md-6" name="key" placeholder="job title">
                    </div>
                    <div class="col-md-6">
                    <div class="form-inline pull-right">
                    <input type="text" class="form-control col-md-9" name="loc" placeholder="location">
                    
                        <button class="btn btn-primary"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                
                    
                </div>
                </form:form>
                </div>
        </div>
        <div class="panel-body">
            <div class="col-md-12">
					
					<div class="panel col-md-12">
						<c:if test="${!empty requestScope.exists}">
									<p style="color:red">You have already applied</p>
						</c:if>
						<c:if test="${!empty requestScope.notexists}">
									<p style="color:red">You have successfully applied</p>
						</c:if>
						<c:if test="${!empty requestScope.error}">
									<p style="color:red">No job found</p>
						</c:if>
						<c:if test="${!empty requestScope.success}">
							<c:forEach var="job" items="${joblist}">
							<form action="applyToJob/${job.jobId}.htm" method="post">
							
							
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
									<div class="col-md-12"><p><br/></p></div>
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
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
