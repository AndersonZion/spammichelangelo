<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../componentes/css/estilo.css" type="text/css" />
<script type="text/javascript" src="../componentes/js/sispam.js"></script>
<link rel="stylesheet" href="componentes/css/estilo.css" type="text/css" />
<script type="text/javascript" src="componentes/js/sispam.js"></script>
<script type="text/javascript" src="componentes/js/jquery/jquery.js"></script>
<script type="text/javascript" src="../componentes/js/jquery/jquery.js"></script>
<script type="text/javascript" src="js/jquery/ui.core.js"></script>
<script type="text/javascript" src="componentes/js/jquery/ui.datepicker.js"></script>
<script type="text/javascript" src="../componentes/js/jquery/ui.datepicker.js"></script>
<script type="text/javascript" src="componentes/js/jquery/ui.datepicker-pt-BR.js"></script>
<script type="text/javascript" src="../componentes/js/jquery/ui.datepicker-pt-BR.js"></script>
<link rel="stylesheet" href="../componentes/js/jquery/css/ui.all.css" type="text/css" media="screen" />
<link rel="stylesheet" href="componentes/js/jquery/css/ui.all.css" type="text/css" media="screen" />
<title>Insert title here</title>

<SCRIPT language="javaScript">
	function marcaEspecialidades(){
		var elemento = document.getElementById("idDouble");
		for(var i=0; i < elemento.size; i++){
			elemento.options[i].selected = true;
			}
		return false;
		}
	
</script>
<script type="text/javascript">
		 $(document).ready(function(){
			calendario('data');
			calendario('data1');
	 });
	 function calendario(idCampo){
				var id = '#'+idCampo;
				 $(id).datepicker({
							 showMonthAfterYear: false,
							 showOtherMonths: true,
							 changeMonth: true,
							 changeYear: true,
							 gotoCurrent: true
				 });
			}
	</script>
	
	<SCRIPT type="text/javascript">
	
		function definirTipo(){
			document.forms[0].submit();
		}

		function preparaInclusao(){
			document.forms[1].submit();
	
			}
		function preparaInclusaoDois(){
			document.forms[2].submit();
			}

		function preparaInclusaoAgendamento(){
			var id = document.getElementById("especialidade").value;
			alert(id);
			if(id != null){
				document.getElementById("espM").value = id;
				}
			}
	</SCRIPT>

</head>
<body>
<table width="89%" id="cmnUsr" class="caminhoUsuario">
	<tr>
		<td><br>
		<div>Atendimento<img src="../componentes/img/seta.gif" /> Agendamento<img
			src="../componentes/img/seta.gif" /> Incluir</div>
		</td>
	</tr>
</table>
<h2>Agendamento</h2>
	<s:fielderror theme="simple" cssClass="errorMessage"  cssErrorStyle="errorMessage" cssErrorClass="errorMessage"/>
	<s:actionmessage theme="simple" cssClass="sucessMessage" />
	
	<table border="0" width="80%" class="tabela_moldura" cellpadding="3" cellspacing="4">
		<tr>
			<td><label class="label">Agendamento por:</label></td>
			<s:form action="agendamentoAction!definirTipo.action" theme="simple">
				<td>
					<s:radio list="#{'med':'M�dico', 'esp':'Especialidade'}" name="tipo" theme="simple" onclick="definirTipo()"/>
			</td>
			</s:form>
			<td>
			<s:form action="agendamentoAction!preparaInclusao.action" theme="simple">
				<s:hidden name="tipo" value="%{tipo}"/>
				<s:if test="tipo.equals('med')">
					<label class="label">M�dico:</label>&nbsp;&nbsp;<s:select list="medicos" headerKey="0" headerValue="--Selecione--" listKey="id" name="agendamento.medico.id" listValue="usuario.nome" theme="simple" onchange="preparaInclusao()"/>
				</s:if>
				<s:elseif test="tipo.equals('esp')">
					<label class="label">Especialidades:</label>&nbsp;&nbsp;<s:select list="especialidades" headerKey="0" headerValue="--Selecione--" listKey="id" name="agendamento.especialidadeMedica.id" listValue="descricao" theme="simple" onchange="preparaInclusao()"/>
				</s:elseif>
			</s:form>
			</td>
			<s:if test="medico != null">
				<td><label class="label">Especialidades do Dr.&nbsp;&nbsp;<s:property value="medico.usuario.nome"/></label>&nbsp;<s:select headerKey="0" headerValue="--Selecione--" list="medico.especialidades" id="especialidade" theme="simple" name="agendamento.especialidadeMedica.id" listKey="id" listValue="descricao" /></td>
			</s:if>
			<s:elseif test="especialidadeMedica != null">
				<s:form action="agendamentoAction!preparaInclusao.action" theme="simple">
					<s:hidden name="tipo"  value="%{tipo}"/>
					<s:hidden name="agendamento.especialidadeMedica.id" value="%{especialidadeMedica.id}"/>
					<td><label class="label">M�dicos de&nbsp;&nbsp;<s:property value="especialidadeMedica.descricao"/></label>&nbsp;<s:select headerKey="0" headerValue="--Selecione--" list="especialidadeMedica.medicos" theme="simple" name="agendamento.medico.id" listKey="id" listValue="usuario.nome" onchange="preparaInclusaoDois()" /></td>
				</s:form>
			</s:elseif>
		</tr>
		</table>
		
	<s:if test="isAgenda > 0">
		<table  class="tabela_listagem" width="40%" >
			<tr>
				<th width="50%" bgcolor="#A7C2DA" scope="col"><span
				class="style5">Dias de Trabalho</span></th>
				<th width="50%" bgcolor="#A7C2DA" scope="col"><span
				class="style5">Hor�rio de Trabalho</span></th>
			</tr>
			<tr>
				<td>
					<s:iterator value="agendamento.medico.dias">
						<s:property value="sigla"/>
					</s:iterator>
				</td>
				<td>
					<s:property value="agendamento.medico.horaInicio+' �s '+agendamento.medico.horaFim"/>
				</td>
			</tr>
		</table>
	</s:if>
	
<s:if test="formulario == true">
	<s:form action="agendamentoAction!salvarAgendamento.action" theme="simple">	
		<s:hidden name="agendamento.medico.id" value="%{agendamento.medico.id}"/>
		<s:hidden name="tipo" value="%{tipo}"/>
		<s:hidden id="espM" name="agendamento.especialidadeMedica.id" value="%{agendamento.especialidade.id}"/>	
		<table  border="0"  class="tabela_moldura" cellpadding="3" cellspacing="4">
			<tr>
				<td><label class="label">Tipo</label></td><td><s:select headerKey="0" headerValue="--Selecione--" list="tipoAgendamento" name="agendamento.tipo" listKey="codigo" theme="simple"/></td>
				<td><label class="label">Data</label>&nbsp;&nbsp;<s:textfield theme="simple" name="dataAgendamento" size="12" id="data"/></td>
				<td><label class="label">Hor�rio</label>&nbsp;&nbsp;<s:textfield theme="simple" name="horario" size="10" maxlength="5"/></td>
				<td><label class="label">Paciente</label>&nbsp;&nbsp;<s:select list="pacientes" headerKey="0" headerValue="--Selecione--" listKey="id" name="agendamento.paciente.id" listValue="usuario.nome" theme="simple"/></td>
			</tr>
			<tr >
				<td colspan="6" rowspan="3"><label class="label">Observa��o</label>&nbsp;&nbsp;<s:textarea name="agendamento.observacao" cssStyle="width:90%" theme="simple"/></td>
				
			</tr>
			<tr>
				<td>
					<s:submit value="Salvar" cssClass="button" theme="simple" onclick="preparaInclusaoAgendamento()"/>
				</td>
			</tr>
		</table>
	</s:form>
</s:if>		

	
</body>
</html>