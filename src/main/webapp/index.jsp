<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 余人
  Date: 2021/11/28
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <%--    引入bootstrap--%>
    <%--    <link href="static/bootstrap/css/bootstrap-theme.min.css">--%>
    <%%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->


    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <base href="http://localhost:8080/ssm_crud/">
</head>
<body>

    <!-- 添加员工的模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >添加员工</h4>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="email_add_input" placeholder="email@joker.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <%-- 部门提交部门id  --%>
                                <select class="form-control" name="dId" id="dept_add_select">

                                </select>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_add_save_btn">提交</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改员工的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >修改员工</h4>
                </div>
                <div class="modal-body">

                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update_static"></p>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_add_input" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="email" name="email" class="form-control" id="email_update_input" placeholder="email@joker.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="M" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <%-- 部门提交部门id  --%>
                                <select class="form-control" name="dId" id="dept_update_select">

                                </select>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_update_save_btn">提交</button>
                </div>
            </div>
        </div>
    </div>



    <div class="container" >
        <%--     标题--%>
        <div class="row">
            <div class="col-md-12" >
                <h1>SSM-CRUD  jsp</h1>
            </div>
        </div>
        <%--    按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button id="emp_add_modal_btn" class="btn btn-primary">新增</button>
                <button class="btn btn-danger" id="del_emps_btn">删除</button>
            </div>
        </div>


        <%--    显示数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="emps_table">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all" >
                            </th>
                            <th>id</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <%--    显示页码--%>
        <div class="row">
            <%--分页信息--%>
            <div id="page_info_area" class="col-md-6"></div>
            <%--分页条--%>
            <div id="page_nav_area" class="col-md-6 "></div>
        </div>

        <script type="text/javascript" >


            var totalRecord,currentNum;

            <%--页面加载完成后发送Ajax请求--%>
            $(function (){
                //加载首页
                to_page(1);
            });

            function to_page(pn){
                $.ajax({
                    url:"${APP_PATH}/emps",
                    data:"pn="+pn,
                    type:"get",
                    success:function (result){
                        //解析json
                        build_emps_table(result);
                        //解析显示分页信息
                        build_page_info(result);
                        //解析分页条
                        build_page_nav(result);
                    }
                });
            }



            //解析查询信息
            function build_emps_table(result){

                //清空table表格
                $("#emps_table tbody").empty();

                var emps = result.extend.pageInfo.list;
                $.each(emps,function (index,item){
                    var checkTd = $("<td><input type='checkbox' class='check_item'></td>");
                    var empIdTd = $("<td></td>").append(item.empId);
                    var empNameTd = $("<td></td>").append(item.empName);
                    var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
                    var emailTd = $("<td></td>").append(item.email);
                    var deptNameTd = $("<td></td>").append(item.department.deptName);
                    var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                                    .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");

                    //添加一个自定义属性，表示员工id
                    editBtn.attr("empId",item.empId);


                    var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                                    .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
                    //添加一个自定义属性，表示员工id
                    delBtn.attr("empId",item.empId);

                    var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                    $("<tr></tr>").append(checkTd)
                        .append(empIdTd)
                        .append(empNameTd)
                        .append(genderTd)
                        .append(emailTd)
                        .append(deptNameTd)
                        .append(btnTd)
                        .appendTo("#emps_table tbody");
                })
            }
            //解析分页信息
            function build_page_info(result){
                //清空分页信息
                $("#page_info_area").empty();

                var total = result.extend.pageInfo.total;
                var pages = result.extend.pageInfo.pages;
                var pageNum = result.extend.pageInfo.pageNum;
                totalRecord =total;
                currentNum = pageNum;
                $("#page_info_area").append("当前"+pageNum+"页,总共"+pages+"页,总"+total+"条记录")
            }

            //构建导航条
            function build_page_nav(result){
                //清空导航条
                $("#page_nav_area").empty();

                var ul = $("<ul></ul>").addClass("pagination")
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
                var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
                if(result.extend.pageInfo.hasPreviousPage==false){
                    prePageLi.addClass("disabled");
                    firstPageLi.addClass("disabled");
                }else{
                    //为首页和上一页绑上单击事件
                    firstPageLi.click(function (){
                        to_page(1);
                    })
                    prePageLi.click(function (){
                        to_page(result.extend.pageInfo.pageNum - 1);
                    })
                }


                var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
                var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
                if(result.extend.pageInfo.hasNextPage == false){
                    nextPageLi.addClass("disabled");
                    lastPageLi.addClass("disabled");
                }else {
                    nextPageLi.click(function (){
                        to_page(result.extend.pageInfo.pageNum + 1)
                    })
                    lastPageLi.click(function (){
                        to_page(result.extend.pageInfo.pages);
                    })
                }

                ul.append(firstPageLi).append(prePageLi);

                $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
                    var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
                    if (result.extend.pageInfo.pageNum == item){
                        numLi.addClass("active")
                    }
                    //为导航条绑上单击事件
                    numLi.click(function (){
                        to_page(item);
                    })
                    ul.append(numLi);
                })
                ul.append(nextPageLi).append(lastPageLi);
                var navEle = $("<nav></nav>").append(ul);
                navEle.appendTo("#page_nav_area")
            }

            function reset_form(ele){
                $(ele)[0].reset();
                $(ele).find("*").removeClass("has-success has-error");
                $(ele).find(".help-block").text("");
            }

            $("#emp_add_modal_btn").click(function (){
                reset_form("#empAddModal form");

                //发送Ajax请求查出部门信息，显示在下拉列表中
                getDepts("#dept_add_select");

                //弹出模态框
                $("#empAddModal").modal({
                    backdrop:"static"
                });
            });

            function getDepts(ele){
                $(ele).empty();
                $.ajax({
                    url:"${APP_PATH}/depts",
                    type: "get",
                    success:function (result){
                        $.each(result.extend.depts,function (){
                            var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId)
                            optionEle.appendTo(ele);
                        })
                    }
                })
            }




            //给模态框中的提交按钮绑定单击事件
            $("#emp_add_save_btn").click(function (){
                //校验表单数据
                if (!validate_add_from()){
                    return false;
                }
                if ($(this).attr("ajax-va")=="error"){
                    return false;
                }
                //发送Ajax请求保存
                $.ajax({
                    url:"${APP_PATH}/emp",
                    type:"POST",
                    data: $("#empAddModal form").serialize(),
                    success:function (result){
                        if(result.code==100){
                            //关闭模态框
                            $("#empAddModal").modal('hide')
                            //跳转到尾页
                            to_page(totalRecord);
                        }else {
                            if (undefined!=result.extend.errorFields.email){
                                show_validate_msg("#email_add_input","error",result.extend.errorFields.email)
                            }
                            if (undefined!=result.extend.errorFields.empName){
                                show_validate_msg("#empName_add_input","error",result.extend.errorFields.eampName)
                            }
                        }
                    }
                })
            })


            //校验用户名是否可用
            $("#empName_add_input").change(function (){
                var empName = this.value;
                $.ajax({
                    url:"${APP_PATH}/checkEmpName",
                    type:"post",
                    data:"empName="+empName,
                    success:function (result){
                        if(result.code==100){
                            show_validate_msg("#empName_add_input","success","用户名可用")
                            $("#emp_add_save_btn").attr("ajax-va","success");
                        }else {
                            show_validate_msg("#empName_add_input","error","用户名不可用")
                            $("#emp_add_save_btn").attr("ajax-va","error");
                        }
                    }
                })
            });



            //校验表单的方法
            function validate_add_from (){
                var empName = $("#empName_add_input").val();
                var regName = /(^[A-Za-z0-9]{6,16}$)|(^[\u4e00-\u9fa5]{2,5}$)/;
                if(!regName.test(empName)){
                    show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合")
                    return false;
                }else {
                    show_validate_msg("#empName_add_input","success","");
                }

                var email = $("#email_add_input").val();
                var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                if (!regEmail.test(email)){
                    show_validate_msg("#email_add_input","error","邮箱格式不正确")
                    return false;
                }else{
                    show_validate_msg("#email_add_input","success","")
                }
                return true;
            }

            function show_validate_msg(ele,status,msg){
                $(ele).parent().removeClass("has-success has-error");
                $(ele).next("span").text("");
                if ("success"==status){
                    $(ele).parent().addClass("has-success");
                    $(ele).next("span").text(msg);
                }else if("error"==status){
                    $(ele).parent().addClass("has-error");
                    $(ele).next("span").text(msg);
                }
            }

            $(document).on("click",".edit_btn",function (){
                getDepts("#empUpdateModal select")
                getEmp($(this).attr("empId"));

                $("#emp_update_save_btn").attr("empId",$(this).attr("empId"));
                //弹出模态框
                $("#empUpdateModal").modal({
                    backdrop:"static"
                });
            })

            function getEmp(id){
                $.ajax({
                    url:"${APP_PATH}/emp/"+id,
                    type:"get",
                    success:function (result){
                        var empData = result.extend.emp;
                        $("#empName_update_static").text(empData.empName);
                        $("#email_update_input").val(empData.email);
                        $("#empUpdateModal input[name=gender]").val([empData.gender]);
                        $("#empUpdateModal select").val([empData.dId])
                    }
                })
            }

            //点击更新
            $("#emp_update_save_btn").click(function (){
                var email = $("#email_update_input").val();
                var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                if (!regEmail.test(email)){
                    show_validate_msg("#email_update_input","error","邮箱格式不正确")
                    return false;
                }else{
                    show_validate_msg("#email_update_input","success","")
                }
                $.ajax({
                    url:"${APP_PATH}/emp/"+$(this).attr("empId"),
                    type:"put",
                    data:$("#empUpdateModal form").serialize(),
                    success:function (result){
                        $("#empUpdateModal").modal("hide")
                        to_page(currentNum);
                    }
                })
            })

            //给表中的删除键绑定单击事件
            $(document).on("click",".del_btn",function (){

                var empName = $(this).parents("tr").find("td:eq(2)").text()
                var empId = $(this).attr("empId");
                if(confirm("确认删除["+empName+"]吗?")){
                    $.ajax({
                        url:"${APP_PATH}/emp/"+empId,
                        type:"delete",
                        success:function (result){
                            alert(result.msg);
                            to_page(currentNum);
                        }
                    })
                }
            })

            //全选不选
            $("#check_all").click(function (){
                var isChecked = $(this).prop("checked");
                $(".check_item").prop("checked",isChecked);
            });

            $(document).on("click",".check_item",function (){
                var flag=$(".check_item:checked").length==$(".check_item").length;
                $("#check_all").prop("checked",flag);
            })

            //点击批量删除
            $("#del_emps_btn").click(function (){
                if($(".check_item:checked").length==0){
                    alert("请选中要删除的员工")
                    return false;
                }
                var empNames="";
                var ids="";
                $.each($(".check_item:checked"),function (){
                    empNames += $(this).parents("tr").find("td:eq(2)").text()+","
                    ids += $(this).parents("tr").find("td:eq(1)").text()+"-";
                })
                ids = ids.substring(0,ids.length-1);
                empNames = empNames.substring(0,empNames.length-1);
                if(confirm("确认删除["+empNames+"]吗?")){
                    $.ajax({
                        url:"${APP_PATH}/emp/"+ids,
                        type:"delete",
                        success:function (result){
                            alert(result.msg);
                            to_page(currentNum);
                        }
                    })
                }
            })

        </script>
    </div>

</body>
</html>
