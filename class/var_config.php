<?php
	error_reporting(E_ERROR | E_PARSE);

	/*==== Nombre de impuesto*/
	const IMPUESTO="IVA";

	/*==== Nombre de identificacion tributaria (Empresa)*/
	const IDENTIFICACION="NIT";

	/*==== Nombre de identificacion tributaria (Proveedores)*/
	const IDENTIFICACION2="NIT";

	/*==== Nombre de identificacion usuarios*/
	const DNI="DNI";

	/*==== Formato de numeros de telefono

		VALOR            ==>      EJEMPLO RESULTADO EN LOS FORMULARIOS

		(999) 99999999   ==>      (503) 77777777
		(9999) 999-9999  ==>      (5006) 777-7777
		99999999         ==>      77777777

	*/
	const PHONE="(999) 99999999";