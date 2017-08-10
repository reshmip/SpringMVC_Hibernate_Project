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
						<li class="active"><a href="${pageContext.request.contextPath}/jshome.htm">View Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/updateProfile.htm">Edit Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/resume.htm">Resume</a></li>
						<li><a href="${pageContext.request.contextPath}/getJobRecords.htm?pageNumber=0">View Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/appliedList.htm">Applied Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/searchJobInList.htm">Search Jobs</a></li>
					</ul>
				</div>

				<div class="col-xs-10">
					<!-- Tab panes -->

					<div class="tab-pane active" id="home">
						
						
						<div>
							<p><br/></p>
						</div>
						<form:form action="updateProfile.htm" commandName="jobSeeker" method="post">
							<c:if test="${!empty requestScope.error}">
									<p style="color:red">Details not updated</p>
								</c:if>
								<c:if test="${!empty requestScope.success}">
											<p style="color:green">Details Updated Successfully</p>
										</c:if>
							<div class="panel panel-danger">
							
								<div class="panel-heading">
									Personal Details <span
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
											<p>
												<br />
											</p>
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
											<div class="col-md-2">
												<label for="phone" class="control-label">Phone</label>
											</div>
											<div class="col-md-4">
												<input class="form-control" id="phone" name="phone" value="${js.phone }"
													placeholder="###-###-####"/>
													<font color="red"><form:errors path="phone"></form:errors></font>
											</div>
										</div>
										
									</div>


								</div>

							</div>


							<div class="panel panel-success">
								<div class="panel-heading">Education</div>
								<div class="panel-body">
									<div>
										<div class="col-md-12">
											<div class="col-md-12">
												<div class="col-md-2">
													<label for="higherEducation" class="control-label">Education
														Level</label>
												</div>
												<div class="col-md-4">
													<select class="form-control" id="higherEducation"
														name="higherEducation">
														<option value="">${js.higherEducation }</option>
														<option value="0">High School Diploma</option>
														<option value="1" selected="selected">Bachelor&#39;s Degree</option>
														<option value="2">Master&#39;s Degree</option>
														<option value="3">Doctorate</option>
													</select>
												</div>
												<div class="col-md-2">
													<label for="universityName" class="control-label">University
														Name</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="universityName" value="${js.universityName }"
														name="universityName" placeholder="University Name" />
														<font color="red"><form:errors path="universityName"></form:errors></font>
												</div>
											</div>
											<div class="col-md-12">
											
												<br />
											
										</div>
											<div class="col-md-12">
												<div class="col-md-2">
													<label for="concentration" class="control-label">Concentration</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="concentration" value="${js.concentration }"
														name="concentration" placeholder="field of study" />
														<font color="red"><form:errors path="concentration"></form:errors></font>
												</div>
												
											<div class="col-md-2">
													<label for="location" class="control-label">Location</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="concentration" value="${js.location }"
														name="location" placeholder="country" />
														<font color="red"><form:errors path="location"></form:errors></font>
												</div>
										
											</div>
											<div class="col-md-12">
											
												<br />
											
										</div>
										
										
										</div>
									</div>
								</div>
							</div>
							<div class="panel panel-info">
								<div class="panel-heading">Work Experience</div>
								<div class="panel-body">
									<div>
										<div class="col-md-12">
											<div class="col-md-12">
												<div class="col-md-2">
													<label for="yearsOfExp" class="control-label">Total experience</label>
												</div>
												<div class="col-md-4">
													<input type="number" class="form-control" id="yearsOfExp" value="${js.yearsOfExp }"
														name="yearsOfExp" />
														
														
												</div>
												<div class="col-md-2">
													<label for="recentEmployer" class="control-label">Recent Employer</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="recentEmployer" value="${js.recentEmployer }"
														name="recentEmployer" placeholder="firm name" />
												</div>
											</div>
											<div class="col-md-12">
												<br/>
											</div>
											<div class="col-md-12">
												<div class="col-md-2">
													<label for="jobRole" class="control-label">Role/Title</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="recentEmployer" value="${js.jobRole }"
														name="jobRole" placeholder="" />
												</div>
												<div class="col-md-2">
													<label for="jobLocation" class="control-label">Location</label>
												</div>
												<div class="col-md-4">
													<input class="form-control" id="concentration" value="${js.jobLocation }"
														name="jobLocation" placeholder="country" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="panel panel-warning">
								<div class="panel-heading">Top 5 Skills</div>
								<div class="panel-body">
								<div>
								<div class="col-md-12">
								<div class="col-md-2">
									<label for="skill1" class="control-label">Skill 1</label>
								</div>
								<div class="col-md-4">
									<input class="form-control" id="skill1" value="${js.skill1 }"
										name="skill1" placeholder="eg: JAVA" />
								</div>
								<div class="col-md-2">
									<label for="skill2" class="control-label">Skill 2</label>
								</div>
								<div class="col-md-4">
									<input class="form-control" id="skill2" value="${js.skill2 }"
										name="skill2" placeholder="eg: php" />
								</div>
								</div>
								<div class="col-md-12">
									<br/>
								</div>
								<div class="col-md-12">
								<div class="col-md-2">
									<label for="skill3" class="control-label">Skill 3</label>
								</div>
								<div class="col-md-4">
									<input class="form-control" id="skill3" value="${js.skill3 }"
										name="skill3" placeholder="eg: quality analysis" />
								</div>
								<div class="col-md-2">
									<label for="skill4" class="control-label">Skill 4</label>
								</div>
								<div class="col-md-4">
									<input class="form-control" id="skill4" value="${js.skill4 }"
										name="skill4" placeholder="eg: risk analysis" />
								</div>
								</div>
								<div class="col-md-12">
								<br/>
								</div>
								<div class="col-md-12">
									<div class="col-md-2">
									<label for="skill5" class="control-label">Skill 5</label>
								</div>
								<div class="col-md-4">
									<input class="form-control" id="skill5" value="${js.skill5 }"
										name="skill5" placeholder="eg: HTML" />
								</div>
								</div>
								</div>
							</div>
							</div>
							
							<button type="submit" class="btn btn-default btn-left"
								style="margin-left: 310px;" data-dismiss="modal">Submit</button>
						
						</form:form>
					</div>
					
				</div>
			</div>
		</div>
		</div>
	</body>
</html>