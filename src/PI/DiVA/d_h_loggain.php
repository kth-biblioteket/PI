<?php 
    session_start(); 
    require_once('config.php.inc');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml-transitional.dtd">

<! Författare: Cecilia Wiklander>
<! Syfte: DiVA-hantering>
<! Ändringar: >

<head>

    <meta charset="utf-8">

    <title>INLOGGNING</title>

    <link href="Site_utan_storlek.css" rel="stylesheet">

    <?php include('include_meny.html'); ?>

<script>

function validateForm() {

    var x = document.forms["myForm"]["Anv"].value;
	var y = document.forms["myForm"]["Ord"].value;
    if (x == null || x == "") {
        alert("Användarid måste anges!");
        return false;
    }
    if (y == null || y == "") {
        alert("Lösenordet måste anges!");
        return false; 
    }	

}

</script>

</head>

<body>

<?php

    $_SESSION['granskad'] = "";

    if (strlen($anv) > 0 && strlen($ord) > 0) {

        try {
            
	    $username = "pi_anv";
            $password = "V#puBL09";
            $dbname = "hant_diva";
            $dbh = new PDO("mysql:host=$hostname;dbname=$dbname", $username, $password);
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $_SESSION['anv'] = $username;
            $_SESSION['ord'] = $password;
            $_SESSION['hnamn'] = $hostname;
            $_SESSION['dbnamn'] = $dbname;
            $_SESSION['granskad'] = "KONTROLL";
            echo '<script language="javascript">';
            echo 'alert("Inloggad!")';
            echo '</script>';		
            // Sessionsvariabler för att hindra reload
            //$_SESSION['b_org_id'] = "";
            //

        } catch (PDOException $e){
            echo '<script language="javascript">';
            echo 'alert("Fel vid inloggning till databasen!")';
            echo '</script>';
        }

    }

?>

<br/>
<h2>INLOGGNING</h2>

<form name="myForm" onsubmit="return validateForm()" action="d_h_loggain.php" method="post">

Användarnamn: 
<br /><input type="text" name="Anv" /> <br />
Lösenord:
<br /><input type="password" name="Ord" /> <br />
<br />
<br />
<input type="submit" name="loggain" value="Logga in"/>

</form>

<br /><br />

<ul>

	<li><h3><a href='d_importmeny.php'>BEHANDLA IMPORTFIL</a></h3></li>
	<li><h3><a href='d_soek_personal.php'>LETA KTH-ANSTÄLLDA</a></h3></li>	

</ul>	

</body>

</html>
