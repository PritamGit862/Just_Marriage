<%-- 
    Document   : register
    Created on : 28 Apr, 2022, 9:37:58 PM
    Author     : Dell
--%>
<%@page import="com.justmerriage.servlet.RegisterServlet" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
        <%@include file="navbar1.jsp" %>
        <main id="register" style="height:160vh" class="d-flex align-item-center primary-background banner-background" style="height:150vh;padding-bottom:20vh;padding-top:10vh;">
            <div class="container" >
                <div class="col-md-6 offset-md-3"  >
                    <%-- Register card--%>
                    <div id="registercard" class="card" >
                        <div class="card-header text-center primary-background" style="background: lightsalmon">
                            <span class="fa fa-3x fa-user-plus"></span>
                            <p>Register Here</p>
                        </div>
                        <div class="card-body">
                            <form id="register_form" action="RegisterServlet" method="POST">

                                <div class="mb-3">
                                    <label for="user_name" class="form-label">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter Name" >
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input  name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
                                </div>

                                <div class="mb-3">
                                    <label for="user_gender" class="form-label">Select Gender</label>    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="user_gender" id="user_gender" value="male">
                                        <label class="form-check-label" for="user_gender">
                                            Male
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="user_gender" id="user_gender" value="female">
                                        <label class="form-check-label" for="user_gender">
                                            Female
                                        </label>
                                    </div>
                                </div>
                                <hr>
                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms&condition</label>
                                </div>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please_Wait</h4>
                                </div>
                                <div class="container text-center mb-3" id="otp" style="display: none">
                                    <label for="exampleInputPassword1" class="form-label">Enter OPT</label>
                                    <input  name="userotp" type="text" class="form-control"  placeholder="Enter OTP">
                                </div>
                                <input  name="post" type="hidden" class="form-control" value="user">
                                <br>
                                <button id="submit_btn" type="submit" class="btn btn-primary ">SignUp</button>
                            </form>
                        </div>


                        <div class="card-footer">
                            <button id="bussness_button" type="submit" class="btn btn-primary">Click Here for bussness account</button> 
                        </div>
                    </div>
                    <%-- End Register card--%>

                    <%-- Bussness card--%>
                    <div id="bussnesscard" class="card" style="display: none">
                        <div class="card-header text-center primary-background" style="background: lightsalmon">
                            <span class="fa fa-3x fa-user-plus"></span>
                            <p>Register Here for bussness account</p>
                        </div>
                        <div class="card-body">
                            <form id="register_client" action="RegisterServlet" method="POST">

                                <div class="mb-3">
                                    <label for="user_name" class="form-label">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter Name" >
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="shop_name" class="form-label">User Shop Name</label>
                                    <input name="shop_name" type="text" class="form-control" id="shop_name" placeholder="Enter Your Shop Name" >
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input  name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
                                </div>

                                <div class="mb-3">
                                    <label for="user_gender" class="form-label">Select Gender</label>    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="user_gender" id="user_gender" value="male">
                                        <label class="form-check-label" for="user_gender">
                                            Male
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="user_gender" id="user_gender" value="female">
                                        <label class="form-check-label" for="user_gender">
                                            Female
                                        </label>
                                    </div>
                                </div>
                                <hr>
                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms&condition</label>
                                </div>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please_Wait</h4>
                                </div>
                                <div class="container text-center mb-3" id="clientotp" style="display: none">
                                    <label for="exampleInputPassword1" class="form-label">Enter OPT</label>
                                    <input  name="userotp" type="text" class="form-control"  placeholder="Enter OTP">
                                </div>
                                <input  name="post" type="hidden" class="form-control" value="client">
                                <br>
                                <button id="submit_btn" type="submit" class="btn btn-primary ">SignUp</button>
                            </form>
                        </div>
                        <div class="card-footer">
                            <button id="back_button"  type="submit" class="btn btn-primary">Back</button> 
                        </div>
                    </div>
                    <%-- End Bussness card--%>


                </div>
            </div>
        </main>
        
                
         <% 
           // boolean checkAuth=RegisterServlet.getCheckAuthrise();
         %>           
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>     
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
            console.log("Loaded");
           
            //Start Email_OPT
            $('#submit_btn').click(function(){
                //$('#otp').show();
                
                //let opt=true;
            });
            
            //end of email otp
            //Logic for bussness and registeration
            //let bussness = false;
            $('#bussness_button').click(function () {
            console.log("Bussness_Button_Clicked");
            // if (bussness==false) {
            $('#registercard').hide();
            $('#bussnesscard').show();
            });
            $('#back_button').click(function () {
            console.log("Bussness_Back-Button_Clicked");
            // if (bussness==false) {
            $('#registercard').show();
            $('#bussnesscard').hide();
            });
            
            //Registration for User//
            $('#register_form').on('submit', function (event) {
               
            event.preventDefault();
            let form = new FormData(this); //get all Form data in form variable 
            $('#submit_btn').hide();
            $('#loader').show();
            //Send to Register Servlet
            $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR){
                    $('#submit_btn').show();
                    $('#loader').hide();
                    $('#otp').show();
                    //For All Condition is satisfy
                    console.log(data);
                    if (data.trim()=='Done'){
                    swal("Click on either the button or outside the modal.")
                            .then((value)=> {
                            window.location = "login.jsp";
                            });
                    }
                    else{
                    swal(data);
                    }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                    $('#submit_btn').show();
                    $('#loader').hide();
                    swal("Good job!", "Register Not-Succesfully!", "Try again");
                     console.log("Error");
                     window.location = "register.jsp";
                    },
                    processData: false,
                    contentType: false
            });
            });
            
            //Registration for Client//register_client
            $('#register_client').on('submit', function (event) {
                 //$('#clientotp').show();
            event.preventDefault();
            let form = new FormData(this); //get all Form data in form variable 
            $('#submit_btn').hide();
            $('#loader').show();
            //Send to Register Servlet
            $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR){
                    $('#submit_btn').show();
                    $('#loader').hide();
                    $('#clientotp').show();
                    //For All Condition is satisfy
                    console.log(data);
                    if (data.trim()=='Done'){
                    swal("Click on either the button or outside the modal.")
                            .then((value)=> {
                            window.location = "login.jsp";
                            });
                    }
                    else{
                    swal(data);
                    }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                    $('#submit_btn').show();
                    $('#loader').hide();
                    swal("Good job!", "Register Not-Succesfully!", "Try again");
                     console.log("Error");
                     window.location = "register.jsp";
                    },
                    processData: false,
                    contentType: false
            });
            });
            
            
            
            
            
            });
        </script>

    </body>
</html>
