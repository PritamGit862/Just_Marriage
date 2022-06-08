<%@page import="com.justmerriage.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.justmerriage.entities.Category"%>
<%@page import="com.justmerriage.entities.Category"%>
<%@page import="com.justmerriage.helper.ConnectionProvider"%>
<%@page import="com.justmerriage.entities.Message"%>
<%@page import="com.justmerriage.entities.Client" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Client client = (Client) session.getAttribute("currentUser");
    session.setAttribute("currentUser", client);
    if (client == null) {
        response.sendRedirect("login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 66% 96%, 39% 99%, 0 97%, 0 0);
            }
        </style>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light mb-1 w-100 p-4 primary-background" >
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"><span>Just_Merriage</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="userpage.jsp"><span class="fa fa-desktop"></span>Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#addproduct_Modal"><span class="fa fa-briefcase"></span>Upload_Item</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <span class="fa fa-meh-o"></span>View_Order
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <li><a class="dropdown-item" href="#">Booking</a></li>
                                            <li><a class="dropdown-item" href="#">Order </a></li>
                                            <li><hr class="dropdown-divider"></li>
                                            <li><a class="dropdown-item" href="#">Bill</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <ul class="navbar-nav mr-right">
                                    <li class="nav-item">
                                        <a href="#!" data-bs-toggle="modal" data-bs-target="#profile_model" class="btn text-white "><span class="fa fa-user-circle "></span><%= client.getName()%></a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="LogOutServlet" class="btn text-white "><span class="fa fa fa-user-times "></span>Log_Out</a>
                                    </li>
                                </ul>
                            </div>
                            </div>
                            </nav>


                            <%
                                Message msg = (Message) session.getAttribute("msg");
                                if (msg != null) {
                            %>
                            <div class="alert <%= msg.getCssClass()%> d-flex align-items-center" role="alert">
                                <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                                <div>
                                    <%= msg.getContent()%>
                                </div>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }
                            %>


                            <%--Main body of the page --%>
                            <main>
                                <div class="container">
                                    <div class="row mt-4">
                                        <%--First colom --%>
                                        <div class="col-md-4">
                                            <%--Category --%>
                                            <div class="list-group">
                                                <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
                                                    All Product
                                                </a>
                                                <%
                                                    ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
                                                    List<Category> c1 = dao.getAllCategory();
                                                    for (Category cat : c1) {
                                                %>
                                                <a href="#" class="list-group-item list-group-item-action"><%= cat.getcName()%></a>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </div>
                                        <%--Second colom --%>
                                        <div class="col-md-8" >
                                            <div id="loader" class="container text-center">
                                                <i class="fa fa-refresh fa-3x fa-spin"></i>
                                                <h3 class="mt-3">Loading.....</h3>
                                            </div> 
                                            <div class="container-fluid" id="productcontainer">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>
                            <%--EndMain body of the page --%>



                            <!-- Modal -->
                            <div class="modal fade" id="profile_model" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header primary-background text-white text-center">
                                            <h5 class="modal-title" id="staticBackdropLabel">Just_Merriage</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body ">
                                            <div class="container text-center">
                                                <img src="image/<%= client.getProfile()%>" class="img-fluid" style="border-radius: 50%;max-width: 100px;max-height: 120px;">

                                                <h5 class="modal-title" id="staticBackdropLabel"><%= client.getName()%></h5>
                                                <div id="profile_detail">
                                                    <table class="table">                                                    <tbody>
                                                            <tr>
                                                                <th scope="row">ID</th>
                                                                <td><%= client.getId()%></td>

                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Email</th>
                                                                <td><%= client.getEmail()%></td>
                                                            </tr>

                                                            <tr>
                                                                <th scope="row">Gender</th>
                                                                <td><%= client.getGender()%></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Shop_Name</th>
                                                                <td><%= client.getShopName()%></td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Shop_Address</th>
                                                                <td><%= client.getAddress()%></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <%-- Profile Edit --%>
                                                <div id="profile_edit" style="display: none">
                                                    <h3 class="mt-2">Please Edit Carefully</h3>
                                                    <form action="EditClientProfile" method="post" enctype="multipart/form-data">
                                                        <table class="table">
                                                            <tr>
                                                                <td>ID:</td>
                                                                <td><%= client.getId()%></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Name:</td>
                                                                <td><input type="text" class="form-control" name="user_name" value="<%= client.getName()%>"></td>
                                                            </tr>

                                                            <tr>
                                                                <td>Image_Name:</td>
                                                                <td><input type="text" class="form-control" name="user_profie" value="<%= client.getProfile()%>"></td>
                                                            </tr>


                                                            <tr>
                                                                <td>Email:</td>
                                                                <td><input type="email" class="form-control" name="user_email" value="<%= client.getEmail()%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Password:</td>
                                                                <td><input name="user_password" type="password" class="form-control" value="<%= client.getPassword()%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Shop_Name:</td>
                                                                <td><input type="text" class="form-control" name="shop_name" value="<%= client.getShopName()%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Shop_Address:</td>
                                                                <td><input type="text" class="form-control" name="address" value="<%= client.getAddress()%>"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Select profile:</td>
                                                                <td><input type="file" class="form-control" name="user_image" ></td>
                                                            </tr>
                                                        </table>
                                                        <div class="container">
                                                            <button type="submit" class="btn btn-outline-primary">Save</button>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button id="edit_profile" type="button" class="btn btn-primary">Edit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <%--Add do product Model  --%>


                            <!-- Modal -->
                            <div class="modal fade" id="addproduct_Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Provide Add Product details</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="addProductForm" action="AddProductServlet" method="post" enctype="multipart/form-data">

                                                <div class="form-group">
                                                    <select class="form-control" name="cid">
                                                        <option selected disabled>Select_Category</option>
                                                        <%
                                                            ProductDao dao1 = new ProductDao(ConnectionProvider.getConnection());
                                                            List<Category> list = dao1.getAllCategory();
                                                            for (Category c : list) {
                                                        %>
                                                        <option value="<%= c.getcId()%>"><%= c.getcName()%></option>

                                                        <%
                                                            }
                                                        %>                                                         
                                                    </select>
                                                </div>

                                                <div class="form-group">
                                                    <input type="text" name="title" placeholder="Enter product title" class="form-control"/>
                                                </div>
                                                <div class="form-group">
                                                    <textarea name="discription" class="form-control" placeholder="Enter Description"></textarea>    
                                                </div>
                                                <div class="form-group">
                                                    <input type="text" name="amount" placeholder="Enter product Amount" class="form-control"/>
                                                </div>
                                                <div class="form-group">
                                                    <input type="file" name="image" class="form-control" placeholder="Select image of product" ></textarea>    
                                                </div>
                                                <br>
                                                <div class="container text-center">
                                                    <button type="subit" class="btn btn-outline-primary">Add_Product</button>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                                        </div>
                                    </div>
                                </div>
                            </div>                          
                            <%--End do post Model  --%>




                            <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>     
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
                            <script src="js/myjs.js" type="text/javascript"></script>
                            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                            <script>
                                $(document).ready(function () {
                                let editStatus = false;
                                $('#edit_profile').click(function () {
                                //alert("Button Clicked");
                                if (editStatus === false) {
                                $('#profile_detail').hide();
                                $('#profile_edit').show();
                                editStatus = true;
                                $(this).text("Back");
                                } else {
                                $('#profile_detail').show();
                                $('#profile_edit').hide();
                                editStatus = false;
                                $(this).text("Edit");
                                }
                                });
                                });
                            </script>
                            <%--add new Product --%>
                            <script>
                                $(document).ready(function (e){
                                $("#addProductForm").on("submit", function (event){
                                //This code gets called when from is subit
                                event.preventDefault();
                                //console.log("Clinked Subit");
                                let form = new FormData(this);
                                //now requesting  to server
                                $.ajax({
                                url: "AddProductServlet",
                                        type: 'POST',
                                        data: form,
                                        success: function (data, textStatus, jqXHR){
                                        console.log(data);
                                        if (data.trim() == "done"){
                                        swal("Good job!", "Product is added!", "success");
                                        }
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                        //  console.log("aaaaaa");
                                        swal("Error!", "Something went wrong!", "error");
                                        },
                                        processData: false,
                                        contentType: false
                                });
                                });
                                });
                            </script>

                            <%-- Loading Productusing ajx--%>
                            <script>
                                function getProducts(){
                                $.ajax({
                                url:"LoadProduct.jsp",
                                        success: function (data, textStatus, jqXHR) {
                                        console.log(data);
                                        $("#loader").hide();
                                        $("#productcontainer").html(data);
                                        }
                                });
                                }
                                $(document).ready(function (e){

                                });
                            </script>    
                            </body>
                            </html>
