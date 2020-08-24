<?php

require_once './class/classconexion.php';

$db = new DB;
$con = $db->getConection();
$pst = $con->prepare("SELECT nivel, COUNT(codigo) AS count FROM usuarios WHERE nivel = 'ADMINISTRADOR' AND status = 'ACTIVO' GROUP BY nivel;");
$pst->execute();
$rs = $pst->fetch(PDO::FETCH_ASSOC);

if ($rs['count'] > 0) {
  echo "<script type='text/javascript' language='javascript'>
    alert('Ya existe un adminstrador registrado');
    document.location = 'index'
  </script>";
  return;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <link href="assets/img/favicon.png" rel="icon" type="image">

  <title></title>

  <!-- Bootstrap core CSS -->
  <link href="assets/css/bootstrap.css" rel="stylesheet">
  <!--external css-->
  <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="assets/css/style.css" rel="stylesheet">
  <link href="assets/css/style-responsive.css" rel="stylesheet">

  <script src="assets/js/jquery.js"></script>
  <script type="text/javascript" src="assets/script/script2.js"></script>
  <script type="text/javascript" src="assets/script/validation.min.js"></script>
  <script type="text/javascript" src="assets/script/script.js"></script>

</head>

<body class="index-login">

  <form class="form-login" name="loginform" id="loginform" method="post" action="">

    <h2 class="form-login-heading">Login de Acceso</h2>
    <div class="login-wrap">
      <div id="error">
        <!-- error will be shown here ! -->
      </div>

      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Ingrese su Usuario" name="usuario" id="usuario" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" required="" aria-required="true">
        <i class="fa fa-user form-control-feedback"></i>
      </div>

      <div class="form-group has-feedback">
        <input class="form-control" type="password" placeholder="Ingrese su Password" name="password" id="password" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" required="" aria-required="true">
        <i class="fa fa-lock form-control-feedback"></i>
      </div>
      <button class="btn btn-success btn-block" name="btn-login" id="btn-login" type="submit"><i class="fa fa-sign-in"></i> Acceder</button>
      <hr>
      <div class="login-social-link centered">
        <p><a style="color: gray" data-toggle="modal" href="#myModal" data-backdrop="static" data-keyboard="false"><i class="fa fa-lock m-r-5"></i> ¿ Olvidaste tu Password?</a></p>
      </div>
    </div>
  </form>
  <script src="assets/js/bootstrap.min.js"></script>
</body>

</html>