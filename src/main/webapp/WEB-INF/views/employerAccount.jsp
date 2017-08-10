<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Job Seeker Account</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  	<link href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css" rel="stylesheet">
  	<style>

  	
  	</style>
</head>
<body>
	<jsp:include page="employerHeader.jsp"></jsp:include>


	<div class="container">
		<div class="row" style="min-height: 300px;">
			<div class="col-sm-10">
				<div><p><br/></p></div>
				<div><p><br/></p></div>
				<div><p><br/></p></div>

				<h3>Welcome user: ${sessionScope.userObj.firstName} </h3>

				
				<div class="col-xs-2">
					<!-- required for floating -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs tabs-left">
						<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
						<li><a href="#profile" data-toggle="tab">Profile</a></li>
						<li><a href="#savedJobs" data-toggle="tab">Saved Jobs</a></li>
						<li><a href="#jobAlerts" data-toggle="tab">Job Alerts</a></li>
						<li><a href="#settings" data-toggle="tab">Settings</a></li>
					</ul>
				</div>

				<div class="col-xs-10">
					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="home">Home Tab.
						<form id="empProfileForm" class="form-profile" commandName="employer" method="post" action="submitEmpProfile.htm">
						<div class="panel panel-danger" >
							<div class="panel-heading">Employer Details
							<span class="glyphicon glyphicon-chevron-down pull-right"></span>
							</div>
							<div class="panel-body">
								<div>
							
									<div class="col-md-12">
										<div class="col-md-2">
											<label for="firstName" class="control-label">First Name</label>
										</div>
										<div class="col-md-4">
											<input class="form-control" id="firstName" name="firstName" 
											value='<c:out value="${sessionScope.userObj.firstName}"></c:out>' disabled="disabled"/>
											</div>
											<div class="col-md-2">
											<label for="lastName" class="control-label">Last Name</label>
										</div>
											<div class="col-md-4">
											<input class="form-control" id = "lastName" name = "lasName" 
											value='<c:out value="${sessionScope.userObj.lastName}"></c:out>' disabled="disabled"/>
										</div>
									</div>
									<div class="col-md-12"><br/></div>
									<div class="col-md-12">
										<div class="col-md-2">
											<label for="emailId" class="control-label">Email Id</label>
										</div>
										<div class="col-md-4">
											<input class="form-control" id="emailId" name="emailId" 
											value='<c:out value="${sessionScope.userObj.emailId}"></c:out>' disabled="disabled"/>
										</div>
										<div class="col-md-2">
											<label for="phone" class="control-label">Company Name</label>
										</div>
										<div class="col-md-4">
											<input class="form-control" id="companyName" name="companyName" placeholder="company name" />
										</div>
									</div>
									<br/><br/>
									<div class="col-md-12">
										<div class="col-md-2">
											<label for="location" class="control-label">Location</label>
										</div>
										<div class="col-md-4">
											<input class="form-control" id="location" name="location" placeholder="location" />
										</div>
									</div>
								</div>
								
								
							</div>

						</div>
						<button type="submit" class="btn btn-default" style="margin-left: 310px;">Submit</button>
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
											</tr>
											<tbody>
												<c:forEach var="post" items="${sessionScope.userObj.getPosts() }">
												<tr>
													<td>${post.jobId}</td>
													<td>${post.companyName }</td>
													<td>${post.jobTitle }</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					
						
						
						</div>
						

						
						
						<div class="tab-pane" id="profile">Profile Tab.
							<form id="empPostForm" class="form-profile" commandName="employer"
							method="post" action="submitPost.htm">
							<div class="panel panel-success">
								<div class="panel-heading">
									 Post New Job <span
										class="glyphicon glyphicon-chevron-down pull-right"></span>
								</div>
								<div class="panel-body">
									<div>
											<div class="col-md-6">
												<div class="col-md-12">
													<div class="col-md-12">
														<label for="jobTitle" class="control-label">Job
															Title</label>
													</div>
													<div class="col-md-12">
														<input class="form-control" id="jobTitle" maxlength="255"
															name="jobTitle"
															placeholder="e.g. Senior Software Developer"
															spellcheck="True" type="text" />
													</div>
												</div>
												<div class="col-md-12"><br/></div>
												<div class="col-md-12">
													<div class="col-md-12">
														<label for="companyName" class="control-label">Company
															Name</label>

													</div>
													<div class="col-md-12">
														<input class="form-control" id="companyName"
															maxlength="255" name="companyName"
															placeholder="e.g. My Company Name" type="text" />
													</div>
												</div>
												<div class="col-md-12"><br/></div>
												<div class="col-md-12">
											<div class="col-md-12">
												<label for="eduLevel" class="control-label">EDUCATION
													LEVEL <small>(optional)</small>
												</label>

											</div>
											<div class="col-md-12">
												<select class="form-control" id="eduLevel"
													name="eduLevel">
													<option value="High School Diploma">High School Diploma</option>
													<option value="Bachelor Degree">Bachelor&#39;s Degree</option>
													<option value="Master Degree">Master&#39;s Degree</option>
													<option value="Doctorate">Doctorate</option>
												</select>
											</div>
										</div>
										<div class="col-md-12"><br/></div>
										<div class="col-md-12">
											<div class="col-md-12">
												<label for="expYears" class="control-label">YEARS OF
													EXPERIENCE <small>(optional)</small>
												</label>


											</div>
											<div class="col-md-12">
												<select class="form-control" id="expYears"
													name="expYears">
													<option value="0-1 Years of Experience">0-1 Years of Experience</option>
													<option value="2-4 Years of Experience">2-4 Years of Experience</option>
													<option value="5-7 Years of Experience">5-7 Years of Experience</option>
													<option value="7+ Years of Experience">7+ Years of Experience</option>

												</select>
											</div>
										</div>
										
											</div>
											<div class="col-md-6">
											<div class="col-md-12">
											<div class="col-md-12">
												<label for="locationCity" class="control-label">Job Location</label>
											</div>
											<div class="col-md-12">
												<input class="form-control" id="locationCity" name="locationCity"
													placeholder="City" type="text" />
											</div>
										</div>
										<div class="col-md-12"><br/></div>
										<div class="col-md-12">
											<div class="col-md-12">
												<label for="jobDescription" class="control-label">JOB
													DESCRIPTION</label>


											</div>
											<div class="col-md-12">
												<textarea class="form-control" cols="40" id="jobDescription"
													maxlength="13000" name="jobDescription" rows="10">
								</textarea>
											</div>
										</div>
										
										</div>
									
										
										<div class="col-md-12"><br/>	</div>
										
										<div class="col-md-12">
											<div class="col-md-12">
												<label for="jobType" class="control-label">JOB
													TYPE <small>(optional)</small>
												</label>
											</div>
											<div class="col-md-4">

												<div class="checkbox">
													<label for="jobType1" class="control-label"> <input
														type="checkbox" value="1" id="jobType1" name="jobType">
														Full Time
													</label>
												</div>

												<div class="checkbox">
													<label for="jobType2" class="control-label"> <input
														type="checkbox" value="2" id="jobType2" name="jobType">
														Part Time
													</label>
												</div>

											</div>
											<div class="col-md-4">

												<div class="checkbox">
													<label for="jobType3" class="control-label"> <input
														type="checkbox" value="3" id="jobType3" name="jobType">
														Internship
													</label>
												</div>

												<div class="checkbox">
													<label for="jobType4" class="control-label"> <input
														type="checkbox" value="4" id="jobType4" name="jobType">
														Contract
													</label>
												</div>

											</div>
											<div class="col-md-4">

												<div class="checkbox">
													<label for="jobType5" class="control-label"> <input
														type="checkbox" value="5" id="jobType5" name="jobType">
														Permanent
													</label>
												</div>

												<div class="checkbox">
													<label for="jobType6" class="control-label"> <input
														type="checkbox" value="6" id="jobType6" name="jobType">
														Temporary
													</label>
												</div>

											</div>
										</div>

										

										
									</div>
									<button type="submit" class="btn btn-default" style="margin-left: 310px;">Submit</button>
								</div>
								</div>
						</form>
								</div>
								
								<div class="tab-pane" id="savedJobs">Saved Jobs Tab.</div>
								<div class="tab-pane" id="jobAlerts">Alerts Tab.</div>
								<div class="tab-pane" id="settings">Settings Tab.</div>
							</div>
						</div>

				<div class="clearfix"></div>

			</div>
		</div>
	</div>
</body>
</html>

