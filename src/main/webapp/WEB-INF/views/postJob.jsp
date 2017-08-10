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
<script type="text/javascript">
	$(document).ready(function(){
		$("#submitBtn").submit(function(){
			if($("#jobTitle").val().length == 0){
				
				$("#jobtitle").html("mandatory fields");
				
			}
		});
		
	});
	
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
						<li><a href="${pageContext.request.contextPath}/getJobs.htm?pageNumber=0">Home</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/postJob.htm">Post Job</a></li>
					</ul>
				</div>
				<div class="col-xs-10">
					<!-- Tab panes -->
					<div class="tab-pane active">
					<div><p><br/></p></div>
					<div></div>
							<form:form id="empPostForm" class="form-profile" commandName="jobpost"
							method="post" action="submitPost.htm">
							<c:if test="${!empty requestScope.error}">
									<p style="color:red">Job not posted</p>
								</c:if>
								<c:if test="${!empty requestScope.success}">
											<p style="color:#0B6121;font-size:14px;font-style:italic;font-weight:bold;">Job Updated Successfully</p>
										</c:if>
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
															name="jobTitle" path="jobTitle"
															placeholder="e.g. Senior Software Developer"
															spellcheck="True" type="text"  required="required"/>
															<font color="red"><h6 id="jobtitle"></h6></font>
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
															maxlength="255" name="companyName" path="companyName"
															placeholder="e.g. My Company Name" type="text" required="required"/>
															<font color="red"><h6 id="companyname"></h6></font>
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
												<input class="form-control" id="locationCity" name="locationCity" path="locationCity"
													placeholder="City" type="text" required="required"/>
													<font color="red"><h6 id="locationcity"></h6></font>
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
														type="checkbox" value="Full Time" id="jobType1" name="jobType">
														Full Time
													</label>
												</div>

												<div class="checkbox">
													<label for="jobType2" class="control-label"> <input
														type="checkbox" value="Part Time" id="jobType2" name="jobType">
														Part Time
													</label>
												</div>

											</div>
											<div class="col-md-4">

												<div class="checkbox">
													<label for="jobType3" class="control-label"> <input
														type="checkbox" value="Internship" id="jobType3" name="jobType">
														Internship
													</label>
												</div>

												<div class="checkbox">
													<label for="jobType4" class="control-label"> <input
														type="checkbox" value="Contract" id="jobType4" name="jobType">
														Contract
													</label>
												</div>

											</div>
											<div class="col-md-4">

												<div class="checkbox">
													<label for="jobType5" class="control-label"> <input
														type="checkbox" value="Permanent" id="jobType5" name="jobType">
														Permanent
													</label>
												</div>

												<div class="checkbox">
													<label for="jobType6" class="control-label"> <input
														type="checkbox" value="Temporary" id="jobType6" name="jobType">
														Temporary
													</label>
												</div>

											</div>
										</div>										
									</div>
									<button type="submit" id="submitBtn" class="btn btn-default" style="margin-left: 310px;">Submit</button>
								</div>
								</div>
						</form:form>
								</div>
					</div>
					</div>
					</div>
					</div>
					</body>
					</html>