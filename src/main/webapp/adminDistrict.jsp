<%@ page import="com.harsha.app.bean.*" %>
<%@ page import="com.harsha.app.database.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
  	

  	<jsp:directive.include file="pages/include/admin_head.jsp"/>
  	
		<script type="text/javascript" src="pages/js/jquery-1.11.3-jquery.min.js"></script>
		<script type="text/javascript" src="pages/js/validation.min.js"></script>
    <script type="text/javascript" src="pages/js/district.js"></script>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script>
		function assigncourse(id,slot,day,course) {
		 
		  if (id=="") {
			document.getElementById("msg").innerHTML="";
			return;
		  } 
			  
		 
		if (window.XMLHttpRequest) {
			// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		  } else { // code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		  xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
			  document.getElementById("msg").innerHTML=xmlhttp.responseText;
			}
		  }
		  xmlhttp.open("GET","assigning_course.php?id="+id+"&slot="+slot+"&day="+day+"&course="+course,true);
		  xmlhttp.send();
		  
		  }
	</script>
	
  
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
	int counter = 0;
	DBManager dbManager = new DBManager();
	ArrayList<DistrictBean> allDistrict = DBHandler.getAllDistrict(dbManager);
	ArrayList<StateBean> allState = DBHandler.getAllState(dbManager);
	%>
  <body class="hold-transition skin-blue sidebar-mini" onload='display_ct();'>
    <div class="wrapper">

       <jsp:directive.include file="pages/include/admin_header.jsp"/>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Welcome
            
          </h1>
          <ol class="breadcrumb">
            <li><span id='ct' ></span></li>
            
          </ol>
        </section>
        <!-- Main content -->
        <section class="content">
			<div class="box">
                <div class="box-header">
                  <h3 class="box-title">District Information</h3>
                  <button class="btn btn-primary btn-xs pull-right" data-toggle="modal"  data-toggle="tooltip" data-target="#myModal" title="Add New District"> <span class="glyphicon glyphicon-plus"></span></button>
                 <!-- MODAL STARTS HERE -->
               		<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b>Add New District</b></h4>
				</div>

				<div class="modal-body">
					<div class="panel-body" id="afterinsertingheading">
							<div class="form-group">
								<form method="post" id="district-form">
									<div class="col-sm-offset-3 col-sm-8">
										<span class='msg' id="error"></span>
									</div>
								  		<label for="heading" class="col-sm-3 control-label">State Name: </label>
            								<div class="col-sm-8">
           										<select class="form-control select2" name="stateId" id="stateId">  
           							 				<%
														int j =0;
														while(j<allState.size()) {
														StateBean state = allState.get(j);
														counter++;
													%>
									    		<option value="<%=state.getStateId() %>"><%=state.getStateName() %></option>
            			           					<%
            			           						j++;
														}
								   					%>
           										</select>
           									</div>
           						<br><br><br>
								<label for="heading" class="col-sm-3 control-label">District Name</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="districtName" id="districtName" placeholder="District Name">
								</div>
							
								<br><br><br>
							
							
								<label for="heading" class="col-sm-3 control-label">District code</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="districtCode" id="districtCode" placeholder="District Code">
								</div>
							
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-8">
								<br>
									<button type="submit" class="btn btn-primary pull-right" name="btn-district" id="btn-district">Add</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
			</div>
	</div>
</div> 
  					 <!-- MODAL ENDS HERE -->
               
               
               
               
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
					<tr>
                      <th align="center">State Name</th>
					  <th align="center">State Code</th>
					  <th align="center">District Name</th>
					  <th align="center">District Code</th>
					  <th align="center">Edit</th>
					  </tr>
                    </thead>
                    <tbody>
                      <%
						 int i =0;
						while(i<allDistrict.size()) {
							DistrictBean district = allDistrict.get(i);
							i++;
						%>
						<tr>
							<td ><%=district.getStateName() %></td>
							<td ><%=district.getStateCode() %></td>
							<td ><%=district.getDistrictName() %></td>
							<td ><%=district.getDistrictCode() %></td>
							<td> 
								<input type="hidden" id="<%=i%>" value="<%=district.getDistrictId() %>"/>
							<%System.out.print(district.getDistrictId()); %>
         							 <span class="glyphicon glyphicon-edit" onclick="myFunction1('<%=i%>')"></span>
       							</td>
							</tr>
							<% } %>	
                    </tbody>
                    <tfoot>
                      <tr>
                     	<th align="center">State Name</th>
					  	<th align="center">State Code</th>
					  	<th align="center">District Name</th>
					 	<th align="center">District Code</th>
					    <th>o</th>
                      	</tr>
                    </tfoot>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          <!-- Your Page Content Here -->

        </section><!-- /.content -->

        <!-- Main content -->
        
      </div><!-- /.content-wrapper -->

      <jsp:directive.include file="pages/include/admin_footer.jsp"/>
    <!-- REQUIRED JS SCRIPTS -->
	<script>
			    function myFunction1(ur)
			    {
			    	var myWindow = window.open("adminDistrictInfo.jsp?districtId="+document.getElementById(ur).value,"", "width=600, height=450");
			    	
			    }
			    </script>
 
    <!-- Bootstrap 3.3.5 -->

	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
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
