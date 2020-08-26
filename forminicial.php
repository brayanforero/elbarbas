<?php

require_once './class/class.php';
require_once './class/funciones_basicas.php';
// session_start();

isExistsAdmistrator();
if (!empty($_SESSION['codigo'])) {
  echo "<script type='text/javascript' language='javascript'>
  alert('Ya existe una sesion activa');
  document.location = 'panel'
  </script>";
  exit;
}

if (isset($_POST['btn-submit'])) {
  $tra = new Login;
  $reg = null;
  $reg = $tra->RegistrarAdmin();
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
  <script type="text/javascript">
    jQuery.validator.addMethod("lettersonly", function(value, element) {
      return this.optional(element) || /^[a-zA-ZñÑáéíóúÁÉÍÓÚ ]+$/i.test(value);
    }, "Ingrese solo letras para Nombre de Usuario");
  </script>

</head>

<body class="">


  <section class="container">
    <h3><i class="fa fa-tasks"></i> Agrega un adminstrador para iniciar</h3><br>

    <!-- BASIC FORM ELELEMNTS -->

    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-border panel-warning widget-s-1">
          <div class="panel-heading">
            <h4 class="mb"><i class="fa fa-edit"></i> Formulario para Registro de Usuarios</h4>
          </div>
          <div class="panel-body">
            <form class="form-horizontal" method="post" action="#" name="usuario" id="newAdminstrator" enctype="multipart/form-data">

              <div id="error">
                <!-- error will be shown here ! -->
              </div>
              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Cédula de Usuario: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="cedula" id="cedula" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Cédula de Usuario" required="" aria-required="true">
                  <i class="fa fa-pencil form-control-feedback"></i>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Nombre de Usuario: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="nombres" id="nombres" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Nombre de Usuario" required="" aria-required="true">
                  <i class="fa fa-user form-control-feedback"></i>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Sexo de Usuario: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <select name="sexo" id="sexo" class='form-control' required="" aria-required="true">
                    <option value="">SELECCIONE</option>
                    <option value="MASCULINO">MASCULINO</option>
                    <option value="FEMENINO">FEMENINO</option>
                  </select>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Cargo de Usuario: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="cargo" id="cargo" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Cargo de Usuario" required="" aria-required="true">
                  <i class="fa fa-pencil form-control-feedback"></i>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Correo de Usuario: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="email" id="email" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Correo de Usuario" required="" aria-required="true">
                  <i class="fa fa-envelope-o form-control-feedback"></i>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Usuario de Acceso: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="usuario" id="usuario" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Usuario de Acceso" required="" aria-required="true">
                  <i class="fa fa-user form-control-feedback"></i>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Password de Acceso: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="password" id="password" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Password de Acceso" required="" aria-required="true">
                  <i class="fa fa-lock form-control-feedback"></i>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Repita Password: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" name="password2" id="password2" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Password de Acceso" required="" aria-required="true">
                  <i class="fa fa-lock form-control-feedback"></i>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Nivel de Acceso: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <select name="nivel" id="nivel" class='form-control' required="" aria-required="true">
                    <option value="">SELECCIONE</option>
                    <option selected value="ADMINISTRADOR">ADMINISTRADOR(A)</option>
                  </select>
                </div>
              </div>

              <div class="form-group has-feedback">
                <label class="col-sm-2 col-sm-2 control-label">Foto de Usuario: <span class="symbol required"></span></label>
                <div class="col-sm-10">
                  <input type="file" class="file" accept=".jpg" size="10" data-original-title="Subir Fotografia" data-rel="tooltip" placeholder="Suba su Fotografia" name="imagen" id="imagen" />
                  <small>
                    <p>Para Subir su Fotografia debe tener en cuenta lo siguiente:<br> * La Imagen debe ser extension .jpg<br> * La imagen no debe ser mayor de 200 KB</p>
                  </small>
                </div>
              </div>

              <div class="modal-footer">
                <button class="btn btn-danger" type="reset"><span class="fa fa-times"></span> Cancelar</button>
                <button type="submit" name="btn-submit" id="btn-submit" class="btn btn-primary"><span class="fa fa-save"></span> Registrar</button>
                <a href="index" class="btn btn-success"><span class="fa fa-mail-user "></span> Logearse</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>


  </section>
  <! --/wrapper -->

    <script src="assets/js/bootstrap.min.js"></script>
</body>

</html>