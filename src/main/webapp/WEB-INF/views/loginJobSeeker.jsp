<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
	<title>Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  	<link rel="stylesheet" href="resources/homePage.css" type="text/css">
  	<link href="${pageContext.request.contextPath}/resources/css/tabs.css" rel="stylesheet">
  	
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
			<div><p><br/>p</></div>
		</div>
		<div class="row">
			<p><br/></p>
			<div><p><br/></p></div>
			<div class="col-md-3">
			</div>
			<div class="col-md-6">
				<div class="col-md-10">
				<div class="panel panel-default">
				<div class="panel-heading" style="font-size:20px;">USER LOGIN</div>
					<div class="panel-body">
					
						<form id="loginJSForm" class="form-signin" commandName="user" method="post" action="${pageContext.request.contextPath}/loginUser.htm">
        					<fieldset>
        						<div class="form-group">
        							<div><p>
        							<c:if test="${!empty requestScope.created}">
											<p style="color:green">Registered Successfully</p>
										</c:if>
        							<c:if test="${!empty requestScope.error}">
											<p style="color:red">invalid user name or password</p>
										</c:if>
										<c:if test="${!empty requestScope.nosession}">
											<p style="color:red">please login to your account</p>
										</c:if>
										<c:if test="${!empty requestScope.invalidsession}">
											<p style="color:red">please login to apply job</p>
										</c:if>
        							<br/></p></div>
									<div class="input-group">
										<span class="input-group-addon"> 
											<i class="glyphicon glyphicon-envelope"></i>
										</span> 
										<input type="email"
											name="emailId" class="form-control" id="emailId"
											placeholder="Email Id" required="required">
									</div>
									<div><p><br/></p></div>
									<div class="input-group">
										<span class="input-group-addon"> <i
											class="glyphicon glyphicon-lock"></i></span> <input type="password"
											name="password" class="form-control" id="password"
											placeholder="Password" required="required">
									</div>
									<div><p><br/></p></div>
            					<button class="btn btn-md btn-warning btn-block" type="submit">Sign Up</button>
        						</div>
        					</fieldset>
        					<div class="account-options">
          						</div>
        				</form>
        				<div class="signin-container employer-login">
        				<div class="signin-link">
          					<p>Don't have an account?</p>
          					<a class="btn btn-default" href="${pageContext.request.contextPath}/registerJobSeeker.htm">Job Seeker Sign Up</a>
        				</div>
						<div class="employer-signin">
         	 				<p>Are you an employer?</p>
          					<a class="btn btn-default" href="${pageContext.request.contextPath}/registerEmployer.htm">Employer Sign Up</a>
        				</div>
        
      				</div>
        			</div>
			</div>
			</div>
			</div>
			<div class="col-md-3">
			</div>
 </body>
</html>