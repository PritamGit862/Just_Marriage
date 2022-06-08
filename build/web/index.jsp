<%-- 
    Document   : index
    Created on : 27 Apr, 2022, 5:14:57 PM
    Author     : Dell
--%>

<%@page import="com.justmerriage.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Just-Marriage</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body>
        
        <%@include file="navbar1.jsp" %>
        
        <section id="hero">
            <h4>Trade-in-offer</h4>
            <h2>Super value deals</h2>
            <h1>on all Booking</h1>
            <p>Save more with coupons & up to 30% Off!</p>
            <button>Booking-Now</button>
            <%
                Connection con = ConnectionProvider.getConnection();
            %>
            <h1><%= con%></h1>
        </section>

        <section id="feature" class="section-p1">
            <div class="fe-box">
                <img src="image/logg.png" alt="">
                <h5>Free-Shopping</h5>
            </div> 

            <div class="fe-box">
                <img src="image/logg.png" alt="">
                <h5>Online-Booking</h5>
            </div>   
            <div class="fe-box">
                <img src="image/logg.png" alt="">
                <h5>Save-Money</h5>
            </div> 
            <div class="fe-box">
                <img src="image/logg.png" alt="">
                <h5>Promotion</h5>
            </div> 
            <div class="fe-box">
                <img src="image/logg.png" alt="">
                <h5>Happy-Booking</h5>
            </div> 
            <div class="fe-box">
                <img src="image/logg.png" alt="">
                <h5>Support</h5>
            </div> 
        </section>
        <section id="product1" class="section-p1">
            <h2>Feature Product</h2>
            <p>Wedding Collection New Modern Design </p>
            <div class="pro-container">
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>                
            </div>
        </section>
        <section id="banner" class="section-m1">
            <h4>Repair Service</h4>
            <h2>Up to <span>70%Off</span> - All Booking & ....</h2>
            <button class="normal">Explore More</button>
        </section>
        <section id="product1" class="section-p1">
            <h2>New Collection</h2>
            <p>Wedding Collection New Modern Design </p>
            <div class="pro-container">
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>
                <div class="pro">
                    <img src="image/logg.png" alt="">
                    <div class="des">
                        <span>Adidas</span>
                        <h5>Cartoon Astronaut T-Shirt</h5>
                        <div>
                            <p>*****</p>
                        </div>
                        <h4>$78</h4>
                    </div>
                    <a href="#"><p class="shop">Shop</p></a>
                </div>                
            </div>
        </section>
        <section id="sm-banner" class="section-p1">
            <div class="banner-box">
                <h4>Crazy deals</h4>
                <h3>Booking And get a Coupan's</h3>
                <span>The best Classic Dress on Booking</span>
                <button class="white">Learn-More</button>
            </div>
            <div class="banner-box">
                <h4>Crazy deals</h4>
                <h3>Booking And get a Coupan's</h3>
                <span>The best Classic Dress on Booking</span>
                <button class="white">Learn-More</button>
            </div>
        </section>
        <section id="banner3">
            <div class="banner-box">
                <h3>Seasonal Booking</h3>
                <h4>Collection</h4>

            </div>
            <div class="banner-box">
                <h3>Seasonal Booking</h3>
                <h4>Collection</h4>

            </div>
            <div class="banner-box">
                <h3>Seasonal Booking</h3>
                <h4>Collection</h4>

            </div>
        </section>
        <section id="newslatter" class='section-p1 section-m1'>
            <div class="newstext">
                <h4>Sing-Up For Newsletters</h4>
                <p>Get E-mail Updates about our latest shop and <span>special offers</span>.</p>
            </div>
            <div class="form">
                <input type="text" placeholder="Your E-mail Id">
                <button class="normal">Sing-Up </button>
            </div>
        </section>
        <footer class="section-p1">
            <div class="col">
                <img src="image/ll.png" alt="">
                <h4>Contact</h4>
                <p><strong>Address:</strong>177 Khasghi Ka Baghicha Indore</p>
                <p><strong>Phone:</strong>+91 8462862761</p>
                <p><strong>Hours:</strong>10:00 - 18:00,Mon-Sat</p>
                <div class="follow">
                    <h4>Follow-Us</4> 
                        <div class="icon">
                            <i class="bi bi-facebook"></i>
                            <i class="bi bi-instagram"></i>
                            <i class="bi bi-twitter"></i>
                            <i class="bi bi-whatsapp"></i>
                        </div>    
                </div>
            </div>
            <div class="col">
                <h4>About</h4>
                <a href="#">About-Us</a>
                <a href="#">Booking-Information</a>
                <a href="#">Privacy-Policy</a>
                <a href="#">Term & Condition</a>
                <a href="#">Contact-Us</a>
            </div>
            <div class="col">
                <h4>My Account</h4>
                <a href="#">Sing-In</a>
                <a href="#">View-Cart</a>
                <a href="#">My Wishlist</a>
                <a href="#">Trace My Order</a>
                <a href="#">Help</a>
            </div>
            <div class="col install">
                <h4>Install-App</h4>
                <p>From App Store Or Google Play</p>
                <div row="">
                    <img src="" alt="">
                    <img src="" alt="">
                </div>
                <p>Security Payment Gateways</p>
            </div>
            <div class="copyright">
                <p>2022,Tech2 etc - Pritam Yadav</p>
            </div>
        </footer>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="js/script.js" type="text/javascript"></script>
    </body>
</html>
