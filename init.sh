#!/bin/bash
apt update -y
apt install awscli -y
apt install apache2 -y
apt install php libapache2-mod-php php-mysql -y
aws secretsmanager get-secret-value --secret-id lamp-db-secret --query SecretString --version-stage AWSCURRENT --region us-east-1 --output text > /home/ubuntu/.env
rm /var/www/html/index.html
echo '<?php
$file = fopen("/home/ubuntu/.env","r");
$conString = explode(";", fgets($file));
fclose($file);
$con = mysqli_connect($conString[0], $conString[1], $conString[2], $conString[3]);

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}else{
        echo "DB connected!";
        echo "<br>";
        echo "Hello World!";
}

?>' >> /var/www/html/index.php
service apache2 restart