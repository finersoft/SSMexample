<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径，
不以/开始的相对路径，找资源，以当前资源的路径为基准
以/开始的相对路径，找资源，以服务器的路径为标准 
src一般为http：//localhost：3306/xiaofan，（项目名）
-->


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>

<%--  <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script> --%>
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<!-- 员工修改的模态框-->

<!-- Modal -->
<div class="modal fade" id="empupdatemodal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">员工修改</h4>
			</div>
			<div class="modal-body">

				<!-- 弹窗提示框显示的页面开始,Spring自动封装form提交对象，要求name和Bean中名字一样 -->
				<form class="form-horizontal">
				
					<div class="form-group">
						<label class="col-sm-2 control-label">empName</label>
						<div class="col-sm-10">
						<p class="form-control-static" id="empName_update"></p>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">email</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="email_update"
								placeholder="email" name="workerEmail">
							<span  class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">gender</label>
						<div class="col-sm-10">
							<label class="radio-inline"> <input type="radio"
							id="gender1_update" value="M" name="workerGender">
								男
							</label> <label class="radio-inline"> <input type="radio"
							 id="gender2_update" value="W" name="workerGender">
								女
							</label>
                          </div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">deptName</label>
						<div class="col-sm-10">
						<!-- 部门提交ID ,可以通过ID，也可以通过modal寻找-->
							<select class="form-control" name="dId" > 
							
							</select>
						</div>
					</div>

					
				</form>
			</div>
			<!-- 弹窗提示框显示的页面结束 -->



			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
			</div>
		</div>
	</div>
</div>


<!-- 员工添加的模态框-->

<!-- Modal -->
<div class="modal fade" id="empAddmodal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">添加员工</h4>
			</div>
			<div class="modal-body">

				<!-- 弹窗提示框显示的页面开始,Spring自动封装form提交对象，要求name和Bean中名字一样 -->
				<form class="form-horizontal">
				
					<div class="form-group">
						<label class="col-sm-2 control-label">empName</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="empName_add"
								placeholder="empName" name="workerName">
						<span  class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">email</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="email_add"
								placeholder="email" name="workerEmail">
							<span  class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">gender</label>
						<div class="col-sm-10">
							<label class="radio-inline"> <input type="radio"
							id="gender1_add" value="M" name="workerGender">
								男
							</label> <label class="radio-inline"> <input type="radio"
							 id="gender2_add" value="W" name="workerGender">
								女
							</label>
                          </div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">deptName</label>
						<div class="col-sm-10">
						<!-- 部门提交ID ,可以通过ID，也可以通过modal寻找-->
							<select class="form-control" name="dId" > 
							
							</select>
						</div>
					</div>

					
				</form>
			</div>
			<!-- 弹窗提示框显示的页面结束 -->



			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
			</div>
		</div>
	</div>
</div>


<body font-size="12px">

	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_bn">新增</button>
				<button class="btn btn-danger" id="delete_all_bn">删除</button>
			</div>
		</div>
		<!-- 显示表格信息 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
						    <th>
						    <input type="checkbox" id="check_all" />
						    </th>
							<th>序号</th>
							<th>Name</th>
							<th>Gender</th>
							<th>Email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>


				</table>
			</div>
		</div>
		<!-- 显示分页信息-->
		<div class="row">
			<!-- 分页文字信息，6列-->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息-->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>

	</div>
	
	<script type="text/javascript">
	
	//标志总记录数
	 var totalRecord,currentPage;
		//页面加载完成以后，发送一个ajax请求，得到分页数据
		$(function() {
			//去首页
			to_page(1);
		});
		
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_workers_table(result);

					//2.解析并显示分页信息
					build_page_info(result);
					//3.显示分页条信息
					build_page_nav(result);

				}
			});

		}

        /*=============解析员工数据，并添加到列表下面，形成完整列表模式框架==========*/
		function build_workers_table(result) {
			//清空表格数据
			$("#emps_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			//jquery遍历方法each，emps第一个遍历的元素,item当前对象
		    //此处要对照JSON数据，获取到员工的list
		    //item.*读取bean中数据
			$.each(emps, function(index, item) {
				var checkBoxTD=$("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.workerId);
				var empNameTd = $("<td></td>").append(item.workerName);
				var GenderTd = $("<td></td>").append(item.workerGender == 'M' ? "男" : "女");
				var EmailTd = $("<td></td>").append(item.workerEmail);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
				var editBtn = $("<button></button>").addClass("btn btn-primary  btn-sm edit_btn").append($("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前员工。赋值给edit-id
				editBtn.attr("edit-id",item.workerId);
				var delBth = $("<button></button>").addClass(
						"btn btn-danger  btn-sm delete_btn").append(
						$("<span></span>")
								.addClass("glyphicon glyphicon-trash")).append(
						"删除");
				//为删除按钮添加一个自定义的属性，来表示当前员工。赋值给edit-id
				delBth.attr("del-id",item.workerId);
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(
						delBth);
				//append方法执行完以后还是返回原来的元素，所以可以不停使用append方法添加内容
				$("<tr></tr>").append(checkBoxTD).
				append(empIdTd).
				append(empNameTd).
				append(GenderTd).
				append(EmailTd).
				append(deptNameTd).
				append(btnTd).
				appendTo("#emps_table tbody");
				/* <button class="btn btn-primary  btn-sm">
				<span class="glyphicon glyphicon-pencil " aria-hidden="true"></span>
				编辑
				</button> */

			});

		}
		  /*======================解析页面左下角的信息=======================*/
		//2.解析并显示分页信息,列出
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前" + result.extend.pageInfo.pageNum + "页,总"
							+ result.extend.pageInfo.pages + "页 ,总"
							+ result.extend.pageInfo.total + "条记录");
			totalRecord=result.extend.pageInfo.total;
		    currentPage= result.extend.pageInfo.pageNum;
		}
		//3.显示分页条信息,点击跳转下一页
		/*===========用于解析右下角的分页条，创建分页条，并实现跳转功能=========*/
		/* 	<!-- 分页条信息-->
				<div class="col-md-6">
					<nav aria-label="Page navigation">
					<ul class="pagination">
				<li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
			 <li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}"
		aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
		 */
		function build_page_nav(result) {
			//page_nav_area
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");

			//构建元素
			var firstPageli = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageli = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageli.addClass("disabled");
				prePageli.addClass("disabled");
			} else {
				//为元素添加点击事件
				firstPageli.click(function() {

					to_page(1);

				});
				prePageli.click(function() {
					//当前页面减一
					to_page(result.extend.pageInfo.pageNum - 1);

				});

			}

			var nextPageli = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageli = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageli.addClass("disabled");
				lastPageli.addClass("disabled");
			} else {
				nextPageli.click(function() {
					//当前页面减一
					to_page(result.extend.pageInfo.pageNum + 1);

				});
				lastPageli.click(function() {
					//当前页面减一
					to_page(result.extend.pageInfo.pages);

				});

			}

			//添加首页和前一页的提示
			ul.append(firstPageli).append(prePageli);
			
			//遍历页码号1，2，3
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					   //让当前页面高亮
					numLi.addClass("active");
				}
				numLi.click(function() {

					to_page(item);
				});
				ul.append(numLi);
			});
			
			//添加下一页和末页的提示
			ul.append(nextPageli).append(lastPageli);
			//把url加入
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		 
		 //表单重置方法
		 function reset_form(ele){
			 $(ele)[0].reset();
			 $(ele).find("*").removeClass("has-error has-success");
			 $(ele).find(".help_block").text("");
		 }
		 
		 //点击新增按钮弹出模态框
		$("#emp_add_modal_bn").click(function() {
			//清空表单数据（表单完整重置，表单数据，表单样式）,取出form对象
			//$("#empAddmodal form")[0].reset();
			reset_form("#empAddmodal form");
			//发送ajax请求，查出部门信息，显示在下拉列表中
			getDepts("#empAddmodal select");
			//打开模态框，$("#id").modal
			$("#empAddmodal").modal({
				backdrop : "static"
			});

		});
		 
		 //查出所有的部门信息并显示在下拉列表中
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				url : "${APP_PATH}/depts",
				type : "GET",
				success : function(result) {
                  $.each(result.extend.depts,function() {
						var optionEle = $("<option></option>").append(
								this.deptName).attr("value", this.deptId);
						optionEle.appendTo(ele);
					});

				}
			});
		}
		 
		//校验表单数据
		function validate_add_form() {
			//1.拿到要校验的数据，使用正则表达式
			var empName = $("#empName_add").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9fff]{2,5})/;
			if (!regName.test(empName)) {
				//alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
				//bootstrap校验，给父标签加上has-error
				//	$(ele).parent().addClass("has-error");
				//  $(ele).next("span").text(msg);
				show_validate_msg("#empName_add","error","前端验证：用户名可以是2-5位中文或者6-16位英文和数字的组合");

			
				return flase;
			}else{

				 show_validate_msg("#empName_add","success","");
			
			}
            //2.检验邮箱
            
		    var email = $("#email_add").val();
			var regemail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if (!regemail.test(email)) {
				//alert("邮箱格式不正确");
				//应该清空这个元素之前的样式
				//$("#email_add").parent().addClass("has-error");
				//$("#email_add").next("span").text("邮箱格式不正确");
             	show_validate_msg("#email_add","error","邮箱格式不正确");
				return flase;
			} else {
				//$("#email_add").parent().addClass("has-success");
				//$("#empName_add").next("span").text("邮箱格式不正确");
	
			    show_validate_msg("#email_add","success","");
			}
			return true;
		}
		 /*=======================封装检验重复的方法，便于多处引用===============================*/
        //显示校验结果的提示信息，抽象成方法
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			 $(ele).parent().removeClass("has-success has-error");
			 $(ele).next("span").text("");
			 
			if("success"==status)
			{
				 $(ele).parent().addClass("has-success");
				 $(ele).next("span").text(msg);
			}else if("error"==status)
			{
				 $(ele).parent().addClass("has-error");
				 $(ele).next("span").text(msg);
			}
		}
		
        $("#empName_add").change(function(){
        	//发送ajax请求检验用户名是否可用
        	var empName=this.value;
        	$.ajax({
        		url:"${APP_PATH}/checkuser",
        		data:"empName="+empName,
        		type:"POST",
        		success:function(result){
        			if(result.code==100)
        			{//result为MSG
        				show_validate_msg("#empName_add","success","前端验证：用户名可用");
        				$("#emp_save_btn").attr("ajax-va","success");
        			}
        			else{
        				show_validate_msg("#empName_add","error",result.extend.va_msg);
        				$("#emp_save_btn").attr("ajax-va","error");
        			}
        		}
        	});
        	
        });
        
		//点击保存，保存员工信息
      $("#emp_save_btn").click(function() {
			//1.模态框的表单数据提交给服务器进行保存
			//先对要提交给服务器的数据进行校验
		if (!validate_add_form()) {
              	return false;
			}; 
			//判断用户名是否成功，在保存中添加ajax-va属性并赋值
			if ($(this).attr("ajax-va") == "error") {
				return false;
			}
			//2.发送ajax请求保存员工,serialize表示序列化方法,将填入数据序列化
			//$("#empAddmodal form").serialize();
			//添加数据后，跳转到最后一页
			$.ajax({
				url : "${APP_PATH}/emp",
				type : "POST",
				data : $("#empAddmodal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					if(result.code==100){
						//当员工保存工作
						//1.关闭模态框
						$("#empAddmodal").modal('hide');
						//2.来到最后一页，显示刚才保存的数据
						//发送ajax请求显示最后一页数据即可,总记录数肯定大于页数
						  //发送ajax请求显示最后一页数据即可
                          //此处利用pagehelper中，如果跳转的页面数大，则自动访问最后一页
						to_page(totalRecord);
					}
		         else {
						//显示失败信息
						//console.log(result);
						//如果有哪个字段的错误信息就显示哪个字段
						if (undefined == result.extend.erroFiled.workerEmail) {
							//显示邮箱错误信息
							show_validate_msg("#email_add","error",result.extend.erroFiled.workerEmail);
						}
						if (undefined == result.extend.erroFiled.workerName) {
							//显示用户错误信息
							show_validate_msg("#empName_add","error",result.extend.erroFiled.workerName);
						}

					}

				}
			});

		});
		
		
		//1.我们是按钮之前就绑定了click，所以绑定不上(表单页面是由ajax构建)
		//1.可以在创建按钮的时候绑定事件 2.绑定单机.live方法（可以为后来的元素绑定事件）
		//jquery新版已删除live，只有on
		$(document).on("click",".edit_btn",function(){
			//alert("edit");
		  
			//1.查出部门信息，并显示部门列表
			
			getDepts("#empupdatemodal select");
		
			//2.查出员工信息，显示员工信息,传入ID
		    getEmp($(this).attr("edit-id"));
			
			//3.把员工ID传递给模态框的更新按钮
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
			
			$("#empupdatemodal").modal({
				backdrop : "static"
			});

		
		});
		function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"GET",
				success:function(result){
					//console.log(result);
					var empData=result.extend.emp;
					$("#empName_update").text(empData.workerName);
					$("#email_update").val(empData.workerEmail);
					$("#empupdatemodal input[name=workerGender]").val([empData.workerGender]);
					$("#empupdatemodal select").val([empData.dId]);
				}
				
			});
			
		}
		
		
		//点击更新，更新员工信息
		$("#emp_update_btn").click(function() {
							//1.验证邮箱是否合法
							var email = $("#email_update").val();
							var regemail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
							if (!regemail.test(email)) {
								show_validate_msg("#email_update", "error",
										"邮箱格式不正确");
								return flase;
							} else {
							show_validate_msg("#email_update", "success", "");
							}
							
							//2.发送ajax请求保存更新员工数据，没有配置HttpPutFormContentFilter时采用以下方法
							/* $.ajax({
						    //从controller中获取参数，从页面取得元素赋值，将更新按钮带的id传入
							url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),	
						    type:"POST",
						    data:$("#empupdatemodal form").serialize()+'&_method=PUT',
						    success:function(result){
						    	 alert(result.msg);
						    }
						    
							}); */
							//jquery直接发送put请求
							$.ajax({
							    //从controller中获取参数，从页面取得元素赋值，将更新按钮带的id传入
								url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),	
							    type:"PUT",
							    data:$("#empupdatemodal form").serialize(),
							    success:function(result){
							    	// alert(result.msg);
							    	//1.关闭对话框
							     $("#empupdatemodal").modal("hide");
							   
							    	//2.回到本页面
							    	to_page(currentPage);
							    }
							    
								});
							
		});
		
        //单个删除元素
		$(document).on("click",".delete_btn",function(){
			//1.弹出是否确认删除对话框
            //弹出ID
			//alert($(this).parents("tr").find("td:eq(1)").text());
			var empName=$(this).parents("tr").find("td:eq(2)").text();
			//获取del-id
			var empID=$(this).attr("del-id");
			if(confirm("确认删除["+empName+"]"))
			{//确认,发送ajax请求删除即可
				$.ajax({
					url:"${APP_PATH}/emp/"+empID,
					type:"DELETE",
					success:function(result)
					{
						//alert(result.msg);
						to_page(currentPage);
					}
				});
				
			}
	});
     //完成全选/全不选功能
     $("#check_all").click(function(){
    	 //attr获取checked是undefined，
    	 //我们这些dom原生的属性用prop获取读取，用attr获取自定义属性的值
    	 //alert($(this).prop("checked"));
    	 $(".check_item").prop("checked",$(this).prop("checked"));
     });
     $(document).on("click",".check_item",function(){
    	 //判断当前选择中的元素是否五个
    var flag=$(".check_item:checked").length==$(".check_item").length
      $("#check_all").prop("checked",flag);
    	 
    	 
     }); 
   //点击全部删除
   $("#delete_all_bn").click(function(){
	   var empNames="";
	   var del_idstr="";
	   $.each($(".check_item:checked"),function(){
		   //组装员工名字字符串
		   empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
		   //组装员工ID
		   del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
	   });
	   //删除最后一个","
	   empNames=empNames.substring(0,empNames.length-1);
	  //删除最后一个"-"
	  del_idstr=del_idstr.substring(0,del_idstr.length-1);
	   if(confirm("确认删除【"+empNames+"】吗？")){
		   //发送ajax请求
		   $.ajax({
				url:"${APP_PATH}/emp/"+del_idstr,
				type:"DELETE",
				success:function(result)
				{
					//alert(result.msg);
					to_page(currentPage);
				}
			});
	   }
	   
   });
   
	</script>
</body>
</html>