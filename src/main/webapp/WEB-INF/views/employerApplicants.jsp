<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

				<h3>Welcome user: ${sessionScope.userObj.firstName}</h3>


				<div class="col-xs-2">
					<!-- required for floating -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs tabs-left">
						<li class="active"><a href="empHome.htm">Home</a></li>
						<li><a href="postJob.htm">Post Job</a></li>
						<li><a href="viewApps.htm">View Applicants</a></li>
						<li><a href="#jobAlerts">Job Alerts</a></li>
						<li><a href="#settings">Settings</a></li>
					</ul>
				</div>
				<div class="col-xs-10">
					<!-- Tab panes -->
					<div class="tab-pane active">
						Job Post Tab.
						
						
													
						<form id="empApplicantsForm" class="form-profile" commandName="applicant"
							method="post" action="submitPost.htm">
							<div class="panel panel-success">
								<div class="panel-heading">
									Post New Job <span
										class="glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="panel-body">
									<div>
									<label for="jobId" class="control-label">Job Id</label>
										<select class="form-control" id="jobId" name="jobId">
							<c:forEach var="job" items="${sessionScope.userObj.getPosts()}">
								<option value="">${job.jobId}</option>
							</c:forEach>
						</select>
						
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
