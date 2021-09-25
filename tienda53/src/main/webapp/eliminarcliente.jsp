<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tama�o de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pesta�a -->
<title>Eliminar cliente</title>
<!-- bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<!-- Cargando mi hoja de estilo -->
<link href="style.css" rel="stylesheet" type="text/css" />



</head>


<body>
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html"><i
				class="fas fa-fish"></i>Bienvenid@ a la Tienda virtual</a>
		</div>
	</nav>

	<!-- Navbar modulos-->
	<nav class="navbar navbar-dark bg-primary">
		<div class="container">
			<a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-users"></i> Usuarios
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-address-book"></i> Clientes
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-truck"></i> Proveedores
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-apple-alt"></i> Productos
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-money-check-alt"></i> Ventas
			</a> <a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-clipboard-list"></i> Reportes
			</a>
		</div>
	</nav>

	<div style="padding-left: 5px">
	<center>
		<div style="padding-left: 5px;">
	<div class="badge bg-primary text-wrap" style="width: 15rem;" ><i class="fas fa-users"></i> Datos del cliente a eliminar
</div>
		


	<center>
	<div style="padding-left: 1px">
		
		<div class="containerEliminarUsuario">
		
			<div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error al eliminar el cliente, verifique que exista la c�dula</div>
					
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Cliente eliminado con exito</div>

			<form id="form1">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">C�dula</span> <input
						type="text" class="form-control"
						placeholder="Ingresar n�mero de c�dula"
						aria-describedby="basic-addon1" required id="cedula_cliente">
				</div>

			</form>

			<button type="button" class="btn btn-danger" onclick="eliminar()">
				<i class="fas fa-check"></i> Eliminar cliente
			</button>
		</div>

	</div>
	</center>

			
			
			<br>
			<br>
			<br>
			
			<div class="nuevo">
				<div class="btn-group-horizontal">
  				<a href="listaclientes.jsp" class="btn btn-primary active" style="width: 15rem; background-color: #006666" aria-current="page"><i class="fas fa-users"></i> Listar Clientes</a>
  				<a href="eliminarcliente.jsp" class="btn btn-primary active" style="width: 15rem; background-color: #990000" aria-current="page"><i class="fas fa-trash"></i> Eliminar Cliente</a>
 				<a href="actualizarcliente.jsp" class="btn btn-primary active" style="width: 15rem; background-color: #000099" aria-current="page"><i class="fas fa-pen-alt"></i> Actualizar Cliente</a>
 				<a href="buscarcliente.jsp" class="btn btn-primary active" style="width: 15rem; background-color: #333333" aria-current="page"><i class="fas fa-search"></i> Buscar Cliente</a>
				</div>
			</div>
		</div>
	</center>

	</div>
	<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
				<a class="navbar-brand links" href="#">&copy; 2021 Tienda Virtual Grupo 53 Equipo 3 </a>
			</div>
		</div>
	</nav>
	<script>
		function eliminar() {
			var y = document.getElementById("cedula_cliente").value;
			var req = new XMLHttpRequest();
			var coincidencia = false;
			req.open('GET', 'http://localhost:8080/listarclientes', false);
			req.send(null);
			var usuarios = null;
			if (req.status == 200)
				usuarios = JSON.parse(req.responseText);
			console.log(JSON.parse(req.responseText));

			for (i = 0; i < usuarios.length; i++) {
				
				console.log(usuarios[i].cedula_cliente);
				if (usuarios[i].cedula_cliente == y) {
					console.log(usuarios[i].cedula_cliente + " " + y);
					coincidencia = true
					break;
				}
			}
			console.log(coincidencia);

			if (coincidencia != false) {
				var cedula=document.getElementById("cedula_cliente").value;
				
				var xhr = new XMLHttpRequest();
				xhr.open("DELETE", "http://localhost:8080/eliminarcliente?cedula_cliente="+cedula);
				
				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("cedula_cliente").value = "";
				xhr.send();

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				
				document.getElementById("cedula_cliente").value = "";;
			}
		}
	</script>

</body>
</html>