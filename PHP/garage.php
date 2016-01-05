<?php

function garageDoor() {

  // Set GPIO pin #0 to out
  system('gpio mode 0 out');

  // set GPIO pin #1 to On/1/High
  system('gpio write 0 1');

  // wait 0.25 sec
  usleep(250000);

  // set GPIO pin #1 to Off/0/Low
  system('gpio write 0 1');
}

  garageDoor();
?>
