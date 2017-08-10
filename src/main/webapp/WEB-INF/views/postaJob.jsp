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
 </head>
 <body>
 	<jsp:include page="header.jsp"></jsp:include>
 	<div class="container">
		<div class="row">
			<div id="step1">
				<div class="progressImage">
				</div>
			</div>
		</div>
		<div class="row">
		<p><br/></p>
		<p><br/></p>
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<p> Please provide the details of you job posting </p>
					<p><br/></p>
					 <form id="postJob" role="form" class="" method="post" commandName="" action="postJob.htm">

					<div class="form-group">
						<div class="group">
							<label for="title" class="control-label">JOB TITLE</label><span
								class="glyphicon glyphicon-info-sign"></span> <span>
								Enter the level, industry and role</span> 
								<input class="form-control"
								id="title" maxlength="255" name="title"
								placeholder="e.g. Senior Software Developer" spellcheck="True"
								type="text" />
						</div>

						<div class="group">
							<label for="id_location" class="control-label">JOB
								LOCATION</label> 
								<input class="form-control" id="location" name="location" placeholder="Zip Code"
								type="text" />

						</div>
						<div class="group">
							<input class="form-control" id="address" name="address"
								placeholder="Street, e.g. 123 Main St. (optional)" type="text" />

						</div>
						
						<div class="group">
							<label for="company" class="control-label">COMPANY NAME</label>
							
								<input class="form-control" id="id_company" maxlength="255"
									name="company" placeholder="e.g. My Company Name" type="text" />

							</div>
						</div>
						
						<div class="form-group">
    						<label for="description" class="control-label">JOB DESCRIPTION</label>
    						<div class="group">
      							<textarea class="form-control" cols="40" id="description" maxlength="13000" name="description" rows="10">
								</textarea>
      
    						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-12">
								<label for="id_job_type" class="control-label">JOB TYPE
									<small>(optional)</small>
								</label>
							</div>
							<div class="col-md-4">

								<div class="checkbox">
									<label for="job_type_1" class="control-label"> <input
										type="checkbox" value="1" id="job_type_1" name="job_type">
										Full Time
									</label>
								</div>

								<div class="checkbox">
									<label for="job_type_2" class="control-label"> <input
										type="checkbox" value="2" id="job_type_2" name="job_type">
										Part Time
									</label>
								</div>

							</div>
							<div class="col-md-4">

								<div class="checkbox">
									<label for="job_type_3" class="control-label"> <input
										type="checkbox" value="3" id="job_type_3" name="job_type">
										Internship
									</label>
								</div>

								<div class="checkbox">
									<label for="job_type_4" class="control-label"> <input
										type="checkbox" value="4" id="job_type_4" name="job_type">
										Contract
									</label>
								</div>

							</div>
							<div class="col-md-4">

								<div class="checkbox">
									<label for="job_type_5" class="control-label"> <input
										type="checkbox" value="5" id="job_type_5" name="job_type">
										Permanent
									</label>
								</div>

								<div class="checkbox">
									<label for="job_type_6" class="control-label"> <input
										type="checkbox" value="6" id="job_type_6" name="job_type">
										Temporary
									</label>
								</div>

							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="educationLevel" class="control-label">EDUCATION
							LEVEL <small>(optional)</small>
						</label>
						<div class="group">
							<select class="form-control" id="educationLevel"
								name="educationLevel">
								<option value="0"></option>
								<option value="1">High School Diploma</option>
								<option value="2">Bachelor&#39;s Degree</option>
								<option value="3">Master&#39;s Degree</option>
								<option value="4">Doctorate</option>
							</select>

						</div>
					</div>
					<div class="form-group">
						<label for="yearExp" class="control-label">YEARS
							OF EXPERIENCE <small>(optional)</small>
						</label>
						<div class="group">
							<select class="form-control" id="yearExp"
								name="years_experience">
								<option value="0"></option>
								<option value="1">0-2 Years of Experience</option>
								<option value="2">2-5 Years of Experience</option>
								<option value="3">5-7 Years of Experience</option>
								<option value="4">7+ Years of Experience</option>

							</select>

						</div>
					</div>
					<div class="form-group">
						<label for="hourlySalary" class="control-label">HOURLY
							SALARY <small>(optional)</small>
						</label>
						<div class="controls">
							<input class="form-control" id="hourlySalary"
								name="hourlySalary" type="text" />

						</div>
					</div>
					<input id="continueBtn" class="btn btn-primary" value="Continue" />
          			<input id="previewBtn" class="btn btn-default" value="Preview" />
				</form>
				</div>
				<div class="col-md-3"></div>
				
		</div>
	</div>
		
 </body>
</html>