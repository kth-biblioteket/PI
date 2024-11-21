<?php 
    session_start(); 
    require_once('config.php.inc');
?>

<!DOCTYPE html PUBLIC "-//w3c//DTD XHTMLm 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<! Författare: Cecilia Wiklander>
<! Syfte: ISBN-hantering>
<! Ändringar: >
<! >

<head>

    <meta charset="utf-8">

    <title>ÄNDRA REGISTRERADE UPPGIFTER ISBN</title>
	
    <link href="Site_utan_storlek.css" rel="stylesheet"> 

    <script type="text/javascript">

    

    </script>
	
</head>

<body>

<?php include('include_isbn.html'); ?>

<?php
    
    $username = $_SESSION['anv'];
    $password = $_SESSION['ord'];
    $dbname = "hant_isbn";

    $ISBN = $_SESSION['ISBN'];
    $Titel = $_SESSION['Titel'];
    $KTH_id = $_SESSION['KTH_id'];

    $Kommentar = $_POST['Kommentar'];

    $Sk = "'";
    $Ers = "''";

    
    $Titel = str_replace($Sk, $Ers, $Titel);



    if (isset($_POST['spara'])) {
        try {
            $pdo = new PDO("mysql:host=$hostname;dbname=$dbname", $username, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                                                                             

            // ÄNDRA UPPG OM ISBN
		

 

    

		echo $KTH_id;
		echo $Titel;
             echo 'HEJSAN';

            echo '<script language="javascript">';
            echo 'alert("Ändringen är nu sparad!")';
            echo '</script>';                            
        }
        catch (PDOException $e) {
            echo '<script language="javascript">';
            echo 'alert("Fel vid sparande!")';
            echo '</script>';

	
	    
        }
    }

?>

<h2>ÄNDRA REGISTRERADE UPPGIFTER ISBN</h2>	
	                                    
	<form name="ISBNForm" onsubmit="return validateForm()" action="d_aendra_isbnreg.php" method="post">

                <a href='d_soek_isbn.php'>TILL SÖK ISBN</a>&nbsp;&nbsp;
                <a href='d_isbn_meny.php'>TILL MENYN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" name="spara" style="background-color:#0fb821" value="Spara"/>
                <br /><br /><br /> 
                
		ISBN:</br> 
		<input type="text" name="ISBN" value="<?php echo $ISBN; ?>" size="17" disabled/>&nbsp;&nbsp; 
                <br />

		Titel:</br> 
		<input type="text" name="Titel" value="<?php echo $Titel; ?>" size="150" />&nbsp;&nbsp; 
                <br />

                Forskare:</br>
                <input type="text" name="Forskare" value="<?php echo $Forskare; ?>" size="50" disabled/>&nbsp;&nbsp;
                <br />

                KTH-id:</br>
                <input type="text" name="KTH_id" value="<?php echo $KTH_id; ?>" size="8" disabled/>&nbsp;&nbsp;
                <br />

                Publikationstyp:</br>
                <input type="text" name="Pubtyp" value="<?php echo $Pubtyp; ?>" size="30" disabled/>&nbsp;&nbsp;
                <br />

                TRITA:</br>
                <input type="text" name="TRITA" value="<?php echo $TRITA; ?>" size="30" disabled/>&nbsp;&nbsp;
                <br />

		Forskarens epost:</br> 
		<input type="text" name="Epost" value="<?php echo $Epost; ?>" size="30" disabled/>&nbsp;&nbsp; 
                <br />

		Disputationsdatum:</br> 
		<input type="text" name="Dispdatum" value="<?php echo $Dispdatum; ?>" size="20" disabled/>&nbsp;&nbsp; 
                <br />

		Registreringsdatum:</br> 
		<input type="text" name="Regdatum" value="<?php echo $Regdatum; ?>" size="20" disabled/>&nbsp;&nbsp; 
                <br />

		Kommentar:</br> 
		<input type="text" name="Kommentar" size="100"/> 
                
                <input type="text" name="Handl" id="Handl" size="20"  hidden/>                   
    				
	</form>
								
</body>

</html>
