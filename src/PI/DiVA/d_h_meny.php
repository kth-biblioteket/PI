<?php session_start(); ?>

<!DOCTYPE html PUBLIC "-//w3c//DTD XHTMLm 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<! Författare: Cecilia Wiklander>
<! Syfte: DiVA-hantering>
<! Ändringar: >
<! Tagit bort menylänken till isbn-menyn ***** >
<! Lagt till anv och lösen för åtkomst utan inloggning ***** >

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta charset="utf-8">

<title>MENY</title>

<link href="Site_utan_storlek.css" rel="stylesheet">

<?php include('include_diva.html');  ?>
 try {
            $anv = "pi_anv";
            $ord = "V#puBL09";
            $username = $anv;
            $password = $ord;
            $dbname = "hant_diva";
            $dbh = new PDO("mysql:host=$hostname;dbname=$dbname", $username, $password);
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $_SESSION['anv'] = $anv;
            $_SESSION['ord'] = $ord;
            $_SESSION['hnamn'] = $hostname;
            $_SESSION['dbnamn'] = $dbname;
            $_SESSION['granskad'] = "KONTROLL";
        } catch (PDOException $e){
            echo '<script language="javascript">';
            echo 'alert("Det gick int att ansluta till databasen!")';
            echo '</script>';
        }

?>

</head>

<body>

<br />

<ul>

	<li><h3><a href='d_importmeny.php'>BEHANDLA IMPORTFIL</a></h3></li>
	<li><h3><a href='d_soek_personal.php'>LETA KTH-ANSTÄLLDA</a></h3></li>	

</ul>

</body>
</html>
