<?php

  if(isset($_POST['submit'])){ //check if form was submitted

    // Set GPIO pin #0 to out
    system('gpio mode 0 out');

    // set GPIO pin #1 to On/1/High
    system('gpio write 0 1');

    // wait 0.25 sec
    usleep(250000);

    // set GPIO pin #1 to Off/0/Low
    system('gpio write 0 0');
  }
?>

<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <title>R2-D2's Garage</title>

    <style>
    * {
        margin: auto;
        padding: 20px;
        font-size: 120%;
        color: orange;
        }

    html {text-align: center;}

    button {
      height:100px;
      width:140px;
    }
    </style>

  </head>
  <body>

    <form method="post" action="">
      <button type="submit" name="submit" autofocus>
        Garage
      </button>
    </form>

  </body>
</html>
