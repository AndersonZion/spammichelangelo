<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="componentes/css/estilo.css" type="text/css" />
	<script type="text/javascript" src="componentes/js/sispam.js"></script>
	<link rel="stylesheet" href="../componentes/css/estilo.css" type="text/css" />
	<script type="text/javascript" src="../componentes/js/sispam.js"></script>
	<title>Relat�rio de Conv�nio</title>
</head>
<body>
<table width="89%" id="cmnUsr" class="caminhoUsuario">
	<tr>
		<td><br>
		<div>Relat�rio<img src="../componentes/img/seta.gif" />Relat�rio de Conv�nio<img
			src="../componentes/img/seta.gif" />Emitir</div>
		</td>
	</tr>
</table>
<h2>Emiss�o de Relat�rio de Conv�nio</h2>


<form action="../relatorioConvenio.sispam" method="post">
		<table class="tabela_moldura" >
			<tr>			
        	<td colspan="2"><label class="label">Tipo de Relat�rio</label>
        	</td><td colspan="4">
        	<!-- Tipo de Relatorio -->        	
			<select id="cmbTipRel" name="tipoRelatorio">
				<option value="1">Sint�tico</option>			
				<option value="2">Anal�tico</option>
			</select>
        	</td>
			</tr>			
			<tr>			
        	<td colspan="2"><label class="label">Ordena��o</label>
			</td><td colspan="2">
        	<!-- Categorizacao -->        	
			<select id="cmbOrdRel" name="filtro">
				<option value="1">Nome do Conv�nio</option>			
				<option value="2">CNPJ</option>
				<option value="3">C�digo ANS</option>
			</select>
        	</td>
			<td><input type="submit" value="Consultar" class="button"/></td>
			</tr>	
		</table>
	</form>
	
	
</body>
</html>