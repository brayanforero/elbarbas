<?php
require_once("class/class.php"); 
if(isset($_SESSION['acceso'])) { 
if ($_SESSION['acceso'] == "administrador" || $_SESSION["acceso"]=="vendedor") {

$tra = new Login();
$ses = $tra->ExpiraSession();

$reg = $tra->DetallesComprasPorId();

if(isset($_POST['btn-update']))
{
$reg = $tra->ActualizarDetallesCompras();
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
	<script type="text/javascript" src="assets/script/script2.js"></script>
    <script type="text/javascript" src="assets/script/validation.min.js"></script>
	<script type="text/javascript" src="assets/script/script.js"></script>

    <!-- Calendario -->
	<link rel="stylesheet" href="assets/calendario/jquery-ui.css" />
    <script src="assets/calendario/jquery-ui.js"></script>
		
		<script>
$(function () {
$.datepicker.setDefaults($.datepicker.regional["es"]);

$(".calendario").datepicker({
 closeText: 'Cerrar',
 prevText: '<Anterior',
 nextText: 'Siguiente>',
 currentText: 'Hoy',
 monthNamesShort: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
 monthNames: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
 dayNames: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
 dayNamesShort: ['Dom','Lun','Mar','Mie','Juv','Vie','Sab'],
 dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sa'],
 weekHeader: 'Sm',
 dateFormat: 'dd-mm-yy',
 firstDay: 1,
 //maxDate: 0,
 changeMonth: true,
 changeYear: true,
 yearRange: '2016:2030'
 //yearRange: '1900:' + new Date().getFullYear()
 //yearRange: "1900:2017"
});
});
</script>
  </head>

  <body onLoad="muestraReloj()">

  <section id="container" >
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
					
					<?php  if ($_SESSION['acceso'] == "administrador")  {  ?>	
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
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><?php
	if (isset($_SESSION['cedula'])) {
	if (file_exists("fotos/".$_SESSION['cedula'].".jpg")){
    echo "<img src='fotos/".$_SESSION['cedula'].".jpg?' class='img-circle' border='0' width='60'>"; 
}else{
    echo "<img src='fotos/avatar.jpg' class='img-circle' width='60'>"; 
} } else {
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
          	<h3><i class="fa fa-tasks"></i> Módulo Actualización para Detalle de Compra de Productos</h3><br>
          	
          	<!-- BASIC FORM ELELEMNTS -->
			
			<div class="row">
						    <div class="col-lg-12">
                                <div class="panel panel-border panel-warning widget-s-1">
               <div class="panel-heading"><h4 class="mb"><i class="fa fa-edit"></i> Formulario para Actualización de Detalle de Compra de Productos</h4> </div>
                                    <div class="panel-body">
<form class="form-horizontal" method="post"  action="#" name="updatedetallescompras" id="updatedetallescompras" data-id="<?php echo $reg[0]["coddetallecompra"] ?>">

                                                  <div id="error">
                                                 <!-- error will be shown here ! -->
                                                     </div>   
						 <div class="form-group has-feedback">
			 <input type="hidden" name="coddetallecompra" id="coddetallecompra" value="<?php echo $reg[0]['coddetallecompra']; ?>">
			 <input type="hidden" name="codcompra" id="codcompra" value="<?php echo $reg[0]['codcompra']; ?>">
         	 <input type="hidden" name="existencia" id="existencia" value="<?php echo $reg[0]['existencia']; ?>" >
                              <label class="col-sm-2 col-sm-2 control-label">Código Producto: <span class="symbol required"></span></label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="codproducto" id="codproducto" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Código de Producto" value="<?php echo $reg[0]['codproducto']; ?>" readonly="readonly">
                        <i class="fa fa-pencil form-control-feedback"></i>
                              </div>
                          </div>
						  
						   <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Nombre de Producto: <span class="symbol required"></span></label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="producto" id="producto" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Nombre de Producto" value="<?php echo $reg[0]['producto']; ?>" required="" aria-required="true">
                        <i class="fa fa-pencil form-control-feedback"></i>
                              </div>
                          </div>
						  
						  <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Categoria: <span class="symbol required"></span></label>
                              <div class="col-sm-10">
                                  <select name="codcategoria" id="codcategoria" class='form-control' required="" aria-required="true">
												<option value="">SELECCIONE</option>
			<?php
			$cat = new Login();
			$cat = $cat->ListarCategorias();
			for($i=0;$i<sizeof($cat);$i++){
		              ?>
	<option value="<?php echo $cat[$i]['codcategoria']; ?>"<?php if (!(strcmp($reg[0]['codcategoria'], htmlentities($cat[$i]['codcategoria'])))) {echo "selected=\"selected\"";} ?>><?php echo $cat[$i]['nomcategoria']; ?></option>			  
                      <?php } ?>
							    </select> 
                              </div>
                          </div>
						  
						  
						  <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Precio Compra: <span class="symbol required"></span></label>
                              <div class="col-sm-10"> 
<input class="form-control number calculo" type="text" name="precio1" id="precio1" onKeyPress="EvaluateText('%f', this);" onBlur="this.value = NumberFormat(this.value, '2', '.', '')" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Precio #1" value="<?php echo $reg[0]['precio1']; ?>" required="" aria-required="true"> <i class="fa fa-money form-control-feedback"></i>
                              </div>
                          </div>
										 
							
						  
						   <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Cantidad Compra: <span class="symbol required"></span></label>
                              <div class="col-sm-10">
                                   <input class="form-control calculo" type="text" name="cantcompra" id="cantcompra" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Cantidad de Compra" value="<?php echo $reg[0]['cantcompra']; ?>" required="" aria-required="true">
                        <i class="fa fa-pencil form-control-feedback"></i>
                              </div>
                          </div>	
						  
						  <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Importe: <span class="symbol required"></span></label>
                              <div class="col-sm-10"> 
<input class="form-control number" type="text" name="importecompra" id="importecompra" onKeyPress="EvaluateText('%f', this);" onBlur="this.value = NumberFormat(this.value, '2', '.', '')" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Importe" value="<?php echo $reg[0]['importecompra']; ?>" readonly="readonly"> <i class="fa fa-money form-control-feedback"></i>
                              </div>
                          </div>		 
									 <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Precio Venta: <span class="symbol required"></span></label>
                              <div class="col-sm-10"> 
<input class="form-control number" type="text" name="precio2" id="precio2" onKeyPress="EvaluateText('%f', this);" onBlur="this.value = NumberFormat(this.value, '2', '.', '')" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Precio #2" value="<?php echo $reg[0]['precio2']; ?>" required="" aria-required="true"><i class="fa fa-money form-control-feedback"></i>
                              </div>
                          </div>
						  
						  <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">N° de Lote: </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="lote" id="lote" value="<?php echo $reg[0]['lote']; ?>" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese N° de Lote" readonly="readonly" aria-required="true">
                        <i class="fa fa-barcode form-control-feedback"></i>
                              </div>
                          </div>
						  
						  
						  <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Tiene Iva: </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="ivaproductoc" id="ivaproductoc" value="<?php echo $reg[0]['ivaproductoc']; ?>" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Si Tiene Iva" readonly="readonly" aria-required="true">
                        <i class="fa fa-money form-control-feedback"></i>
                              </div>
                          </div>
						  
						  <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Fecha de Vencimiento: <span class="symbol required"></span></label>
                              <div class="col-sm-10">
                                   <input class="form-control calendario" type="text" name="vence" id="vence" value="<?php echo $reg[0]['vence']; ?>" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" placeholder="Ingrese Fecha de Vencimiento" required="" aria-required="true">
                        <i class="fa fa-calendar form-control-feedback"></i>
                              </div>
                          </div> 
						  
						  <div class="form-group has-feedback">
                              <label class="col-sm-2 col-sm-2 control-label">Fecha Compra: </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" name="fechadetallecompra" id="fechadetallecompra" onKeyUp="this.value=this.value.toUpperCase();" autocomplete="off" value="<?php echo date("d-m-Y h:i:s",strtotime($reg[0]['fechadetallecompra'])); ?>" readonly="readonly">
                        <i class="fa fa-calendar form-control-feedback"></i>
                              </div>
                          </div>
						                           
						  <div class="modal-footer"> 
                          <button class="btn btn-danger" type="reset"><span class="fa fa-times"></span> Cancelar</button> 
                          <button type="submit" name="btn-update" id="btn-update" class="btn btn-primary"><span class="fa fa-edit"></span> Actualizar</button> 
						  <a href="detallescompras" class="btn btn-success"><span class="fa fa-mail-reply "></span> Regresar</a> 
                          </div>
                      </form>
                                  </div>
                                </div>
                            </div>
						 </div>
						 
          	
		</section><! --/wrapper -->
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

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
<?php } else { ?>	
		<script type='text/javascript' language='javascript'>
	    alert('USTED NO TIENE ACCESO A ESTE MODULO, NO ERES EL ADMINISTRADOR DEL SISTEMA')  
		document.location.href='panel.php'	 
        </script> 
<?php } } else { ?>
		<script type='text/javascript' language='javascript'>
	    alert('USTED NO TIENE ACCESO A ESTA PAGINA, DEBERA DE INICIAR SESION')  
		document.location.href='logout.php'	 
        </script> 
<?php } ?>