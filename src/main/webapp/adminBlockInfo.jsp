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
  <title>Harsha Trust | State Page</title>
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


  	<script type="text/javascript" src="pages/js/jquery-1.11.3-jquery.min.js"></script>
	<script type="text/javascript" src="pages/js/validation.min.js"></script>
    <script type="text/javascript" src="pages/js/updateblock.js"></script>

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
int blockId = Integer.parseInt(request.getParameter("blockId"));
System.out.println(blockId);
int counter = 0;
DBManager dbManager = new DBManager();
BlockBean block=DBHandler.getByBlockIdBlock(blockId, dbManager);
ArrayList<DistrictBean> districtBean=DBHandler.getAllDistrict(dbManager);
//System.out.println(districtBean.getDistrictCode());
//getByHouseholdId(householdDataId, dbManager);



%>

<body class="hold-transition skin-blue fixed sidebar-mini" ng-app="myApp1" ng-controller="myCtrl1">
<!-- Site wrapper -->


  
   
					<div class="box">
            <div class="box-header">
            </div>
            <!-- /.box-header -->
            <div class="jumbotron">
            <div class="box-body">
           
					  <form method="post" id="block-updateform" >
					<div class="col-sm-offset-3 col-sm-8">
										<span class='msg' id="error"></span>
								</div>
				
					    <label for="heading" class="col-sm-3 control-label">District Name</label>
					   <div class="col-sm-8">
           					<select class="form-control select2" name="districtId" id="districtId">  
						        						<% int i =0;
									while(i<districtBean.size()) {
										DistrictBean district = districtBean.get(i);
										counter++;
									%>
					     
					     		<option value="<%=district.getDistrictId()%>"><%=district.getDistrictName()%></option>
					 				<%
					 					i++;
										 }
									%>
							</select>  
           				</div>
           				
           				<br><br><br>
           				
					     <label for="heading" class="col-sm-3 control-label">Block Name</label>
					     	<div class="col-sm-8">
					     		<input type="text" class="form-control" name="blockName" id="blockName "value="<%=block.getBlockName()%>" >
					      	</div>
					      	
					      	<br><br><br>
					      	
					     <label for="heading" class="col-sm-3 control-label">Block Code</label>
					     	<div class="col-sm-8">
					     		<input type="text" class="form-control" name="blockCode" id="blockCode" value="<%=block.getBlockCode() %>" >
					     	</div>
					      
					      	
					 		 <input type="hidden" name="blockId" value=<%=block.getBlockId()%>>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-8">
								
								<br>
									<button type="submit" class="btn btn-primary pull-right" name="btn-update" id="btn-update">Update</button>
								</div>
							</div>
						</form>
			</div>
                  <!--=========end transactions row========-->
                  <!-- /.description-block -->
                </div>
              </div>
              <!-- /.row -->
           
         
<!-- ./wrapper -->


<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

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