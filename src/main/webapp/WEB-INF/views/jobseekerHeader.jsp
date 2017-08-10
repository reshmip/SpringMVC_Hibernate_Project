<!-- Job seeker navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/jshome.htm"><img src="${pageContext.request.contextPath}/resources/images/logo4.png" alt="HIRED"/></a>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/jshome.htm">Get Hired</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="${pageContext.request.contextPath}/searchJobInList.htm"><span class="glyphicon glyphicon-search"></span>Find Jobs</a></li>
			<li class="user dropdown"><a href="${pageContext.request.contextPath}/jshome.htm" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>${sessionScope.firstName}<span class="caret"></span></a>
				
				<ul class="dropdown-menu dropdown-menu-left">
    				<li id="loginError" name="loginError" style="display:none;"></li>
    				<li style="margin-left:10px;margin-right:10px;"><a href="${pageContext.request.contextPath}/resume.htm">Resume<span class="glyphicon glyphicon-file pull-right"></span></a></li>
    				<li role="separator" class="divider"></li>
    				<li style="margin-left:10px;margin-right:10px;"><a href="${pageContext.request.contextPath}/getJobRecords.htm?pageNumber=0">New Jobs <span class="glyphicon glyphicon-star pull-right"></span></a></li>
    				<li role="separator" class="divider"></li>
    				<li style="margin-left:10px;margin-right:10px;"><a href="${pageContext.request.contextPath}/appliedList.htm">Applied Jobs <span class="glyphicon glyphicon-envelope pull-right"></span></a></li>
    				<li role="separator" class="divider"></li>
    				<li style="margin-left:10px;margin-right:10px;"><a href="${pageContext.request.contextPath}/jshome.htm">Profile<span class="glyphicon glyphicon-user pull-right"></span></a></li>
    				<li role="separator" class="divider"></li>
    				<li style="margin-left:10px;margin-right:10px;"><a href="${pageContext.request.contextPath}/logout.htm" >Sign Out<span class="glyphicon glyphicon-off pull-right"></span></a></li>
  				</ul>
			</li>
			<li><a id="postJob" ><span class="btn btn-default">Get a Job</span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>