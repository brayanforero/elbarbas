<?php
include "class/var_config.php";
require_once("class/class.php");
if (isset($_SESSION['acceso'])) {
    if ($_SESSION['acceso'] == "administrador" || $_SESSION["acceso"] == "vendedor") {

        $tra = new Login();
        $ses = $tra->ExpiraSession();

        if (isset($_POST['btn-submit'])) {
            $reg = $tra->RegistrarProveedores();
            exit;
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
            <script type="text/javascript" src="assets/script/jquery.mask.js"></script>
            <script type="text/javascript" src="assets/script/script2.js"></script>
            <script type="text/javascript" src="assets/script/validation.min.js"></script>
            <script type="text/javascript" src="assets/script/script.js"></script>
            <script type="text/javascript">
                jQuery.validator.addMethod("lettersonly", function(value, element) {
                    return this.optional(element) || /^[a-zA-ZñÑáéíóúÁÉÍÓÚ. ]+$/i.test(value);
                }, "Ingrese solo letras para Persona de Contacto");
            </script>

            <script type="text/javascript">
                $(document).ready(function() {
                    $("#tlfproveedor").mask("<?php echo PHONE; ?>");
                });
            </script>
            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        </head>

        <body onLoad="muestraReloj()">

            <section id="container">
                <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
                <!--header start-->
                <header class="header black-bg">
                    <div class="sidebar-toggle-box">
                        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Menú de Navegación"></div>
                    </div>
                    <!--logo start-->
                    <a href="panel" class="logo"></a>
                    <!--logo end-->
                    <div class="nav notify-row" id="top_menu">
                        <!--  notification start -->
                        <ul class="nav top-menu">
                            <!-- settings start -->
                            <li class="dropdown">
                                <a href="password" class="dropdown-toggle">
                                    <i class="fa fa-edit"></i> Cambiar Password
                                    <span class="badge bg-theme"><i class="fa fa-edit tooltips" data-placement="right" data-original-title="Cambiar Password"></i></span>
                                </a>
                            </li>

                            <li class="dropdown">
                                <a href="bloqueo" class="dropdown-toggle">
                                    <i class="fa fa-minus-circle"></i> Bloquear Cuenta
                                    <span class="badge bg-theme"><i class="fa fa-minus-circle tooltips" data-placement="right" data-original-title="Bloquear Cuenta"></i></span>
                                </a>
                            </li>

                            <?php if ($_SESSION['acceso'] == "administrador") {  ?>
                                <li class="dropdown">
                                    <a href="configuracion" class="dropdown-toggle">
                                        <i class="fa fa-cog"></i> Configuración
                                        <span class="badge bg-theme"><i class="fa fa-cog tooltips" data-placement="right" data-original-title="Configuración"></i></span>
                                    </a>
                                </li>
                            <?php } ?>

                            <!-- settings end -->

                        </ul>
                        <!--  notification end -->
                    </div>


                    <div class="top-menu">
                        <ul class="nav pull-right top-menu">
                            <li><a class="logout" href="logout"><i class="fa fa-power-off"></i> Salir</a></li>
                        </ul>
                    </div>
                </header>
                <!--header end-->

                <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
                <!--sidebar start-->
                <aside>
                    <div id="sidebar" class="nav-collapse ">
                        <!-- sidebar menu start-->
                        <ul class="sidebar-menu" id="nav-accordion">

                            <p class="centered"><?php
                                                if (isset($_SESSION['cedula'])) {
                                                    if (file_exists("fotos/" . $_SESSION['cedula'] . ".jpg")) {
                                                        echo "<img src='fotos/" . $_SESSION['cedula'] . ".jpg?' class='img-circle' border='0' width='60'>";
                                                    } else {
                                                        echo "<img src='fotos/avatar.jpg' class='img-circle' width='60'>";
                                                    }
                                                } else {
                                                    echo "<img src='fotos/avatar.jpg' class='img-circle' width='60'>";
                                                }
                                                ?></p>
                            <h5 class="centered"><?php echo estado($_SESSION['acceso']); ?></h5>

                            <!----- INICIO DE MENU ----->
                            <?php include('menu.php'); ?>
                            <!----- FIN DE MENU ----->


                        </ul>
                        <!-- sidebar menu end-->
                    </div>
                </aside>
                <!--sidebar end-->

                <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
                <!--main content start-->
                <section id="main-content">
                    <section class="wrapper">
                        <h3><i class="fa fa-tasks"></i> Módulo Registro de Proveedores</h3><br>

                        <!-- BASIC FORM ELELEMNTS -->

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-border panel-warning widget-s-1">
                                    <div class="panel-heading">
                                        <h4 class="mb"><i class="fa fa-edit"></i> Formulario para Registro de Proveedores</h4>
                                    </div>
                                    <div class="panel-body">
                                        <form class="form-horizontal" method="post" action="#" name="proveedores" id="proveedores">

                                            <div id="error">
                                                <!-- error will be shown here ! -->
                                            </div>
                                            <div class="form-group has-feedback">
                                                <label class="col-sm-2 col-sm-2 control-label"><?php echo IDENTIFICACION2; ?> de Proveedor: <span class="symbol required"></span></label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="ritproveedor" id="ritproveedor" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese <?php echo IDENTIFICACION2; ?> de Proveedor" required="" aria-required="true">
                                                    <i class="fa fa-pencil form-control-feedback"></i>
                                                </div>
                                            </div>

                                            <div class="form-group has-feedback">
                                                <label class="col-sm-2 col-sm-2 control-label">Nombre de Proveedor: <span class="symbol required"></span></label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="nomproveedor" id="nomproveedor" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Nombre de Proveedor" required="" aria-required="true">
                                                    <i class="fa fa-pencil form-control-feedback"></i>
                                                </div>
                                            </div>

                                            <div class="form-group has-feedback">
                                                <label class="col-sm-2 col-sm-2 control-label">Dirección Proveedor: <span class="symbol required"></span></label>
                                                <div class="col-sm-10">
                                                    <textarea name="direcproveedor" class="form-control" id="direcproveedor" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Dirección de Proveedor" required="" aria-required="true"></textarea>
                                                    <i class="fa fa-map-marker form-control-feedback"></i>
                                                </div>
                                            </div>

                                            <div class="form-group has-feedback">
                                                <label class="col-sm-2 col-sm-2 control-label">Telefono Proveedor: <span class="symbol required"></span></label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="tlfproveedor" id="tlfproveedor" onKeyUp="this.value=this.value.toUpperCase();validateNumberPhone(this)" autocomplete="off" placeholder="Ingrese Telefono de Proveedor" required="" aria-required="true">
                                                    <i class="fa fa-phone form-control-feedback"></i>
                                                </div>
                                            </div>

                                            <div class="form-group has-feedback">
                                                <label class="col-sm-2 col-sm-2 control-label">Correo Proveedor: <span class="symbol required"></span></label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="emailproveedor" id="emailproveedor" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Correo de Proveedor" required="" aria-required="true">
                                                    <i class="fa fa-envelope-o form-control-feedback"></i>
                                                </div>
                                            </div>

                                            <div class="form-group has-feedback">
                                                <label class="col-sm-2 col-sm-2 control-label">Persona de Contacto: <span class="symbol required"></span></label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="contactoproveedor" id="contactoproveedor" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Persona de Contacto" required="" aria-required="true">
                                                    <i class="fa fa-user form-control-feedback"></i>
                                                </div>
                                            </div>

                                            <div class="modal-footer">
                                                <button class="btn btn-danger" type="reset"><span class="fa fa-times"></span> Cancelar</button>
                                                <button type="submit" name="btn-submit" id="btn-submit" class="btn btn-primary"><span class="fa fa-save"></span> Registrar</button>
                                                <a href="proveedores" class="btn btn-success"><span class="fa fa-mail-reply "></span> Regresar</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </section>
                    <! --/wrapper -->
                </section><!-- /MAIN CONTENT -->

                <!--main content end-->
                <!--footer start-->
                <footer class="site-footer">
                    <div class="text-center">
                        © <span class="current-year"></span>
                        <a id="scroll-top" href="#" class="go-top">
                            <i class="fa fa-angle-up"></i>
                        </a>
                    </div>
                </footer>
                <!--footer end-->
            </section>

            <!-- js placed at the end of the document so the pages load faster 
    <script src="assets/js/jquery.js"></script>-->
            <script src="assets/js/bootstrap.min.js"></script>
            <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
            <script src="assets/js/jquery.scrollTo.min.js"></script>
            <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


            <!--common script for all pages-->
            <script src="assets/js/common-scripts.js"></script>

            <!--script for this page-->
            <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

            <!--custom switch-->
            <script src="assets/js/bootstrap-switch.js"></script>

            <!--custom tagsinput-->
            <script src="assets/js/jquery.tagsinput.js"></script>

            <!--custom checkbox & radio-->
            <script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>

            <script>
                //custom select box

                $(function() {
                    $('select.styled').customSelect();
                });
            </script>

        </body>

        </html>
    <?php } else { ?>
        <script type='text/javascript' language='javascript'>
            alert('USTED NO TIENE ACCESO A ESTE MODULO, NO ERES EL ADMINISTRADOR DEL SISTEMA')
            document.location.href = 'panel.php'
        </script>
    <?php }
} else { ?>
    <script type='text/javascript' language='javascript'>
        alert('USTED NO TIENE ACCESO A ESTA PAGINA, DEBERA DE INICIAR SESION')
        document.location.href = 'logout.php'
    </script>
<?php } ?>