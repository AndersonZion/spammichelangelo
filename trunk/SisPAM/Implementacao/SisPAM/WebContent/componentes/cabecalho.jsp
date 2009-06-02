<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>


<%@page import="br.com.sispam.dominio.Usuario"%>
<%@page import="br.com.sispam.action.LoginAction"%><html>
<head>

<script language="JavaScript">
	function logoff(){
		window.parent.frames.location = "../login.jsp"
		}

	function acessaMenu(nmMenu){
		switch (nmMenu){		
		case "ADM":
			window.parent.frames[1].location = "menuAdm.jsp"
		break;
		case "ATD":
			window.parent.frames[1].location = "menuAtd.jsp"
		break;
		case "CAD":
			window.parent.frames[1].location = "menuCad.jsp"
		break;
		case "REL":
			window.parent.frames[1].location = "menuRel.jsp"
		break;
		default:
			break;		
		}
		window.parent.frames[2].location = "defaut.jsp"
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="../resources/styles.css" type="text/css" />
</head>
<body>

<div id="tabs">
<img src="img/simbolo.jpg" width="240px" align="left">
<br>
<s:url id="deslogar" action="loginAction!deslogar.action"/>
<table width="750px" height="51px">
	<tr>
		<td class="nomeSistema" width="500px">Sistema de Pronto Atendimento M�dico</td>
		<td class="userLogado" width="240">Usu�rio logado: <%=((Usuario) session.getAttribute("usuarioLogado")).getAcesso().toUpperCase()%>
		<br>Login em: <%=((Usuario) session.getAttribute("dtHrAcess")).getDtHoraAcesso()%><br>
		<a href="javascript:logoff()" ><b>Sair</b></a></td>

	</tr>
</table>

<ul>
    <li><a class="link" href="javascript:acessaMenu('ADM')"><span>ADMINISTRATIVO</span></a></li>
	<li><a class="link" href="javascript:acessaMenu('ATD')"><span>ATENDIMENTO</span></a></li>
    <li><a class="link" href="javascript:acessaMenu('CAD')"><span>CADASTRO</span></a></li>
    <li><a class="link" href="javascript:acessaMenu('REL')"><span>RELAT�RIOS</span></a></li>
   </ul>
</div>
</body>
</html>