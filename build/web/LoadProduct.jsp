<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%@page import="java.util.List"%>
<%@page import="com.justmerriage.entities.Product"%>
<%@page import="com.justmerriage.dao.ProductDao"%>
<%@page import="com.justmerriage.helper.ConnectionProvider"%>
<div class="row">
    <%
        //Thread.sleep(1000);
        ProductDao dao = new ProductDao(ConnectionProvider.getConnection());
        List<Product> product = null;
        int cid = Integer.parseInt(request.getParameter("cid"));
        if (cid == 0) {
            product = dao.getAllProduct();
        } else {
            product = dao.getAllProductByCatId(cid);
        }
        if(product.size()==0){
            out.println("<h3 class='display-3 text-center'>No product in this category</h3>");
            return;
        }
        for (Product p : product) {
    %>
    <section id="product1" class="section-p1 col-md-6 pro ">
        <div class="pro-container card card border-0">
            <div class="pro card-body">
                <img src="Product_photo/<%= p.getImage()%>" class="img-fluid">
                <div class="des">
                    <span><%= p.getName()%></span>
                    <h5><%= p.getDescription()%></h5>
                    <div>
                        <p>*****</p>
                    </div>
                    <h4>$<%= p.getPrice()%></h4>
                </div>
                <a href="#"><p class="shop">Shop</p></a>
            </div>                
        </div>
    </section>
    <%
        }
    %>
</div>








