<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../componentes/css/estilo.css" type="text/css" />
</head>
<body>
<br>
<h1>SisPAM - Sistema de Pronto Atendimento M�dico</h1>
<table width="89%" id="AreaMsg" class="AreaMsg">			
	<tr>	
	<td>	
		<div id="MensagensErro" >						
			<s:fielderror cssErrorClass="errorMessage" />
			<s:actionmessage />
		</div>
	</td>
	</tr>
	</table>
</body>
</html>