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
<script>
            function applyAjax(val) {
                var id = $(val).closest("tr").find('td:eq(0) input').val();
                $.ajax({
                    type: "GET",
                    url:  "applyJob/"+id+".htm",
                    data: "id=" + id,
                    success: function (response) {
                        $(val).closest("tr").remove();
                      
                    },
                    error: function (er) {
                        alert('Error: ' + er);
                    }

                });

            }

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
						<li><a href="${pageContext.request.contextPath}/jshome.htm">View Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/updateProfile.htm">Edit Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/resume.htm">Resume</a></li>
						<li class="active"><a href="${pageContext.request.contextPath}/getJobRecords.htm?pageNumber=0">View Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/appliedList.htm">Applied Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/searchJobInList.htm">Search Jobs</a></li>
						
						
					</ul>
				</div>

				<div class="col-xs-10">
					<div class="tab-pane" id="savedJobs">
						<div class="panel panel-success">
							<div class="panel-heading">All Jobs</div>
							<div class="panel-body">
								<div>
									<table class="table">
										<thead class="thead-inverse">
										<tr>
											
											<th>Job Id</th>
											<th>Job Title</th>
											<th>Company Name</th>
											<th>Apply</th>
											<th>View Details</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach var="post" items="${newPostList}">
											
											<tr>
									            <td style="display:none"><input type="text" value="${post.jobId}"/></td>
												<td>${post.jobId}</td>
												<td>${post.jobTitle }</td>
												<td>${post.companyName }</td>
												<td><a onclick="applyAjax(this);" class="btn btn-primary">Apply</a></td>
												<td>
												<a href="${pageContext.request.contextPath}/viewJDetails/${post.jobId }.htm"><span class="glyphicon glyphicon-info-sign"></span></a></td>
											</tr>
			
										</c:forEach>
										</tbody>
									</table>
									<c:forEach var="i" begin="0" end="${total}">
                                    <ul class="pagination pagination-lg">
                                        <li><a href="${pageContext.request.contextPath}/getJobRecords.htm?pageNumber=${i}"><c:out value="${i}"/></a></li>
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
</body>
</html>