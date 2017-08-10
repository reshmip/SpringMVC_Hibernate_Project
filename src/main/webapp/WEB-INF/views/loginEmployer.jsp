<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="utf-8">
	<title>Employer Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  	<link rel="stylesheet" href="resources/homePage.css" type="text/css">
  	
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
					<div class="panel-body">
					<div> 
						<h3><i>Sign In</i></h3>
					</div>
						<form id="loginJSForm" class="form-signin" method="post" action="loginJSForm.htm">
        					<fieldset>
        						<div class="form-group">
        							<div><p><br/></p></div>
									<div class="input-group">
										<span class="input-group-addon"> 
											<i class="glyphicon glyphicon-envelope"></i>
										</span> 
										<input type="text"
											name="emailId" class="form-control" id="emailId"
											placeholder="Email Id">
									</div>
									<div><p><br/></p></div>
									<div class="input-group">
										<span class="input-group-addon"> <i
											class="glyphicon glyphicon-lock"></i></span> <input type="text"
											name="password" class="form-control" id="password"
											placeholder="Password">
									</div>
									<div><p><br/></p></div>
            					<button class="btn btn-md btn-warning btn-block" type="submit">Sign Up</button>
        						</div>
        					</fieldset>
        					<div class="account-options">
          						<p><a id="forgotPwd" href="forgotPassword.htm" style="margin-left:150px;">Forgot your password?</a></p>
          					</div>
        				</form>
        				<div class="signin-container employer-login">
        				<div class="signin-link">
          					<p>Don't have an account?</p>
          					<a class="btn btn-default" href="registerJobSeeker.htm">Employer Sign Up</a>
        				</div>
						<div class="employer-signin">
         	 				<p>Are you an job seeker?</p>
          					<a class="btn btn-default" href="registerEmployer.htm">Job Seeker Sign Up</a>
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