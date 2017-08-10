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

				<h3>Welcome ${sessionScope.userObj.firstName}</h3>


				<div class="col-xs-2">
					<!-- required for floating -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs tabs-left">
						<li class="active"><a href="${pageContext.request.contextPath}/getJobs.htm?pageNumber=0">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/postJob.htm">Post Job</a></li>

					</ul>
				</div>
				<div class="col-xs-10">
					<!-- Tab panes -->
					
						<div class="tab-pane active" id="home">
							<div><p><br/></p></div>
							<div></div>
							<form id="empProfileForm" class="form-profile"
								commandName="employer" method="post"
								action="submitEmpProfile.htm">
								<div class="panel panel-danger">
									<div class="panel-heading">
										Employer Details <span
											class="glyphicon glyphicon-chevron-down pull-right"></span>
									</div>
									<div class="panel-body">
										<div>

											<div class="col-md-12">
												<div class="col-md-2">
													<label for="firstName" class="control-label">First
														Name</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="firstName" name="firstName"
														value='<c:out value="${sessionScope.userObj.firstName}"></c:out>'
														disabled="disabled" />
												</div>
												<div class="col-md-2">
													<label for="lastName" class="control-label">Last
														Name</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="lastName" name="lasName"
														value='<c:out value="${sessionScope.userObj.lastName}"></c:out>'
														disabled="disabled" />
												</div>
											</div>
											<div class="col-md-12">
												<br />
											</div>
											<div class="col-md-12">
												<div class="col-md-2">
													<label for="emailId" class="control-label">Email Id</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="emailId" name="emailId"
														value='<c:out value="${sessionScope.userObj.emailId}"></c:out>'
														disabled="disabled" />
												</div>
												
											
											</div>
											<br /> <br />
											
										</div>


									</div>

								</div>
								
							</form>

							<div class="panel panel-success">
								<div class="panel-heading">Jobs Posted</div>
								<div class="panel-body">
									<div>
										<div class="col-md-12">
											<table class="table table-hover">
												<tr>
													<th>Job Id</th>
													<th>Job Title</th>
													<th>Company Name</th>
													<th>View Applicants</th>
													
													<th></th>
												</tr>
												<tbody>
													<c:forEach var="post"
														items="${jobsList }">
														<tr>
															<td>${post.jobId}</td>
															<td>${post.jobTitle }</td>
															<td>${post.companyName }</td>
															
															<td><a href="${pageContext.request.contextPath}/viewApplicants/${post.jobId }.htm" class="btn btn-primary" ><span class="glyphicon glyphicon-user"></span></a></td>
															<td><a href="${pageContext.request.contextPath}/viewJobDetails/${post.jobId }.htm" class="btn btn-primary" >View Details</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<c:forEach var="i" begin="0" end="${total}">
                                    <ul class="pagination pagination-lg">
                                        <li><a href="getJobs.htm?pageNumber=${i}"><c:out value="${i}"/></a></li>
                                    </ul>
                                </c:forEach>
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
