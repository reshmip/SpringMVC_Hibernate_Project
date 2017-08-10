<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link href="${pageContext.request.contextPath}/resources/css/tabs.css"
	type="text/css" rel="stylesheet">
<style>
</style>
</head>
<body>
	<jsp:include page="employerHeader.jsp"></jsp:include>


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

				<h3>Welcome ${sessionScope.userObj.firstName}</h3>


				<div class="col-xs-2">
					<!-- required for floating -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs tabs-left">
						<li class="active"><a
							href="${pageContext.request.contextPath}/getJobs.htm?pageNumber=0">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/postJob.htm">Post
								Job</a></li>
					</ul>
				</div>
				<div class="col-xs-10">
					<!-- Tab panes -->
					<div class="tab-pane active">
						<div><p><br/></p></div>
						<div></div>
							<c:if test="${!empty requestScope.error}">
								<p style="color: red">Job not updated</p>
							</c:if>
							<c:if test="${!empty requestScope.success}">
								<p style="color: green">Job Updated Successfully</p>
							</c:if>
							<div class="panel panel-success">
								<div class="panel-heading">
									Job Details <span
										class="glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="panel-body">
									<div>
										<div class="col-md-12">
											<div class="col-md-12">
												<div class="col-md-6">
													<label for="jobTitle" class="control-label">Job
														Title</label>
												</div>
												<div class="col-md-6">
													${post.jobTitle}
														
												</div>
											</div>
											<div class="col-md-12">
												<br />
											</div>
											<div class="col-md-12">
												<div class="col-md-6">
													<label for="companyName" class="control-label">Company
														Name</label>

												</div>
												<div class="col-md-6">
													${post.companyName}
												</div>
											</div>
											<div class="col-md-12">
												<br />
											</div>
											<div class="col-md-12">
												<div class="col-md-6">
													<label for="eduLevel" class="control-label">EDUCATION
														LEVEL <small>(optional)</small>
													</label>

												</div>
												<div class="col-md-6">
													${post.eduLevel}
												</div>
											</div>
											<div class="col-md-12">
												<br />
											</div>
											<div class="col-md-12">
												<div class="col-md-6">
													<label for="expYears" class="control-label">YEARS
														OF EXPERIENCE <small>(optional)</small>
													</label>


												</div>
												<div class="col-md-6">
												${post.expYears}
												</div>
											</div>
											<div class="col-md-12">
												<br />
											</div>
											<div class="col-md-12">
												<div class="col-md-6">
													<label for="locationCity" class="control-label">Job
														Location</label>
												</div>
												<div class="col-md-6">
													${post.locationCity}
												</div>
											</div>
											<div class="col-md-12">
												<br />
											</div>
											<div class="col-md-12">
												<div class="col-md-6">
													<label for="locationCity" class="control-label">Job
														Type</label>
												</div>
												<div class="col-md-6">
													${post.jobType}
												</div>
											</div>
											<div class="col-md-12">
												<br />
											</div>
											
											<div class="col-md-12">
												<div class="col-md-12">
													<label for="jobDescription" class="control-label">JOB
														DESCRIPTION</label>


												</div>
												<div class="col-md-12">
													${post.jobDescription}
												</div>
											</div>

										</div>


										<div class="col-md-12">
											<br />
										</div>

									
									</div>


									<div class="col-md-12">
										<div>
											<p>
												<br />
											</p>
										</div>
									<form class="form-profile"
							action="${pageContext.request.contextPath}/submitJobStatus/${post.jobId }.htm"
							method="post">
							<div class="col-md-12">
							<div class="col-md-4">
							<select class="form-control" name="jobPostStatus" id="jobPostStatus">
								<option value=""><c:out value="${post.jobPostStatus }"></c:out></option>
								<option value="Active">Reopen Post</option>
								<option value="Close">Close Job</option>
							</select>
							
							</div>
							
							<button type="submit" class="btn btn-primary">Submit
								Status</button>
								
								</div>
						</form>
						<div class="col-md-12"><p><br/></p></div>
						<div class="col-md-12">
							<div class="col-md-12">
								<a href="${pageContext.request.contextPath}/getJobs.htm?pageNumber=0" class="btn btn-default">Back</a>
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
</body>
</html>