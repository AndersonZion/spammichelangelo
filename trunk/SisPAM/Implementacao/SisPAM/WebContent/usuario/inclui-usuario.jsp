<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../componentes/css/estilo.css" type="text/css" />
<script type="text/javascript" src="../componentes/js/sispam.js"></script>
<link rel="stylesheet" href="componentes/css/estilo.css" type="text/css" />
<script type="text/javascript" src="componentes/js/sispam.js"></script>
<title>Insert title here</title>
</head>
<body>
<table width="89%" id="cmnUsr" class="caminhoUsuario">
	<tr>
		<td><br>
		<div>Cadastro<img src="../componentes/img/seta.gif" /> Usu�rio<img
			src="../componentes/img/seta.gif" /> Incluir</div>
		</td>
	</tr>
</table>
<h2>Cadastro de Usu�rios</h2>
<s:form action="usuarioAction!definirTelaUsuario.action">
	<table class="tabela_moldura">
		<tr>
			<td><label class="label">Selecione o Perfil&nbsp;</label> <s:select
				list="perfils" headerKey="0" id="perfil" headerValue="Selecione"
				name="codigoPerfilSelecionado" onchange="return definirPerfil()"
				listKey="codigo" theme="simple" /></td>
		</tr>
	</table>
</s:form>
<div id="MensagensErro" >	
	<s:fielderror theme="simple" cssClass="errorMessage" />
	<s:actionmessage theme="simple" cssClass="sucessMessage" />
</div>

<s:if test="codigoPerfilSelecionado == 1 || codigoPerfilSelecionado == 2">
	<s:form id="formPerfil" action="usuarioAction!salvarUsuario.action">
	<s:hidden name="codigoPerfilSelecionado" value="%{codigoPerfilSelecionado}" />
	<s:hidden name="usuario.id" value="%{usuario.id}"/>
		<table border="0" width="90%" class="tabela_moldura" cellpadding="3" cellspacing="4">
			<tr>
				<td><label class="label">Nome:</label></td>
				<td><s:textfield theme="simple" name="usuario.nome" size="60" maxlength="60" /></td>
				<td><label class="label">CPF:</label></td>
				<td><s:textfield theme="simple" name="usuario.cpf" size="12" maxlength="11" /></td>
			</tr>
			<tr>
				<td><label class="label">RG:</label></td>
				<td><s:textfield theme="simple" name="rgAux" size="15"	maxlength="15" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="label">Expedidor:&nbsp;&nbsp;</label>
				<s:textfield theme="simple" name="usuario.expedidorRg" size="15" maxlength="15" /></td>
				<td><label class="label">Sexo:</label></td>
				<td><s:select list="sexos" theme="simple" name="usuario.sexo" headerKey="0" headerValue="" listKey="sigla" /></td>
			</tr>
			<tr>
				<td><label class="label">Endere�o:</label></td>
				<td><s:textfield theme="simple" name="usuario.endereco"	size="60" maxlength="60" /></td>
				<td><label class="label">Cidade:</label></td>
				<td><s:textfield theme="simple" name="usuario.cidade" size="12" maxlength="11" /></td>
			</tr>
			<tr>
				<td><label class="label">Estado:</label></td>
				<td>
					<select name="usuario.uf">
						<option value="0">Selecione</option>
						<option value="AC">Acre</option>
						<option value="AL">Alagoas</option>
						<option value="AP">Amap�</option>
						<option value="AM">Amazonas</option>
						<option value="BA">Bahia</option>
						<option value="CE">Cear�</option>
						<option value="DF">Distrito Federal</option>
						<option value="ES">Esp�rito Santo</option>
						<option value="GO">Goi�s</option>
						<option value="MA">Maranh�o</option>
						<option value="MT">Mato Grosso</option>
						<option value="MS">Mato Grosso do Sul</option>
						<option value="MG">Minas Gerais</option>
						<option value="PA">Par�</option>
						<option value="PB">Para�ba</option>
						<option value="PR">Paran�</option>
						<option value="PE">Pernambuco</option>
						<option value="PI">Piau�</option>
						<option value="RJ">Rio de Janeiro</option>
						<option value="RN">Rio Grande do Norte</option>
						<option value="RS">Rio Grande do Sul</option>
						<option value="RO">Rond�nia</option>
						<option value="RR">Roraima</option>
						<option value="SC">Santa Catarina</option>
						<option value="SP">S�o Paulo</option>
						<option value="SE">Sergipe</option>
						<option value="TO">Tocantins</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="label">CEP:&nbsp;&nbsp;</label>
					<s:textfield theme="simple" name="cepAux" size="15" maxlength="8" />
				</td>
				<td><label class="label">DDD:</label></td>
				<td>
					<s:textfield theme="simple" name="dddAux" size="2"	maxlength="2" />&nbsp;&nbsp; 
					<label class="label">Tel:&nbsp;&nbsp;</label>
					<s:textfield theme="simple" name="telefoneAux" size="8" maxlength="8" />
				</td>
			</tr>
			<tr>
				<td><label class="label">Login:</label></td>
				<td><s:textfield theme="simple" name="usuario.acesso" maxlength="25" size="25" />&nbsp;
				<label class="label">Senha:</label><s:password theme="simple" name="usuario.senha"	maxlength="25" size="25" /></td>
				<td><label class="label">E-mail:</label></td>
				<td><s:textfield theme="simple" name="usuario.email" size="30" maxlength="30" /></td>
				
			</tr>
			<tr>
				<td><s:submit value="Salvar" cssClass="button" /></td>
			</tr>
	</table>
</s:form>
</s:if>	
<s:elseif test="codigoPerfilSelecionado == 3">
	<s:form action="medicoAction!salvarMedico.action">
	<s:hidden name="codigoPerfilSelecionado" value="%{codigoPerfilSelecionado}" />
	<s:hidden name="usuario.id" value="%{usuario.id}"/>
		<table border="0" width="90%" class="tabela_moldura" cellpadding="3" cellspacing="4">
			<tr>
				<td><label class="label">Nome:</label></td>
				<td><s:textfield theme="simple" name="usuario.nome" size="60" maxlength="60" /></td>
				<td><label class="label">CPF:</label></td>
				<td><s:textfield theme="simple" name="usuario.cpf" size="12" maxlength="11" /></td>
			</tr>
			<tr>
				<td><label class="label">RG:</label></td>
				<td><s:textfield theme="simple" name="rgAux" size="15"	maxlength="15" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="label">Expedidor:&nbsp;&nbsp;</label>
				<s:textfield theme="simple" name="usuario.expedidorRg" size="15" maxlength="15" /></td>
				<td><label class="label">Sexo:</label></td>
				<td><s:select list="sexos" theme="simple" name="usuario.sexo" headerKey="0" headerValue="" listKey="sigla" /></td>
			</tr>
			<tr>
				<td><label class="label">Endere�o:</label></td>
				<td><s:textfield theme="simple" name="usuario.endereco"	size="60" maxlength="60" /></td>
				<td><label class="label">Cidade:</label></td>
				<td><s:textfield theme="simple" name="usuario.cidade" size="12" maxlength="11" /></td>
			</tr>
			<tr>
				<td><label class="label">Estado:</label></td>
				<td>
					<select name="usuario.uf">
						<option value="0">Selecione</option>
						<option value="AC">Acre</option>
						<option value="AL">Alagoas</option>
						<option value="AP">Amap�</option>
						<option value="AM">Amazonas</option>
						<option value="BA">Bahia</option>
						<option value="CE">Cear�</option>
						<option value="DF">Distrito Federal</option>
						<option value="ES">Esp�rito Santo</option>
						<option value="GO">Goi�s</option>
						<option value="MA">Maranh�o</option>
						<option value="MT">Mato Grosso</option>
						<option value="MS">Mato Grosso do Sul</option>
						<option value="MG">Minas Gerais</option>
						<option value="PA">Par�</option>
						<option value="PB">Para�ba</option>
						<option value="PR">Paran�</option>
						<option value="PE">Pernambuco</option>
						<option value="PI">Piau�</option>
						<option value="RJ">Rio de Janeiro</option>
						<option value="RN">Rio Grande do Norte</option>
						<option value="RS">Rio Grande do Sul</option>
						<option value="RO">Rond�nia</option>
						<option value="RR">Roraima</option>
						<option value="SC">Santa Catarina</option>
						<option value="SP">S�o Paulo</option>
						<option value="SE">Sergipe</option>
						<option value="TO">Tocantins</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<label class="label">CEP:&nbsp;&nbsp;</label>
					<s:textfield theme="simple" name="cepAux" size="15" maxlength="8" />
				</td>
				<td><label class="label">DDD:</label></td>
				<td>
					<s:textfield theme="simple" name="dddAux" size="2"	maxlength="2" />&nbsp;&nbsp; 
					<label class="label">Tel:&nbsp;&nbsp;</label>
					<s:textfield theme="simple" name="telefoneAux" size="8" maxlength="8" />
				</td>
			</tr>
			<tr>
				<td><label class="label">Login:</label></td>
				<td><s:textfield theme="simple" name="usuario.acesso" maxlength="25" size="25" />&nbsp;
				<label class="label">Senha:</label><s:password theme="simple" name="usuario.senha"	maxlength="25" size="25" /></td>
				<td><label class="label">E-mail:</label></td>
				<td><s:textfield theme="simple" name="usuario.email" size="30" maxlength="30" /></td>
			</tr>
			<tr>
				<td><label class="label">CRM:</label></td>
				<td><s:textfield theme="simple" name="medico.crm" size="7" maxlength="7" />&nbsp;&nbsp; 
				<label class="label">UF-CRM:</label>&nbsp;
					<select name="medico.crmUf">	
						<option value="0">Selecione</option>
						<option value="AC">Acre</option>
						<option value="AL">Alagoas</option>
						<option value="AP">Amap�</option>
						<option value="AM">Amazonas</option>
						<option value="BA">Bahia</option>
						<option value="CE">Cear�</option>
						<option value="DF">Distrito Federal</option>
						<option value="ES">Esp�rito Santo</option>
						<option value="GO">Goi�s</option>
						<option value="MA">Maranh�o</option>
						<option value="MT">Mato Grosso</option>
						<option value="MS">Mato Grosso do Sul</option>
						<option value="MG">Minas Gerais</option>
						<option value="PA">Par�</option>
						<option value="PB">Para�ba</option>
						<option value="PR">Paran�</option>
						<option value="PE">Pernambuco</option>
						<option value="PI">Piau�</option>
						<option value="RJ">Rio de Janeiro</option>
						<option value="RN">Rio Grande do Norte</option>
						<option value="RS">Rio Grande do Sul</option>
						<option value="RO">Rond�nia</option>
						<option value="RR">Roraima</option>
						<option value="SC">Santa Catarina</option>
						<option value="SP">S�o Paulo</option>
						<option value="SE">Sergipe</option>
						<option value="TO">Tocantins</option>
					</select>
				</td>
				<td colspan="2" ><label class="label">Dias de Atendimento:</label>&nbsp;
				<s:iterator value="dias">
					<s:checkbox value="false" name="dia-%{codigo}" theme="simple"/><s:property value="descricao" />
				</s:iterator>
			</tr>
			<tr>
				<td><s:submit value="Salvar" cssClass="button" /></td>
			</tr>
	</table>
	</s:form>		
</s:elseif>

</body>
</html>