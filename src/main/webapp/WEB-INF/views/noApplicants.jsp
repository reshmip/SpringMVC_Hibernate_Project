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
$(document).ready(function(){
	$(".showHiddenRow").click(function(){
		 $(this).parent().next("tr").show();
		});
	$(".hideRow").click(function(){
		 $(this).parent().hide();
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
						<li class="active"><a href="${pageContext.request.contextPath}/getJobs.htm?pageNumber=0">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/postJob.htm">Post Job</a></li>
			
					</ul>
				</div>
				<div class="col-xs-10">
					<!-- Tab panes -->
					
						<div class="tab-pane active" id="home">
							View Applicants.

							<div class="panel panel-success">
								<div class="panel-heading">Applicants List for : ${sessionScope.title }</div>
								<div class="panel-body">
									<div>
										<div class="col-sm-12">
											<div class="col-sm-2">
												<label for="jobTitle" class="control-label">Job Title :</label>
											</div>
											<div class="col-sm-6">
												<label class="control-label" name="jobTitle">${sessionScope.title }</label>
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
											<table class="table table-hover">
												<tr>
													
													<td>No Applicants
												</tr>
												<tbody>
													<tr>
													
													</tr>
												</tbody>
											</table>
											<a href="${pageContext.request.contextPath}/getJobs.htm?pageNumber=0" class="btn btn-default">Back</a>
		
								
											
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
