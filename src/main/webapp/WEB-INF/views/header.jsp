<!-- Fixed navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/home.htm"><img src="${pageContext.request.contextPath}/resources/images/logo4.png" alt="HIRED"/></a>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/home.htm">Get Hired</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-search"></span>Find Jobs</a></li>
			<li class="loginDropdown dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>Sign In/Register<span class="caret"></span></a>
				
				<ul class="dropdown-menu dropdown-menu-left">
    				<li id="loginError" name="loginError" style="display:none;"></li>
    					<form class="navbar-form navbar-left" name="loginForm" 
    					action="loginUser.htm" method="post" commandName="user">
        					<div class="form-group">
        						<div id="msgbox"></div>
          						<input type="email" id="loginEmail" name="emailId" class="form-control" placeholder="email id">
          						<p></p>
          						<input type="password" id="loginPwd" name="password" class="form-control" placeholder="password">
          						<div class="form-group">
                            		
                            		<div class="checkbox">
                                		<label for="loggedIn"><input type="checkbox" id="loggedIn"> Stay signed in</label>
                            		</div>
                            		<p></p>
                        		</div>
        					</div>
        					<button id="loginBtn" type="submit" class="btn btn-primary btn-block">Login</button>
      					</form>
      					
      					<div class="col-md-12">
      					<li></li>
      				<li><a id="RegisterBtn" href="registerJobSeeker.htm" class="btn btn-default btn-sm btn-block">New User</a></li>
      				<p></p>
      				<li><a id="EmployerBtn" href="registerEmployer.htm" class="btn btn-default btn-sm btn-block">Are you an employer?</a></li>
      				</div>
  				</ul>
			</li>
			<li><a id="postJob" href="${pageContext.request.contextPath}/postJob.htm"><span class="btn btn-default">Post a Job</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>