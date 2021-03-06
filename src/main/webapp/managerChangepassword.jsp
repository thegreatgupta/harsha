<%@ page import="com.harsha.app.bean.*" %><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Harsha Trust | changepassword</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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

   <script src = "scripts/angular.min.js"></script>
  <!--==============================================================================-->
   <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>
   <script>
      // create angular app
      var validationApp = angular.module('validationApp', []);  
      // create angular controller
      validationApp.controller('validationCtrl', function($scope) {
        // function to submit the form after all validation has occurred            
        $scope.submitForm = function(isValid) {
          // check to make sure the form is completely valid
          if (isValid) {
            alert('our form is amazing');
          } 
        };  
      })
    </script>
    <!--==========================================================================-->

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
	
	UserViewBean user = (UserViewBean) session.getAttribute("userDetail");

	%>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>H</b>T</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><i>Harsha</i><b>TRUST</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>

     <div class="navbar-custom-menu">
       <ul class="nav navbar-nav">
      
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs "><%=user.getUserName() %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  <%=user.getUserName() %>
                 
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="managerProfile.jsp">Profile</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="managerChangepassword.jsp">Change Password</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="managerLogin.jsp">Sign out</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>

  <!-- =============================================== -->

  <!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Manager Name</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Id </a>
        </div>
      </div>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          
        </li>
         <li class="treeview">
          <a href="managerBaselineInfo.jsp">
            <i class="fa fa-laptop"></i> <span>Baseline Info</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li class="treeview">
          <a href="managerImpactArea.jsp">
            <i class="fa fa-files-o"></i><span>Impact Area</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
       
        </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       <b> CHANGE PASSWORD</b>
       </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Change Password</a></li>
      </ol>
    </section>
    <!--=================================================================================================-->
    <!-- Main content -->
    <section class="content">
        <div class="row-md-4">
          <!-- Widget: user widget style 1 -->
          <div class="box box-widget widget-user">
            <!-- Add the bg color to the header using any of the bg-* classes -->
            <div class="widget-user-header bg-black" style="background: url('dist/img/photo1.png') center center;">
              <h3 class="widget-user-username">Manager Name</h3>
              <h5 class="widget-user-desc">BBSR</h5>
            </div>
            <div class="widget-user-image">
              <img class="img-circle" src="dist/img/user3-128x128.jpg" alt="User Avatar">
            </div>
            
            <div class="box-footer">
              <div class="row">
                 <!--======donation row start=======-->
              <div class="col-md-2"></div>
              <div class="col-md-8">
          <!-- Horizontal Form -->
          <div class="box box-info">
            
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="ChangePassword" method="post"name="form" ng-app="validationApp" onsubmit="return regvalidate()"ng-controller="validationCtrl" novalidate>
              <div class="box-body">



                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Old Password:</label>

                  <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Enter your Old Password...." name="password" id="password"  autofocus ng-model="password" ng-minlength="3" ng-maxlength="20" required>
                    <!--===================================================================================================-->
                     <div>
                      <span style="color:red" ng-show="form.password.$error.required && form.password.$dirty">Password is required</span>
                      <span style="color:red" ng-show="!form.password.$error.required && (form.password.$error.minlength || form.password.$error.maxlength) && form.password.$dirty">Password must be in between 6 to 20 Characters.</span>
                      <!--
                      <span style="color:red" ng-show="!form.username.$error.required && !form.username.$error.minlength && !form.username.$error.maxlength && form.username.$error.pattern && form.username.$dirty">Username must contain alphabetic or numeric only</span>
                      -->
                     </div>
                    <!--===================================================================================================-->
                  </div>
                </div>



                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">New Password:</label>

                  <div class="col-sm-8">
                    <input type="text" class="form-control" placeholder="Enter your New Password....." name="newpassword" id="newpassword"  autofocus ng-model="newpassword" ng-minlength="3" ng-maxlength="20" required>
                    <!--================================================================================================-->
                    <div>
                      <span style="color:red" ng-show="form.newpassword.$error.required && form.newpassword.$dirty">Password is required</span>
                      <span style="color:red" ng-show="!form.newpassword.$error.required && (form.newpassword.$error.minlength || form.newpassword.$error.maxlength) && form.newpassword.$dirty">New Password must be in between 6 to 20 Characters.</span>
                      <!--
                      <span style="color:red" ng-show="!form.username.$error.required && !form.username.$error.minlength && !form.username.$error.maxlength && form.username.$error.pattern && form.username.$dirty">Username must contain alphabetic or numeric only</span>
                      -->
                     </div>
                    <!--=================================================================================================-->
                  </div>
                </div>


                 <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Retype Password:</label>

                  <div class="col-sm-8">
                    <input type="email" class="form-control" placeholder="Enter your Retype Password....."   name="retypepassword" id="retypepassword"  autofocus ng-model="retypepassword" ng-minlength="3" ng-maxlength="20" required>
                    <!--================================================================================================-->
                    <div>
                      <span style="color:red" ng-show="form.retypepassword.$error.required && form.retypepassword.$dirty">Password is required</span>
                      <span style="color:red" ng-show="!form.retypepassword.$error.required && (form.retypepassword.$error.minlength || form.retypepassword.$error.maxlength) && form.retypepassword.$dirty">Retype Password must be in between 6 to 20 Characters.</span>
                      <!--
                      <span style="color:red" ng-show="!form.username.$error.required && !form.username.$error.minlength && !form.username.$error.maxlength && form.username.$error.pattern && form.username.$dirty">Username must contain alphabetic or numeric only</span>
                      -->
                     </div>
                    <!--================================================================================================-->
                  </div>
                </div>
               <div class="col-md-2"></div>  
              <!-- /.box-body -->
              <div class="box-footer">
              <input type="hidden"  value="<%=user.getUserId() %>"/>
                <button  type="submit" class=" btn btn-primary  btn-block btn-flat" >OK</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>


                  <!--=========end donation row========-->
                  <!-- /.description-block -->
                </div>
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.widget-user -->
        </div>


    </section>
    <!--==============================================================================================-->
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

 <footer class="main-footer">
    <div class="pull-right hidden-xs">
    </div>
    <strong>Copyright &copy; 2016-2017 <a href="http://almsaeedstudio.com">Harsha Trust</a>.</strong> 
  </footer>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!--image slide-->

</body>
</html>