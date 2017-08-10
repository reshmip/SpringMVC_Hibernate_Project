<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script>

</script>
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
						<li class="active"><a href="${pageContext.request.contextPath}/jobsList.htm">View Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/appliedList.htm">Applied Jobs</a></li>
					</ul>
				</div>
				<div class="col-xs-10">
					<!-- Tab panes -->
					
						<div class="tab-pane active" id="home">
							

							<div class="panel panel-success">
								<div class="panel-heading">Job Details of : ${details.jobTitle }  </div>
								<div class="panel-body">
									<div>
										<div class="col-sm-12">
											<div class="col-sm-2">
												<label for="jobPostStatus" class="control-label" style="font-size:16px;color:green;">Status</label>
												
											</div>
											<div class="col-sm-6">
												<label class="control-label" name="jobPostStatus" style="font-size:16px;color:green;">${details.jobPostStatus }</label>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-6">
												<label for="jobTitle" class="control-label" style="font-size:14px;">Job details:</label>
											</div>
											<div class="col-sm-6">
												<label class="control-label" name="jobTitle" style="font-size:14px;">${details.jobTitle }</label>
											</div>
											<div class="col-sm-3">
											
											</div>
										</div>
										<div>
											<p><br/></p>
											<p><br/></p>
										</div>
									</div>
									<div>
										<div class="col-md-12">
										<!--<form id="statusForm" class="form-profile" commandName="jobApplied" action="submitStatus.htm">-->
											<table class="table table-bordered">
												
												<tbody>
													
														<tr>
															
															<td>Company Name</td><td>${details.companyName}</td>
															</tr>
															<tr>
															<td>Posted Date</td><td>${details.jobPostedDate}</td>
															</tr>
															<tr>
															<td>Job Description</td><td>${details.jobDescription }</td>
															</tr>
															<tr>
															<td>Job Type</td> <td>${details.jobType } </td>
															</tr>
															<tr>
															<td>Required Degree</td> <td>${details.eduLevel}</td>
															</tr>
															<tr>
															<td>Experience Required</td> <td>${details.expYears}</td>
															</tr>
															
															
															
														</tr>
														
														
												</tbody>
											</table>
												<a href="${pageContext.request.contextPath}/appliedList.htm" class="btn btn-default">Back</a>
		
											
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
