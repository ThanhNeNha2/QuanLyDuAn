
<%@page import="java.util.*"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("auth", auth);
	}

	ProductDao pd = new ProductDao(DbCon.getConnection());
	List<Product> products = pd.getAllProducts();

	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shop cua thanh</title>
<%@include file="includes/head.jsp"%>
 <style>
    .product-grid {
      font-family: "Poppins", sans-serif;
      text-align: center;
      border: 1px solid #e7e7e7;
    }
    .product-grid .product-image {
      position: relative;
    }
    .product-grid .product-image a.image {
      display: block;
    }
    .product-grid .product-image img {
      width: 100%;
      height: auto;
      transition: all 0.3s ease 0s;
    }
    .product-grid .product-image:hover img {
      transform: translate(10px, -10px);
    }
    .product-grid .product-sale-label {
      color: #fff;
      background: #1abc9c;
      font-size: 13px;
      text-transform: capitalize;
      line-height: 35px;
      width: 55px;
      height: 35px;
      position: absolute;
      top: 0;
      right: 0;
      animation: bg-animate 5s infinite linear;
    }
    .product-grid .product-links {
      padding: 0;
      margin: 0;
      list-style: none;
      opacity: 0;
      overflow: hidden;
      position: absolute;
      bottom: 15px;
      left: 20px;
      transition: all 0.3s ease 0s;
    }
    .product-grid:hover .product-links {
      opacity: 1;
    }
    .product-grid .product-links li {
      margin: 0 0 5px;
      opacity: 0;
      transform: translateX(-100%);
      transition: all 0.3s ease 0s;
    }
    .product-grid:hover .product-links li:nth-child(2) {
      transition: all 0.3s ease 0.15s;
    }
    .product-grid:hover .product-links li {
      opacity: 1;
      transform: translateX(0);
    }
    .product-grid .product-links li a {
      color: #fff;
      background-color: #00b894;
      font-size: 14px;
      text-shadow: 0 0 3px rgba(0, 0, 0, 0.7);
      padding: 8px 10px;
      display: block;
      opacity: 0.9;
      transition: all 0.3s ease 0s;
      animation: bg-animate 5s infinite linear;
    }
    .product-grid .product-links li a:hover {
      color: #fff;
      box-shadow: 0 0 0 3px #fff inset;
      opacity: 1;
    }
    .product-grid .product-links li a i {
      margin: 0 5px 0 0;
    }
    .product-grid .product-content {
      padding: 15px 0 5px;
    }
    .product-grid .title {
      font-size: 17px;
      font-weight: 400;
      text-transform: capitalize;
      padding: 0 10px 14px;
      margin: 0 0 7px;
      border-bottom: 1px solid #dfe5e9;
    }
    .product-grid .title a {
      color: #000;
      transition: all 0.3s ease 0s;
    }
    .product-grid .title a:hover {
      animation: color-animate 5s infinite linear;
    }
    .product-grid .price {
      color: #1abc9c;
      font-size: 20px;
      font-weight: 400;
      animation: color-animate 5s infinite linear;
    }
    .product-grid .price span {
      color: #999;
      text-decoration: line-through;
      margin: 0 3px 0 0;
    }
    @keyframes color-animate {
      0% {
        color: #00b894;
      }
      20% {
        color: #00cec9;
      }
      40% {
        color: #0984e3;
      }
      60% {
        color: #6c5ce7;
      }
      80% {
        color: #e84393;
      }
      100% {
        color: #00b894;
      }
    }
    @keyframes bg-animate {
      0% {
        background-color: #00b894;
      }
      20% {
        background-color: #00cec9;
      }
      40% {
        background-color: #0984e3;
      }
      60% {
        background-color: #6c5ce7;
      }
      80% {
        background-color: #e84393;
      }
      100% {
        background-color: #00b894;
      }
    }
    @media screen and (max-width: 1200px) {
      .product-grid {
        margin: 0 0 30px;
      }
    }
    
  </style>
    <link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

      <style>

        .product-grid {
          font-family: "Poppins", sans-serif;
          text-align: center;
          border: 1px solid #e7e7e7;
        }
        .product-grid .product-image {
          position: relative;
        }
        .product-grid .product-image a.image {
          display: block;
        }
        .product-grid .product-image img {
          width: 100%;
          height: auto;
          transition: all 0.3s ease 0s;
        }
        .product-grid .product-image:hover img {
          transform: translate(10px, -10px);
        }
        .product-grid .product-sale-label {
          color: #fff;
          background: #1abc9c;
          font-size: 13px;
          text-transform: capitalize;
          line-height: 35px;
          width: 55px;
          height: 35px;
          position: absolute;
          top: 0;
          right: 0;
          animation: bg-animate 5s infinite linear;
        }
        .product-grid .product-links {
          padding: 0;
          margin: 0;
          list-style: none;
          opacity: 0;
          overflow: hidden;
          position: absolute;
          bottom: 15px;
          left: 20px;
          transition: all 0.3s ease 0s;
        }
        .product-grid:hover .product-links {
          opacity: 1;
        }
        .product-grid .product-links li {
          margin: 0 0 5px;
          opacity: 0;
          transform: translateX(-100%);
          transition: all 0.3s ease 0s;
        }
        .product-grid:hover .product-links li:nth-child(2) {
          transition: all 0.3s ease 0.15s;
        }
        .product-grid:hover .product-links li {
          opacity: 1;
          transform: translateX(0);
        }
        .product-grid .product-links li a {
          color: #fff;
          background-color: #00b894;
          font-size: 14px;
          text-shadow: 0 0 3px rgba(0, 0, 0, 0.7);
          padding: 8px 10px;
          display: block;
          opacity: 0.9;
          transition: all 0.3s ease 0s;
          animation: bg-animate 5s infinite linear;
        }
        .product-grid .product-links li a:hover {
          color: #fff;
          box-shadow: 0 0 0 3px #fff inset;
          opacity: 1;
        }
        .product-grid .product-links li a i {
          margin: 0 5px 0 0;
        }
        .product-grid .product-content {
          padding: 15px 0 5px;
        }
        .product-grid .title {
          font-size: 17px;
          font-weight: 400;
          text-transform: capitalize;
          padding: 0 10px 14px;
          margin: 0 0 7px;
          border-bottom: 1px solid #dfe5e9;
        }
        .product-grid .title a {
          color: #000;
          transition: all 0.3s ease 0s;
        }
        .product-grid .title a:hover {
          animation: color-animate 5s infinite linear;
        }
        .product-grid .price {
          color: #1abc9c;
          font-size: 20px;
          font-weight: 400;
          animation: color-animate 5s infinite linear;
        }
        .product-grid .price span {
          color: #999;
          text-decoration: line-through;
          margin: 0 3px 0 0;
        }
        @keyframes color-animate {
          0% {
            color: #00b894;
          }
          20% {
            color: #00cec9;
          }
          40% {
            color: #0984e3;
          }
          60% {
            color: #6c5ce7;
          }
          80% {
            color: #e84393;
          }
          100% {
            color: #00b894;
          }
        }
        @keyframes bg-animate {
          0% {
            background-color: #00b894;
          }
          20% {
            background-color: #00cec9;
          }
          40% {
            background-color: #0984e3;
          }
          60% {
            background-color: #6c5ce7;
          }
          80% {
            background-color: #e84393;
          }
          100% {
            background-color: #00b894;
          }
        }
        @media screen and (max-width: 1200px) {
          .product-grid {
            margin: 0 0 30px;
          }
        }
        


      </style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<div class="container "  style="margin-top: 50px;" >


		<div id="carouselExampleIndicators" class="carousel slide "
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100 " src="product-images/biaa11.webp"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100 " src="product-images/biaa22.webp"
						alt="Second slide">
				</div>
				 
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>



	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">


			<%
				if (!products.isEmpty()) {
					for (Product p : products) {
			%>
		
      <div class="col-md-3 col-sm-6 " >
        <div class="product-grid" style=" min-height: 450px; margin-bottom: 20px;" >
        
          <div class="product-image">
            <a href="#" class="image">
              <img class="card-img-top" src="product-images/<%=p.getImage()%>" alt="Card image cap">
            </a>
            <ul class="product-links">
              <li><a href="add-to-cart?id=<%=p.getId()%>"><i class="fa fa-shopping-bag"></i> Add to
                  cart</a></li>
              <li><a href="viewcard.jsp?quantity=1&id=<%=p.getId()%>"><i class="fa fa-search"></i> Quick View</a></li>
            </ul>
          </div>
          <div class="product-content">
            <h3 class="title"><a href="#"><%=p.getName()%></a></h3>
            <div class="price"><%=p.getPrice()%></div>
            <div class="category"><%=p.getCategory()%></div>
          </div>
        </div>
      </div>

			<%
				}
				}
			%>

		</div>
	</div>
<%@include file="endpage.jsp"%>
	<%@include file="includes/footer.jsp"%>
</body>
</html>