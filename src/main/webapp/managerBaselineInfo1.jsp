<%@ page import="com.harsha.app.database.*" %>
<%@ page import="com.harsha.app.bean.*" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Harsha Trust | BaselineInfo Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.10/angular.js"></script>
  <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.11.0.js"></script>
  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<%
HttpSession nSession = request.getSession(false);
if(nSession.isNew()) {
	System.out.println("SESSION = " + "SESSION EXPIRED, TRY LOGGING AGAIN");
	request.setAttribute("msg", "SESSION EXPIRED, TRY LOGGING AGAIN");
	request.getRequestDispatcher("index.jsp").forward(request, response);
}

String msg = null;
msg = (String) request.getAttribute("msg");
int householdDataId = Integer.parseInt(request.getParameter("householdDataId"));
int counter = 0;
DBManager dbManager = new DBManager();
HouseHoldBean household = DBHandler.getByHouseholdId(householdDataId, dbManager);



%>

<body class="hold-transition skin-blue fixed sidebar-mini" ng-app="myApp1" ng-controller="myCtrl1">
<!-- Site wrapper -->


  
   
					<div class="box">
            <div class="box-header">
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered table-striped">
					<thead>
					
					<tr>
					     <th align="center">stateName</td>
					     <td ><%=household.getStateName() %></td>
					 </tr>
					 <tr>
					     <th align="center">stateCode</td>
					     <td ><%=household.getStateCode() %></td>
					  </tr>
					  <tr>
					     <th align="center">districtName</td>
					     <td ><%=household.getDistrictname() %></td>
					  </tr>
					  <tr>
					     <th align="center">districtCode</td>
					     <td ><%=household.getDistrictCode() %></td>
					  </tr>
					  <tr>
					     <th align="center">blockName</td>
					     <td ><%=household.getBlockName() %></td>
					  </tr>
					  <tr>
					     <th align="center">blockCode</th>
					     <td ><%=household.getBlockCode() %></td>
					  </tr>
					  <tr>
					     <th align="center">VillageName</th>
					     <td ><%=household.getVillageName() %></td>
					  </tr>
					  <tr>
					     <th align="center">VillageCode</th>
					     <td ><%=household.getVillageCode() %></td>
					 </tr>
					 <tr>
					     <th align="center">SurveyOwner UserName</th>
					     <td ><%=household.getSurveyOwnerUserName() %></td>
					 </tr>
					 <tr>
					     <th align="center">Number Of Family Member</th>
					     <td ><%=household.getNoOfFamilyMember() %></td>
					 </tr>
					 <tr>
					     <th align="center">Survey Period</th>
					     <td ><%=household.getSurveyPeriod() %></td>
					 </tr>
					 <tr>
					     <th align="center">Social Category Name</th>
					     <td ><%=household.getSocialCategoryName() %></td>
					 </tr>
					 <tr>
					     <th align="center">Religion Name</th>
					     <td ><%=household.getReligionName() %></td>
					  </tr>
					  <tr>
					     <th align="center">Contact No</th>
					     <td ><%=household.getContactNo() %></td>
					 </tr>
					 <tr>
					     <th align="center">Occupation Name</th>
					     <td ><%=household.getOccupationName() %></td>
					 </tr>
					 <tr>
					     <th align="center">AnnualHouseholdIncome</th>
					     <td ><%=household.getAnnualHHIncome() %></td>
					 </tr>
					 <tr>
					     <th align="center">statusCode</th>
					     <td ><%=household.getStatusCode() %></td>
					  </tr>
					  <tr>
					     <th align="center">remarks</th>
					     <td ><%=household.getRemarks() %></td>
					 </tr>
					</thead>
					<tbody>
	       				
					   		
					</tbody>
				</table>
			
                  <!--=========end transactions row========-->
                  <!-- /.description-block -->
                </div>
              </div>
              <!-- /.row -->
           
         
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<script>
var app = angular.module('myApp1', []);
app.controller('myCtrl1', function($scope, $http) {
$scope.sortType     = 'name'; // set the default sort type
$scope.sortReverse  = false;  // set the default sort order
$scope.searchFish   = '';     // set the default search/filter term

 
$http.get('http://10.1.1.117:8085/HarshaProject/api/household/getallhousehold')



  .success(function(data) {
  $scope.countries = data;
  console.log("countries:" + $scope.countries );
  console.log("Length:" + $scope.countries.length );
  $scope.viewby = 10;
  $scope.length1=$scope.countries.length;
  console.log("Length:" +  $scope.length1 );
  $scope.totalItems = $scope.length1;
  $scope.currentPage = 4;
  $scope.itemsPerPage = $scope.viewby;
  $scope.maxSize = 5; //Number of pager buttons to show

	  
  });
  $scope.setPage = function (pageNo) {
    $scope.currentPage = pageNo;
  };

  $scope.pageChanged = function() {
    console.log('Page changed to: ' + $scope.currentPage);
  };

$scope.setItemsPerPage = function(num) {
  $scope.itemsPerPage = num;
  $scope.currentPage = 1; //reset to first paghe
}
});
</script>
<script>
  $(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
</body>
</html>