<div  id="envelope" class="col-md-offset-3 col-md-6 col-sm-12">
	<div class="login">

		<header>
			<h2>Submit Your Profile</h2>
			<hr>
			<form class="form-horizontal" name="userForm" novalidate>  

				<button class="btn btn-success" ng-click="toggle('Basic Information')">Basic Information</button>&nbsp;&nbsp;
				<button class="btn btn-success" ng-click="toggle('Academic Information')">Academic Information</button>&nbsp;&nbsp;
				<button class="btn btn-success" ng-click="toggle('Extracurricular Activities')">Extracurricular</button></br>




				<div ng-show="toggleShow=='Basic Information'" class="form-group">	<!-- Basic Field -->
					<label class="control-label">Your Name </label>
					<input type="text" class="form-control" name="name" placeholder="Sachin Goel" ng-model='userCtrl.user.name' ng-minlength="5" ng-maxlength="25" required></br>

					<span class="msg" ng-show="userForm.name.$dirty && userForm.name.$error.required">This is a required field</span>
					<span class="msg" ng-show="userForm.name.$dirty && userForm.name.$error.minlength">Your Name is too Short</span>
					<span class="msg" ng-show="userForm.name.$dirty && userForm.name.$error.maxlength">Your Name is too Long</span>


					<label class="control-label">Email Id </label>
					<input type="email" name="email" class="form-control" placeholder="yourname@gmail.com" ng-model='userCtrl.user.email' required></br>
					<span class="msg" ng-show="userForm.email.$dirty && userForm.email.$invalid">Email Address is not valid</span>



					<label class="control-label">Age</label>
					<input class="form-control" type="number" name="age" ng-model='userCtrl.user.age' min="18" max ="65" required>
					<span class="msg" ng-show="userForm.age.$dirty && userForm.age.$error.required">Age is required</span>
					<span class="msg" ng-show="userForm.age.$dirty && userForm.age.$error.min">You should be above 18</span>
					<span class="msg" ng-show="userForm.age.$dirty && userForm.age.$error.max">You should be below 65</span>

					
					<label class="control-label">Gender</label>
					<input type="radio" name="gender" value="Male" ng-model='userCtrl.user.gender' >Male</input>
					<input type="radio" name="gender" value="Female" ng-model='userCtrl.user.gender' >Female</input>
					<input type="radio" name="gender" value="Other" ng-model='userCtrl.user.gender'>Other</input></br>
					
					<label class="control-label">  Your Date Of Birth </label>
					<input class="form-control" type="date" name="dob" ng-model='userCtrl.user.dob' required >
					<span class="msg" ng-show="userForm.dob.$dirty && userForm.age.$error">DOB is required</span>
					</br>
					<label class="control-label">Enter Your Address</label>
					<input class="form-control" type="text" ng-model="userCtrl.user.address.subaddress" placeholder="Enter Your House Number and Locality">
					<input class="form-control" type="text" ng-model="userCtrl.user.address.city" placeholder="Enter Your City">
					<input class="form-control" type="text" ng-model="userCtrl.user.address.state" placeholder="Enter Your State">
					<input class="form-control" type="text" ng-model="userCtrl.user.address.country" placeholder="Enter Your Country">
					<input class="form-control" type="number" name="zipcode" ng-model="userCtrl.user.address.zipcode" placeholder="Enter Your Zipcode" ng-minlength="6" ng-maxlength="6">
					<span class="msg" ng-show="userForm.zipcode.$dirty && userForm.zipcode.$error.minlength">Zipcode should be of 6 digits</span>
					<span class="msg" ng-show="userForm.zipcode.$dirty && userForm.zipcode.$error.maxlength">Zipcode should be of 6 digits</span>
				</div>


				<div ng-show="toggleShow=='Academic Information'">	<!-- Academics Field -->
				</br>
				<label id ="label" class="control-label">Higher Secondary Details</label></br>
				<label class="control-label">Percentage</label>
				<input class="form-control" type="number" name="10cent" ng-model="userCtrl.user.academics.tenth.marks" placeholder="Obtained Percentage" max=100 >
				<!-- <span class="msg" ng-show="userForm.10cent.$dirty && userForm.zipcode.$error.max">Percentage should be less than 100</span>
 -->
				<label class="control-label">Select Board</label>
				<select class="form-control" name="tenthBoard" ng-model="userCtrl.user.academics.tenth.board">
					<option  value="CBSE">CBSE</option>
					<option  value="ICSE">ICSE</option>
					<option  value="NIOS">NIOS</option>
					<option  value="UP Board">UP Board</option>
					<option  value="Other">Other</option>
				</select>
				<div ng-if="userCtrl.user.academics.tenth.board === 'Other'">
					<label class="control-label">Specify Board</label>
					<input type="text" class="form-control" ng-model="userCtrl.user.academics.tenth.otherBoard" >
				</div>
			</br>

			<label id ="label" class="control-label">Senior Secondary Details</label></br>
			<label class="control-label">Percentage</label>
			<input type="number" class="form-control" ng-model="userCtrl.user.academics.twelve.marks" placeholder="Obtained Percentage"  max=100 name="12cent">

			<!-- <span class="msg" ng-show="userForm.12cent.$dirty && userForm.zipcode.$error.max">Percentage should be less than 100</span> -->

			<label class="control-label">Select Board</label>
			<select class="form-control" name="twelveBoard" ng-model="userCtrl.user.academics.twelve.board" >
				<option  value="CBSE">CBSE</option>
				<option value="ISE">ISE</option>
				<option value="NIOS">NIOS</option>
				<option value="UP Board">UP Board</option>
				<option value="Other">Other</option>
			</select>
			<div ng-if="userCtrl.user.academics.twelve.board=='Other'">
				<label class="control-label">Specify Board</label>
				<input type="text" class="form-control" ng-model="userCtrl.user.academics.twelve.board">
			</div>
		</div>

		<!-- Extracurricular Fields -->

		<div ng-show="toggleShow=='Extracurricular Activities'">


	<!-- <div data-ng-repeat="div in divs">
		<label class="control-label">Activity</label>
		<input class="form-control" type="text" name="activity" ng-model="userCtrl.user.extracurricular.activity[$index]">
		<label class="control-label">Duration</label>
		</br>From:
		<input class="form-control" type="date" name="from" ng-model="userCtrl.user.extracurricular.year.from">
		To:
		<input class="form-control" type="date" name="to" ng-model="userCtrl.user.extracurricular.year.to">
		<label class="control-label">Award</label>
		<input class="form-control" type="text" name="award" ng-model="userCtrl.user.extracurricular.award[$index]">
	</div>
	</br>
	
	<button class="form-control" class="btn btn-success" ng-click="addDivs()">Add More Activity</button> -->

	<label class="control-label" class="control-label" >Activity</label>
	<input class="form-control" type="text" name="activity" ng-model="userCtrl.user.extracurricular.activity">

	<label class="control-label">Duration</label>
	</br>From:
	<input class="form-control" type="date" name="from" ng-model="userCtrl.user.extracurricular.year.from">
	To:
	<input class="form-control"type="date" name="to" ng-model="userCtrl.user.extracurricular.year.to">
	<label class="control-label">Award</label>
	<input class="form-control"type="text" name="award" ng-model="userCtrl.user.extracurricular.award">

</div>
</br></br>
<div >
<input ng-disabled="userForm.$invalid" class="btn btn-warning form-control" type="submit" ng-click="submitDetails()">
</div>	
</form>
<div>

</div>