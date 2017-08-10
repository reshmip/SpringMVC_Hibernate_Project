<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<li><a href="${pageContext.request.contextPath}/updateProfile.htm">Edit Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/resume.htm">Resume</a></li>
						<li><a href="${pageContext.request.contextPath}/getJobRecords.htm?pageNumber=0">View Jobs</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/appliedList.htm">Applied Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/searchJobInList.htm">Search Jobs</a></li>
					</ul>
				</div>

				<div class="col-xs-10">
					<div class="tab-pane" id="savedJobs">
						Jobs Tab.
						<div class="panel panel-success">
							<div class="panel-heading">All Jobs</div>
							<div class="panel-body">
								<div>
									<table class="table table-hover">
										<tr>
											<th></th>
											<th>Job Id</th>
											<th>Job Title</th>
											<th>Company Name</th>
											<th>Application Status</th>
											<th></th>
										</tr>
										<c:forEach var="post" items="${appliedJobsList}">
											<tr>
											<td></td>
												<td>${post.jobPost.jobId}</td>
												<td>${post.jobPost.jobTitle }</td>
												<td>${post.jobPost.companyName }</td>
												<td>${post.status }</td>
												<td><a href="viewJob/${post.jobPost.jobId }.htm" class="btn btn-primary"><span class="glyphicon glyphicon-info-sign"></span></a></td>
											</tr>
										</c:forEach>
										
									</table>

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