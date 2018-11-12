<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Library - Fancy Yong </title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="css/agency.min.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Fancy Library</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#services">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#booklist">Book/List</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#portfolio">Theme and Genre</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">About us</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#team">Our Partners</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
            </li>
              <li class="nav-item" id="in">
              <a class="nav-link js-scroll-trigger" href="#login">Login</a>
              <u:isLogin>
              	<li class="nav-item" id="in">
              	<a class="nav-link js-scroll-trigger" href="#login">Logout</a>
              </u:isLogin>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
      <div class="container">
        <div class="intro-text">
          <div class="intro-lead-in">Welcome To Our Library!</div>
          <div class="intro-heading text-uppercase">It's Nice To Meet You</div>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Open Your Book</a>
        </div>
      </div>
    </header>

    <!-- Services -->
    <section id="services">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Services</h2>
            <h3 class="section-subheading text-muted">We can borrow a variety of books and boast the high quality of our pleasant facilities and books.</h3>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Book/List</h4>
            <p class="text-muted">This section allows you to inquire about the loan status of books, the loan period and the list of books</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">About us</h4>
            <p class="text-muted">The Fancy-library will hold the October Theme Show from 10th (Sunday) to 4th (Sunday).

The books selected by the librarians are displayed in the six library rooms of Seoul Metropolitan Library for seven different themes, including the original novel, independent publication, and the stars and astronomy.</p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <i class="fas fa-circle fa-stack-2x text-primary"></i>
              <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
            </span>
            <h4 class="service-heading">Contact</h4>
            <p class="text-muted">For other questions, and for customers who want to use the quality of the books and the customer center, please contact us here.</p>
          </div>
        </div>
      </div>
    </section>

<!-- book/list -->
	<section id ="booklist">
		<div class= "booklist" align="center">
			<img class="img-fluid" src="img/booklist/book2.jpg" alt=""><br />
			<div class="row">
				<div class="col-lg-12 text-center">
				<br /><br />
				 <h2 class="section-heading text-uppercase">Book/List</h2>
            	 <h3 class="section-subheading text-muted">You can search for books here.</h3>
            	 <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit" onclick="location.href='booklist.jsp'">Search the book</button>
            </div>
			</div>
		</div>
	</section>


    <!-- Portfolio Grid -->
    <section class="bg-light" id="portfolio">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Theme and Genre</h2>
            <h3 class="section-subheading text-muted">You can check out the themes and genres of books.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="img/portfolio/01-thumbnail.jpg" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Fashion</h4>
              <p class="text-muted">Fashion book</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="img/portfolio/02-thumbnail.jpg" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Travel</h4>
              <p class="text-muted">Travel books</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="img/portfolio/03-thumbnail.jpg" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Language</h4>
              <p class="text-muted">Foreign-Language</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="img/portfolio/04-thumbnail.jpg" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Certificate</h4>
              <p class="text-muted">License Book</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="img/portfolio/05-thumbnail.jpg" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Computer</h4>
              <p class="text-muted">Computer Books</p>
            </div>
          </div>
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fas fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="img/portfolio/06-thumbnail.jpg" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>Photography</h4>
              <p class="text-muted">Photography and Video-related books</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- About -->
    <section id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">About</h2>
            <h3 class="section-subheading text-muted">Yong, Fancy Library is the best library in the World... haha</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <ul class="timeline">
              <li>
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/1.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>2011-2012</h4>
                    <h4 class="subheading">Our Library Beginnings</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">This library is a library made by many trial and error, starting at very small amounts until now.</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/2.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>March 2013</h4>
                    <h4 class="subheading">A Library is Born</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">In the 21st century, the knowledge and information society has expanded not only the library but also the online information.
It collects and provides various publications in the region, and strives to create a healthy reading ecosystem for authors, publishers, bookstores, libraries and readers.</p>
                  </div>
                </div>
              </li>
              <li>
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/3.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>December 2017</h4>
                    <h4 class="subheading">Offer a variety of services</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">We care a lot about the quality of our books, both in terms of facilities and in order to provide various services to our citizens. For the pleasant reading environment, we also have a number of air purifiers and air conditioners and operate cafes in the library.</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <img class="rounded-circle img-fluid" src="img/about/4.jpg" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>July 2018</h4>
                    <h4 class="subheading">Yong's Purpose</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">From now on, my goal is to increase the reading rate of local citizens through this library. These days, fewer people are reading books because it is a convenient world to read with their smartphones. But if we create a better environment and reduce our resistance to reading, we may be able to overcome it.</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <h4>Be Part
                    <br>Of Our
                    <br>Story!</h4>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>

    <!-- Team -->
    <section class="bg-light" id="team">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Our Amazing Partners</h2>
            <h3 class="section-subheading text-muted">These are partners who sponsor the library.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="img/team/1.jpg" alt="">
              <h4>Kay Garland</h4>
              <p class="text-muted">Lead Designer</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-facebook-f"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-linkedin-in"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="img/team/2.jpg" alt="">
              <h4>Larry Parker</h4>
              <p class="text-muted">Lead Marketer</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-facebook-f"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-linkedin-in"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="img/team/3.jpg" alt="">
              <h4>Diana Pertersen</h4>
              <p class="text-muted">Lead Developer</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-facebook-f"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fab fa-linkedin-in"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <p class="large text-muted">I would appreciate your contacting me about the support of the library.</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Clients -->
    <section class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="img/logos/envato.jpg" alt="">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="img/logos/designmodo.jpg" alt="">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="img/logos/themeforest.jpg" alt="">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="img/logos/creative-market.jpg" alt="">
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact -->
    <section id="contact">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Contact Us</h2>
            <h3 class="section-subheading text-muted">library information<br /> Contact to Yong</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <form id="contactForm" name="sentMessage" novalidate="novalidate">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <input class="form-control" id="name" type="text" placeholder="Your Name *" required="required" data-validation-required-message="Please enter your name.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address.">
                    <p class="help-block text-danger"></p>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" required="required" data-validation-required-message="Please enter your phone number.">
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <textarea class="form-control" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                    <p class="help-block text-danger"></p>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 text-center">
                  <div id="success"></div>
                  <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Send Message</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    
    
    <!-- Login -->
	<section id ="login">
		<div class="login">
			<div class="row">
				<div class="col-lg-12 text-center">
				 <h2 class="section-heading text-uppercase">LOGIN</h2>
            	 <h3 class="section-subheading text-muted">Check your ID or PW</h3>
            	 <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit" onclick="location.href='index.jsp'">Login HERE!</button>
            </div>
			</div>
		</div>
	</section>

    <!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
          	<span class="copyright">사업자등록번호 : 123-45-67890 | 대표이사 : 김용진 | <br />주소 : 서울 특별시 강북구 Fancy | 대표전화 : 010-1234-1234</span><br />
            <span class="copyright">Copyright &copy; Your Website 2018 by Yong</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="list-inline-item">
                <b><a href="#">Privacy Policy</a></b>
              </li>
              <li class="list-inline-item">
                <b><a href="#">Fancy Yong</a></b>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>

    <!-- Portfolio Modals -->

    <!-- Modal 1 -->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">Fashion</h2>
                  <p class="item-intro text-muted">You can get book information about fashion.</p>
                  <img class="img-fluid d-block mx-auto" src="img/portfolio/01-full.jpg" alt="">
                  <p>You can see book information about fashion.
						Please read the library year information below and borrow the books.</p>
                  <ul class="list-inline">
                    <li>Date: October 2018</li>
                    <li>Rent: 2$</li>
                    <li>Rental Period: 1 Week</li>
                  </ul>
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                    Close Fashion</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal 2 -->
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">Travel</h2>
                  <p class="item-intro text-muted">You can get book information about Travel.</p>
                  <img class="img-fluid d-block mx-auto" src="img/portfolio/02-full.jpg" alt="">
                  <p>You can see book information about Travel.
						Please read the library year information below and borrow the books.</p>
                  <ul class="list-inline">
                    <li>Date: October 2018</li>
                    <li>Rent: 2$</li>
                    <li>Rental Period: 1 Week</li>
                  </ul>
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                    Close Travel</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal 3 -->
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">Language</h2>
                  <p class="item-intro text-muted">You can get book information about Language.</p>
                  <img class="img-fluid d-block mx-auto" src="img/portfolio/03-full.jpg" alt="">
                  <p>You can see book information about Language.
						Please read the library year information below and borrow the books.</p>
                  <ul class="list-inline">
                    <li>Date: October 2018</li>
                    <li>Rent: 4$</li>
                    <li>Rental Period: 1 Week</li>
                  </ul>
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                    Close Language</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal 4 -->
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">Certificate</h2>
                  <p class="item-intro text-muted">You can get book information about License.</p>
                  <img class="img-fluid d-block mx-auto" src="img/portfolio/04-full.jpg" alt="">
                  <p>You can see book information about License.
						Please read the library year information below and borrow the books.</p>
                  <ul class="list-inline">
                  	<li>Date: October 2018</li>
                    <li>Rent: 1$</li>
                    <li>Rental Period: 1 Week</li>
                  </ul>
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                    Close License</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal 5 -->
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">Computer</h2>
                  <p class="item-intro text-muted">You can get book information about Computer.</p>
                  <img class="img-fluid d-block mx-auto" src="img/portfolio/05-full.jpg" alt="">
                  <p>You can see book information about Computer.
						Please read the library year information below and borrow the books.</p>
                  <ul class="list-inline">
                    <li>Date: October 2018</li>
                    <li>Rent: 5$</li>
                    <li>Rental Period: 2 Week</li>
                  </ul>
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                    Close Computer</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal 6 -->
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="close-modal" data-dismiss="modal">
            <div class="lr">
              <div class="rl"></div>
            </div>
          </div>
          <div class="container">
            <div class="row">
              <div class="col-lg-8 mx-auto">
                <div class="modal-body">
                  <!-- Project Details Go Here -->
                  <h2 class="text-uppercase">Photography</h2>
                  <p class="item-intro text-muted">You can get book information about Photography.</p>
                  <img class="img-fluid d-block mx-auto" src="img/portfolio/06-full.jpg" alt="">
                  <p>You can see book information about Photography.
						Please read the library year information below and borrow the books.</p>
                  <ul class="list-inline">
                    <li>Date: October 2018</li>
                    <li>Rent: 3$</li>
                    <li>Rental Period: 1 Week</li>
                  </ul>
                  <button class="btn btn-primary" data-dismiss="modal" type="button">
                    <i class="fas fa-times"></i>
                    Close Photography</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/agency.min.js"></script>

  </body>
</html>