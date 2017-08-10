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
					<div class="tab-pane" id="profile">
						<div><p><br/></p></div>
						
						<div class="well">

							<div>
								<p>
									<br />
								</p>
							</div>
							<div class="row">
								<div class="col-xs-4"></div>

								<div class="col-xs-4">
									<button type="button" class="btn btn-primary">Resume</button>
									<button type="button" class="btn btn-default">Cover
										Letter</button>
								</div>
								<div class="col-xs-4"><p><br/></p></div>
							</div>
							<div class="row">
								<p><br/></p>
							</div>
							<div class="row">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<h3 style="text-align: center">Attach Files:</h3>
										
									<p style="text-align: center">Allowed file types: .doc,
										.docx, .pdf, .txt</p>
									<button id="resumeUploadModal" type="button"
										class="btn btn-warning" data-toggle="modal"
										data-target="#uploadResumeModal" style="margin-left: 150px;">Upload
										a File</button>
								</div>
								<div class="col-xs-2"></div>
							</div>
							<div class="row">
								<p><br/></p>
								
								<div class="col-md-2"></div>
								<div class="col-md-8">
								<p style="text-align:center">Your file:
								<a href="${pageContext.request.contextPath}/download/${sessionScope.userObj.personId}.htm">${filename}</a> 
								</p>
								</div>
								
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
											<h4 class="modal-title" id="exampleModalLabel">Resume
												Upload</h4>
										</div>
										<form method="post" action="uploadResume.htm" enctype="multipart/form-data">
										<div class="modal-body">
											
												<p>Allowed file types: .doc, .docx, .pdf, .txt</p>
												<input type="file" name="resumeFile" id="upload-file-input"
													accept=".txt,.pdf,.doc,.docx" />
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default btn-left"
												data-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Upload</button>
										</div>
										</form>
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