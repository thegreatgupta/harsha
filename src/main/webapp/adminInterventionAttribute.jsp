<%@ page import="com.harsha.app.bean.*" %>
<%@ page import="com.harsha.app.database.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
  
  	 <jsp:directive.include file="pages/include/admin_head.jsp"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
<script type="text/javascript" src="pages/js/jquery-1.11.3-jquery.min.js"></script>
<script type="text/javascript" src="pages/js/validation.min.js"></script>
    <script type="text/javascript" src="pages/js/interventionattribute.js"></script>
   
	
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
	int counter=0;
	UserViewBean user = (UserViewBean) session.getAttribute("userDetail");
	DBManager dbManager=new DBManager();
	ArrayList<ProjectBean> allProject = DBHandler.getAllProject(dbManager);
	ArrayList<ProjectDataBean> allProjectAttribute = DBHandler.getAllProjectAttributes(dbManager);

	ArrayList<ProjectTypeBean> allProjectType = DBHandler.getAllProjecttype(dbManager);
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
                  <h3 class="box-title">Intervention Attribute Information</h3>
                  <!-- MODAL BUTTON -->
                  
                   <button class="btn btn-primary btn-xs pull-right" data-toggle="modal" data-toggle="tooltip" title="Add New Intervention Attribute" data-target="#myModal"> <span class="glyphicon glyphicon-plus"></span></button>
               		  
               		  <!-- MODAL STARTS HERE -->
               		<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><b>Add New Intervention Attribute</b></h4>
				</div>

				<div class="modal-body">
					<div class="panel-body" id="afterinsertingheading">
							<div class="form-group">
								<form method="post" id="projectattribute-form" >
								<div class="col-sm-offset-3 col-sm-8">
										<span class='msg' id="error"></span>
								</div>
								<label for="heading" class="col-sm-3 control-label">Intervention Type </label>
            								<div class="col-sm-8">
           										 <select class="form-control select2" name="projectTypeId" id="projectTypeId">  
           							 				<%
														int j =0;
														while(j<allProjectType.size()) {
															ProjectTypeBean projecttypebean = allProjectType.get(j);
														counter++;
													%>
									    		<option value="<%=projecttypebean.getProjectTypeId() %>"><%=projecttypebean.getProjectTypeName() %></option>
            			           					<%
            			           						j++;
														}
								   					%>
           										</select>  
           									</div>
							
								<br><br><br>
								<label for="heading" class="col-sm-3 control-label">Intervention Attribute</label>
								<div class="col-sm-8">
									<input type="text" class="form-control" name="attributeName" id="attributeName" placeholder="Intervention Attribute Name">
								</div>
							
								<br><br><br>
							
								<label for="heading" class="col-sm-3 control-label">Display Sequence</label>
								<div class="col-sm-8">
           										 <select class="form-control select2" name="displaySequence" id="displaySequence">  
           							 				<%
														for(int k =1;k<=10;k++){
													%>
									    		<option><%=k %></option>
            			           					<%
            			           					}
								   					%>
           										</select>  
           									</div>
							
							
								<br><br><br>
								<label for="heading" class="col-sm-3 control-label">Fixed Value</label>
								<div class="col-sm-3">
									 <select class="form-control select2" name="fixedValue" id="fixedValue" >
									 	<option value="0">Yes</option>
									 	<option value="-1">No</option>
									 </select>
								</div>
								<label for="heading" class="col-sm-2 control-label">Status</label>
								<div class="col-sm-3">
									 <select class="form-control select2" name="status" id="status" >
									 	<option value="0">Active</option>
									 	<option value="-1">Inactive</option>
									 </select>
								</div>
							
							
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-8">
								
								<br>
									<button type="submit" class="btn btn-primary pull-right" name="btn-projectattribute" id="btn-projectattribute">Add</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
			</div>
	</div>
</div> 
  					 <!-- MODAL ENDS HERE -->
  					
  					 <!-- MODAL ENDS HERE -->
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
					<tr>
                       <th align="center">Intervention Type </th>
                       <th align="center">Intervention Type Name</th>
                       <th align="center">Display Sequence</th>
                       <th align="center">Edit</th>
					  </tr>
                    </thead>
                    <tbody>
                     <%
						int i =0;
						while(i<allProjectAttribute.size()) {
							ProjectDataBean project = allProjectAttribute.get(i);
							i++;
						%>
						<tr>
							<td ><%=project.getProjectTypeName() %></td>
							<td ><%=project.getAttributeName()%></td>
							<td ><%=project.getDisplaySequence()%></td>
							
							<td> 
								<input type="hidden" id="<%=i %>" value="<%=project.getProjectAttributeId()%>"/>
								<span class="glyphicon glyphicon-edit pull-right" onclick="myFunction1('<%=i%>')"></span>
       						</td>
							
							
							</tr>
							<% } %>	
                    </tbody>
                    <tfoot>
                      <tr>
                       <th align="center">Intervention Type </th>
                       <th align="center">Intervention Type Name</th>
                       <th align="center">Display Sequence</th>
                       <th align="center">Edit</th>
                     </tr>
                    </tfoot>
                  </table>
                   <script>
			    function myFunction1(ur)
			    {
			    	var myWindow = window.open("adminInterventionAttributeInfo.jsp?projectAttributeId="+document.getElementById(ur).value,"", "width=800, height=800");
			    	
			    }
			    </script>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          <!-- Your Page Content Here -->

        </section><!-- /.content -->

        <!-- Main content -->
        
      </div><!-- /.content-wrapper -->

      <jsp:directive.include file="pages/include/manager_footer.jsp"/>
    <!-- REQUIRED JS SCRIPTS -->
	<!-- <script>
	    function myFunction1(ur){
	    	var myWindow = wsindow.open("managerBaselineinformation.jsp?householdDataId="+document.getElementById(ur).value,"", "width=1000, height=600");
	    }
	</script> -->
  
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
