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
						<li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/postJob.htm">Post Job</a></li>
											</ul>
				</div>
				<div class="col-xs-10">
					<!-- Tab panes -->
					
						<div class="tab-pane active" id="home">
							<c:if test="${!empty requestScope.success}">
													<p style="color:red">Status updated</p>
												</c:if>
												<c:if test="${!empty requestScope.error}">
													<p style="color:red">Status not updated</p>
												</c:if>
							<div class="panel panel-success">
								<div class="panel-heading">Applicant Details : (Title - ${sessionScope.title })</div>
								<div class="panel-body">

									<div>
										<div class="col-md-12">
										<!--<form id="statusForm" class="form-profile" commandName="jobApplied" action="submitStatus.htm">-->
											
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Name</label>
													</div>
													<div class="col-md-6">
														${applicant.name}
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>Date Applied</label>
													</div>
													<div class="col-md-6">
														${applicant.dateApplied}
													</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Email Id</label>
													</div>
													<div class="col-md-6">
														${applicant.emailId}
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>Phone</label>
													</div>
													<div class="col-md-6">
														${applicant.phone}
													</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Degree Achieved</label>
													</div>
													<div class="col-md-6">
														${applicant.higherEducation}
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>University</label>
													</div>
													<div class="col-md-6">
														${applicant.universityName}
													</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Major Field</label>
													</div>
													<div class="col-md-6">
														${applicant.concentration}
													</div>
													
												</div>
												
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Location</label>
													</div>
													<div class="col-md-6">
														${applicant.location}
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>Recent Employer</label>
													</div>
													<div class="col-md-6">
														${applicant.recentEmployer}
													</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Role/Title</label>
													</div>
													<div class="col-md-6">
														${applicant.jobRole}
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>Job Location</label>
													</div>
													<div class="col-md-6">
														${applicant.jobLocation}
													</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Skill 1</label>
													</div>
													<div class="col-md-6">
														${applicant.skill1}
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>Skill 2</label>
													</div>
													<div class="col-md-6">
														${applicant.skill2}
													</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Skill 3</label>
													</div>
													<div class="col-md-6">
														${applicant.skill3}
													</div>
													
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>Skill 4</label>
													</div>
													<div class="col-md-6">
														${applicant.skill4}
													</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>Skill 5</label>
													</div>
													<div class="col-md-6">
														${applicant.skill5}
													</div>
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														<label>Resume</label>
													</div>
													<div class="col-md-6">
												<div class="col-md-12"><p><br/></p></div>
												<a href="${pageContext.request.contextPath}/download/${applicant.jobAppliedId}.htm"> 
															${applicant.resumeName}</a>
												</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
												<div class="col-md-6">
													<div class="col-md-4">
														<label>Status</label>
													</div>
													<div class="col-md-8">
														${applicant.status}
													</div>
												</div>
												<div class="col-md-12"><p><br/></p></div>
											<div class="col-md-12">
											
											<form class="form-profile" action="${pageContext.request.contextPath}/submitStatus/${applicant.jobAppliedId }.htm" method="post">
												<div class="col-md-12">
												<div class="col-md-3">
													<input type="radio" name="status" id="status" checked="checked" value="in progress"/>In Progress
												</div>
												<div class="col-md-3">
													<input type="radio" name="status" id="status" value="considered" />Considered
												</div>
												<div class="col-md-3">
													<input type="radio" name="status" id="status" value="donot meet requirements" />Reject
												</div>
												
												<div class="col-md-3">
												<button type="submit" class="btn btn-primary">Submit Status</button>
												</div>
												</div>
											</form>
											<a href="${pageContext.request.contextPath}/empHome.htm" class="btn btn-default">Back</a>
		
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
