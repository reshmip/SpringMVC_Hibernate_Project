<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>New User Registration</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  	<style>
  		.employer-login .signin-link{float:left;padding-right:37px;border-right:1px solid #d7d7d7}
  		.employer-signin{float:right}.signin-container p{color:#a19c9b}.signin-btn{color:#4a4341}
  		.signin-btn:hover{text-decoration:none;color:#4a4341;background-color:#d7d7d7}
  	</style>
  </head>
  <body>
  
  <jsp:include page="header.jsp"></jsp:include>
  	<div class="container">
		<div class="row">
			<div><p><br/></p></div>
		</div>
		<div class="row">
			<div><p><br/></p></div>
		</div>
		<div class="row">
		<p><br/></p>
			<div><p><br/></p></div>
			<div class="col-md-6">
			</div>
		<div class="col-md-6">
			<div class="col-md-1"></div>
			<div class="col-md-9">
				<div class="panel panel-default">
					<div class="panel-heading" style="font-size:20px;">Register Job Seeker</div>
					<div class="panel-body">
						<div><p><br/>
						
						</p></div>
						<form:form id="signup-form" class="form-signin" commandName="user" method="post" action="jobSeekerAccount.htm">
        					<fieldset>
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="glyphicon glyphicon-user"></i></span> <input type="text"
												name="firstName" class="form-control" id="firstName"
												placeholder="First Name">
										</div>
										<font color="red"><form:errors path="firstName"></form:errors></font>
										<div>
											<p>
												<br />
											</p>
										</div>
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="glyphicon glyphicon-user"></i></span> <input type="text"
												name="lastName" class="form-control" id="lastName"
												placeholder="Last Name">
										</div>
										<font color="red"><form:errors path="lastName"></form:errors></font>
										<div>
											<p>
												<br />
											</p>
										</div>
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="glyphicon glyphicon-envelope"></i></span> <input type="email"
												name="emailId" class="form-control" id="emailId"
												placeholder="Email Id">
										</div>
										<font color="red"><form:errors path="emailId"></form:errors></font>
										<div>
											<p>
												<br />
											</p>
										</div>
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="glyphicon glyphicon-lock"></i></span> <input type="password"
												name="password" class="form-control" id="password"
												placeholder="Password">
										</div>
										<font color="red"><form:errors path="password"></form:errors></font>
										<c:if test="${!empty requestScope.error}">
											<p style="color:red">email id already registered</p>
										</c:if>
										<div>
											
											<p>
												<br />
											</p>
										</div>
										<button class="btn btn-md btn-warning btn-block" type="submit">Sign
											Up</button>

									</div>
									</fieldset>
									</form:form>
									<div class="signin-container employer-login">
										<div class="signin-link">
											<p>Have an account?</p>
											<a class="btn btn-default" href="${pageContext.request.contextPath}/loginJobSeeker.htm">Job
												Seeker Sign In</a>
										</div>
										<div class="employer-signin">
											<p>Are you an employer?</p>
											<a class="btn btn-default" href="${pageContext.request.contextPath}/registerEmployer.htm">Employer
												Sign Up</a>
										</div>

									</div></div>
			</div>
			
		</div>
		<div class="col-md-2"></div>
		</div>
		<div class="col-md-8">
		<div class="col-md-2"><p><br/></p></div>
		<div class="col-md-8">
			<div><p><br/></p></div>
			<div><p><br/></p></div>
			<p >
			
			</p>
			</div>
		</div>
	</div>
  	
  </body>