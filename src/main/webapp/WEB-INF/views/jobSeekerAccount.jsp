<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Job Seeker Account</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  	<link href="resources/css/tabs.css" type="text/css" rel="stylesheet">
  	<style>

  	
  	</style>
</head>
<body>
	<jsp:include page="jobseekerHeader.jsp"></jsp:include>


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
						<form id="jsProfileForm" class="form-profile" commandName="jobSeeker" method="post" action="submitProfile.htm">
						<div class="panel panel-danger" >
							<div class="panel-heading">Personal Details
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
									<div class="col-md-12"><p><br/></p></div>
									<div class="col-md-12">
										<div class="col-md-2">
											<label for="emailId" class="control-label">Email Id</label>
										</div>
										<div class="col-md-4">
											<input class="form-control" id="emailId" name="emailId" 
											value='<c:out value="${sessionScope.userObj.emailId}"></c:out>' disabled="disabled"/>
										</div>
										<div class="col-md-2">
											<label for="phone" class="control-label">Phone</label>
										</div>
										<div class="col-md-4">
											<input class="form-control" id="phone" name="phone" placeholder="###-###-####" />
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
												<label for="higherEducation" class="control-label">Education Level</label>
											</div>
											<div class="col-md-4">
												<select class="form-control" id="higherEducation"
													name="higherEducation">
													<option value="0">High School Diploma</option>
													<option value="1">Bachelor&#39;s Degree</option>
													<option value="2">Master&#39;s Degree</option>
													<option value="3">Doctorate</option>
												</select>
											</div>
											<div class="col-md-2">
												<label for="universityName" class="control-label">University Name</label>
											</div>
											<div class="col-md-4">
											<input class="form-control" id="universityName" name="universityName" placeholder="University Name" />
										</div>
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
											<div class="col-md-4">
												<label for="yearsOfExp" class="control-label">Total years of experience</label>
											</div>
											<div class="col-md-4">
												<input class="form-control" id="yearsOfExp" name="yearsOfExp" placeholder="number of years"/>
											</div>
										</div>
									</div>
								</div>	
							</div>
						</div>
						<div class="panel panel-warning">
							<div class="panel-heading">Certificates</div>
							<div class="panel-body">Panel content</div>
						</div>
						
						
						<button type="submit" class="btn btn-default btn-left" style="margin-left: 310px;"
													data-dismiss="modal">Submit</button>
						
						</div>
						</form>
						<!-- <div class="col-md-3">
						<div class="panel panel-success" >
							<div class="panel-heading">PROFILE DETAILS</div>
							<div class="panel-body">
								<a href="#personalDetails" target="right-div">Personal Details</a>
								<a href="#education">Education</a>
								<a href="#workExperience">Work Experience</a>
								<a href="#certifcates">Certificates</a>
							</div>
						</div>
						</div> -->
						
						
						<div class="tab-pane" id="profile">Profile Tab.
							<div class="well">
								
							<div><p><br/></p></div>
							 <div class="row">
							<div class="col-xs-4"></div>
							
							<div class="col-xs-4">
								<button type="button" class="btn btn-primary">Resume</button>
								<button type="button" class="btn btn-default">Cover
									Letter</button>
									</div>
									<div class="col-xs-4"></div>
									</div>
									<div class="row">
									<div class="col-xs-2"></div>
								<div class="col-xs-8">
								<h1 style="text-align:center">You don't have a resume yet!</h1>
							
							<p style="text-align:center">Allowed file types: .doc, .docx, .pdf, .txt</p>
							<button id="resumeUploadModal" type="button"
								class="btn btn-warning" data-toggle="modal"
								data-target="#uploadResumeModal" style="margin-left:125px;">Upload a File</button>
								</div>
							<div class="col-xs-2"></div>
							</div>
							
							
							<!-- CREATE RESUME UPLOAD MODAL -->
								<div class="modal fade" id="uploadResumeModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" id="exampleModalLabel">Resume Upload</h4>
											</div>
											<div class="modal-body">
												<form>
													<p>Allowed file types: .doc, .docx, .pdf, .txt</p>
													<input type="file" name="resume_file" id="upload-file-input"
												accept=".txt,.pdf,.doc,.docx" />
												</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default btn-left"
													data-dismiss="modal">Cancel</button>
												<button type="button" class="btn btn-primary">Upload</button>
											</div>
										</div>
									</div>
								</div>
								
								</div>
								</div>
								
								<div class="tab-pane" id="savedJobs"> Jobs Tab.
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
											</tr>
											
												<tr>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												</tr>
											
											
											
											
											</table>
											
										</div>
										</div>
									</div>
								</div>
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

