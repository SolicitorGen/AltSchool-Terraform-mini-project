<!DOCTYPE html>
<html>
<body>

<h1>Hello AltSchool</h1>

<h2>
<?php
echo date("F d, Y h:i:s A e", time());
echo "</br>"; 
echo "Server IP Address - " .gethostname(); 
?>
</h2>

</body>
</html>