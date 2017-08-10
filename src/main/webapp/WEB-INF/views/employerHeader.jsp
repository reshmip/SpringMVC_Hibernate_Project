<!-- Job seeker navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/getJobs.htm?pageNumber=0"><img src="${pageContext.request.contextPath}/resources/images/logo4.png" alt="HIRED"/></a>
          <a class="navbar-brand" href="#">Get Hired</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span ></span></a></li>
			<li class="user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${sessionScope.firstName}<span class="caret"></span></a>
				
				<ul class="dropdown-menu dropdown-menu-left">
    				<li id="loginError" name="loginError" style="display:none;"></li>
    				<li style="margin-left:10px;margin-right:10px;"><a href="${pageContext.request.contextPath}/getJobs.htm?pageNumber=0">Home<span class="glyphicon glyphicon-home pull-right"></span></a></li>
    				<li role="separator" class="divider"></li>
    				
    				<li style="margin-left:10px;margin-right:10px;"><a href="${pageContext.request.contextPath}/logout.htm" >Sign Out<span class="glyphicon glyphicon-off pull-right"></span></a></li>
  				</ul>
			</li>
			<li><a id="postJob" href="${pageContext.request.contextPath}/postJob.htm"><span class="btn btn-default">Post a Job</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>