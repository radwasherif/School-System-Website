<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>School HomePage</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    body {
      font: 400 15px Lato, sans-serif;
      line-height: 1.8;
      color: #818181;
    }
    h2 {
      font-size: 24px;
      text-transform: uppercase;
      color: #303030;
      font-weight: 600;
      margin-bottom: 30px;
    }
    h4 {
      font-size: 19px;
      line-height: 1.375em;
      color: #303030;
      font-weight: 400;
      margin-bottom: 30px;
    }  
    .jumbotron {
      background-color: #33A1C9;
      color: #fff;
      padding: 100px 25px;
      font-family: Montserrat, sans-serif;
    }
    .container-fluid {
      padding: 60px 50px;
    }
    .bg-grey {
      background-color: #f6f6f6;
    }
    .logo-small {
      color: #33A1C9;
      font-size: 50px;
    }
    .logo {
      color: #33A1C9;
      font-size: 200px;
    }
    .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
    }
    .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
    }
    .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #33A1C9;
    }
    .carousel-indicators li {
      border-color: #33A1C9;
    }
    .carousel-indicators li.active {
      background-color: #33A1C9;
    }
    .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
    }
    .item span {
      font-style: normal;
    }
    .panel {
      border: 1px solid #33A1C9; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
    }
    .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
    }
    .panel-footer .btn:hover {
      border: 1px solid #33A1C9;
      background-color: #fff !important;
      color: #33A1C9;
    }
    .panel-heading {
      color: #fff !important;
      background-color: #000000 !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
    }
    .panel-footer {
      background-color: white !important;
    }
    .panel-footer h3 {
      font-size: 32px;
    }
    .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
    }
    .panel-footer .btn {
      margin: 15px 0;
      background-color: #33A1C9;
      color: #fff;
    }
    .navbar {
      margin-bottom: 0;
      background-color: #000000;
      z-index: 9999;
      border: 0;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      letter-spacing: 4px;
      border-radius: 0;
      font-family: Montserrat, sans-serif;
    }
    .navbar li a, .navbar .navbar-brand {
      color: #fff !important;
    }
    .navbar li a, .navbar .navbar-middle{
      color: #fff !important;
    }
    .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #33A1C9 !important;
      background-color: #fff !important;
    }
    .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #fff !important;
    }
    footer .glyphicon {
      font-size: 20px;
      margin-bottom: 20px;
      color: #33A1C9;
    }
    .slideanim {visibility:hidden;}
    .slide {
      animation-name: slide;
      -webkit-animation-name: slide;
      animation-duration: 1s;
      -webkit-animation-duration: 1s;
      visibility: visible;
    }
    @keyframes slide {
      0% {
        opacity: 0;
        transform: translateY(70%);
      } 
      100% {
        opacity: 1;
        transform: translateY(0%);
      }
    }
    @-webkit-keyframes slide {
      0% {
        opacity: 0;
        -webkit-transform: translateY(70%);
      } 
      100% {
        opacity: 1;
        -webkit-transform: translateY(0%);
      }
    }
    @media screen and (max-width: 768px) {
      .col-sm-4 {
        text-align: center;
        margin: 25px 0;
      }
      .btn-lg {
        width: 100%;
        margin-bottom: 35px;
      }
    }
    @media screen and (max-width: 480px) {
      .logo {
        font-size: 150px;
      }
    }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

  <?php
  $id = 0;
  $id = $_GET['id'];
// echo $id;
  $school_name = $address = $mission = $vision = $language = $general_info = $fees = $type = $email = "";
  include  'connection-values.php';
  $stmt = mysqli_stmt_init($conn);
  if(!mysqli_stmt_prepare($stmt, 'CALL user_view_school_info(?)'))
  {
    print "Failed to prepare statement\n";
  }
  else
  {

    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);


    while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
    {
      $school_name = $row[0];
      $address = $row[1];
      $mission = $row[2];
      $vision = $row[3];
      $language = $row[4];
      $general_info = $row[5];
      $fees = $row[6];
      $type = $row[7];
      $email = $row[8];
    } 
    mysqli_free_result($result);
  } 

?>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
        </button>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
      <a class="navbar-brand" href="index.php">Home</a>
       <a class="navbar-brand" href="view-schools.php">View Schools</a>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#about">ABOUT</a></li>
          <li><a href="#levels">LEVELS</a></li>
          <li><a href="#our_people">OUR PEOPLE</a></li>
          <li><a href="#reviews">REVIEWS</a></li>
          <li><a href="#announcements">ANNOUNCEMENTS</a></li>
          <li><a href="#contact">CONTACT</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="jumbotron text-center">
    <?php echo "<h1>$school_name</h1>"; ?> 
    <?php echo "<p>$type School</p>"; ?>  
  </div>

  <!-- Container (About Section) -->
  <div id="about" class="container-fluid">
    <div class="row">
      <div class="col-sm-8">
        <h2>About School</h2><br>
        <?php echo "<h4>$general_info</h4><br>"; ?>
        <?php echo "<p> The main language of the school is $language .</p>"; ?>
        <?php echo "<p> You can visit our school on $address .</p>"; ?>
        <?php echo "<p> Our annual fees are $fees .</p>"; ?>
      </div>
      <div class="col-sm-4">
        <span class="glyphicon glyphicon-signal logo"></span>
      </div>
    </div>
  </div>

  <div class="container-fluid bg-grey">
    <div class="row">
      <div class="col-sm-4">
        <span class="glyphicon glyphicon-globe logo slideanim"></span>
      </div>
      <div class="col-sm-8">
        <h2>Our Values</h2><br>
        <?php echo "<h4><strong>MISSION:</strong> $mission </h4><br>"; ?>
        <?php echo "<p><strong>VISION:</strong> $vision</p>"; ?>
      </div>
    </div>
  </div>

  <!-- Container (Levels Section) -->
  <div id="levels" class="container-fluid text-center">
    <h2>LEVELS</h2>
    <h4>What we offer</h4>
    <br>
    <div class="row slideanim">
      <?php 
      $stmt = mysqli_stmt_init($conn);
      if(!mysqli_stmt_prepare($stmt, 'CALL user_view_school_levels(?)'))
      {
        print "Failed to prepare statement\n";
      }
      else
      {

        mysqli_stmt_bind_param($stmt, "i", $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $cur_level = "";    

        while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
        {
          $cur_level = $row[0];
          echo "<div class='col-sm-4'>";
           echo  '<span class="glyphicon glyphicon-education logo-small"></span></p>';
          echo "<h4> $cur_level </h4>";
          echo '</div>';
        } 
        mysqli_free_result($result);
      } 
      ?>


    </div>
  </div>

  <!-- Container (Our People Section) -->
  <div id="our_people" class="container-fluid text-center bg-grey">
    <h2>OUR PEOPLE</h2>
    <h4>we have the best teachers</h4>
    <div class="row text-center slideanim">

      <?php 

      $stmt = mysqli_stmt_init($conn);
      if(!mysqli_stmt_prepare($stmt, 'CALL user_view_school_teachers(?)'))
      {
        print "Failed to prepare statement\n";
      }
      else
      {

        mysqli_stmt_bind_param($stmt, "i", $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $cur_teacher = "";    

        while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
        {
          $cur_teacher = $row[0];
          echo "<div class='col-sm-4'>";
          echo  ' <div class="thumbnail">';
          echo "<p><strong> $cur_teacher </strong></p>";
          echo '</div>';
          echo '</div>';
        } 
        mysqli_free_result($result);
      } 

      ?>
    </div><br>
  </div>  

  <!-- Container (Reviews Section) -->
  <div id="reviews" class="container-fluid text-center">
    <h2>What parents say about us</h2>
    <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
       <?php
       $stmt = mysqli_stmt_init($conn);
       if(!mysqli_stmt_prepare($stmt, 'CALL user_view_school_reviews(?)'))
       {
        print "Failed to prepare statement\n";
      }
      else
      {

        mysqli_stmt_bind_param($stmt, "i", $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);  
        $count = 0;
        while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
        {
          if($count == 0)
          {
            echo "<li data-target='#myCarousel' data-slide-to= $count class='active'></li>";
          }
          else
          {
            echo "<li data-target='#myCarousel' data-slide-to=$count></li>";
          }
          $count = $count + 1; 
        } 
        mysqli_free_result($result);
      }     
      ?>

    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">


      <?php
      $stmt = mysqli_stmt_init($conn);
      if(!mysqli_stmt_prepare($stmt, 'CALL user_view_school_reviews(?)'))
      {
        print "Failed to prepare statement\n";
      }
      else
      {

        mysqli_stmt_bind_param($stmt, "i", $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $cur_review = ""; 
        $cur_parent = "";   
        $count = 0;
        while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
        {
          $cur_review = $row[0];
          $cur_parent = $row[1];
          if($count == 0)
          {
            echo " <div class='item active'>";
            echo "<h4> &quot $cur_review &quot <br><span style='font-style:normal;'> $cur_parent </span></h4>";
          }
          else
          {
            echo " <div class='item'>";
            echo "<h4> &quot $cur_review &quot <br><span style='font-style:normal;'> $cur_parent </span></h4>";
          }
          $count = $count + 1;
          echo '</div>';
        } 
        mysqli_free_result($result);
      }     
      ?>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


<!-- Container (Announcements Section) -->
  <div id="announcements" class="container-fluid text-center bg-grey">
    <h2>ANNOUNCEMENTS</h2>
    <h4>our latest announcements</h4>
    <div id="myCarousel2" class="carousel slide text-center" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
       <?php
       $stmt = mysqli_stmt_init($conn);
       if(!mysqli_stmt_prepare($stmt, 'CALL user_view_announcement(?)'))
       {
        print "Failed to prepare statement\n";
      }
      else
      {

        mysqli_stmt_bind_param($stmt, "i", $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
         $count = 0;
        while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
        {
          if($count == 0)
          {
            echo "<li data-target='#myCarousel2' data-slide-to= $count class='active'></li>";
          }
          else
          {
            echo "<li data-target='#myCarousel2' data-slide-to=$count></li>";
          }
          $count = $count + 1; 
        } 
        mysqli_free_result($result);
      }     
      ?>

    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">


      <?php
      $stmt = mysqli_stmt_init($conn);
      if(!mysqli_stmt_prepare($stmt, 'CALL user_view_announcement(?)'))
      {
        print "Failed to prepare statement\n";
      }
      else
      {

        mysqli_stmt_bind_param($stmt, "i", $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $cur_title = ""; 
        $cur_type = "";
        $cur_description = "";
        $cur_date = "";   
        $count = 0;   
        while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
        {
          $cur_title = $row[0];
          $cur_type = $row[1];
          $cur_description = $row[2];
          $cur_date = $row[3];
          if($count == 0)
          {
            echo " <div class='item active'>";
            echo "<h3><span style='font-style:normal;'> $cur_title </span></h3>";
           // echo "<h4>  $cur_type <br></h4>";
           echo "<h4> &quot $cur_description &quot <br><span style='font-style:normal;'> $cur_type </span></h4>";
            echo "<h6>                  $cur_date <br></h6>";
          }
          else
          {
            echo " <div class='item'>";
            echo "<h3><span style='font-style:normal;'> $cur_title </span></h3>";
          //  echo "<h4>  $cur_type <br></h4>";
            echo "<h4> &quot $cur_description &quot <br><span style='font-style:normal;'> $cur_type </span></h4>";
            echo "<h6>                  $cur_date <br></h6>";  
          }
          $count = $count + 1;
          echo '</div>';
        } 
        mysqli_free_result($result);
      }     
      ?>

    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid">
  <h2 class="text-center">CONTACT US</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you.</p>
      <?php echo "<p><span class='glyphicon glyphicon-map-marker'></span> $address </p>"; ?>


      <?php 
      $stmt = mysqli_stmt_init($conn);
      if(!mysqli_stmt_prepare($stmt, 'CALL user_view_school_phones(?)'))
      {
        print "Failed to prepare statement\n";
      }
      else
      {

        mysqli_stmt_bind_param($stmt, "i", $id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $cur_phone = "";    

        while ($row = mysqli_fetch_array($result, MYSQLI_NUM))
        {
          $cur_phone = $row[0];
          echo "<p><span class='glyphicon glyphicon-phone'></span> $cur_phone </p>";
        } 
        mysqli_free_result($result);
      } 
      ?>


      <?php echo "<p><span class='glyphicon glyphicon-envelope'></span> $email </p>" ?>
    </div>
    

  </div>
</div>




<script>
  $(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){

        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
      if (pos < winTop + 600) {
        $(this).addClass("slide");
      }
    });
  });
})
</script>

</body>
</html>
