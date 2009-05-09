package br.com.sispam.action;

import com.opensymphony.xwork2.ActionContext;

import br.com.sispam.dominio.Usuario;
import br.com.sispam.excecao.CampoInvalidoException;
import br.com.sispam.facade.LoginFacade;

public class LoginAction extends Action{

	private String acesso;
	private String senha;
	private LoginFacade loginFacade;
	private Usuario usr;
	private String usrLogado;

	public String logar(){
		usr = new Usuario();
		loginFacade = new LoginFacade();

		try{
			usr = this.loginFacade.pesquisaUsuario(acesso, senha);
			senha = this.loginFacade.criptografaSenha(senha);
			
			if(usr != null &&  usr.getSenha().equals(senha)){
				ActionContext.getContext().getSession().put(USUARIO_LOGADO, usr);
				this.usrLogado = getUsuarioLogado().getAcesso();
				return SUCESSO;
			}else{
				erros.put("campoInvalido", "Acesso negado!");
				apresentaErrors();
				return FALHA;
			}
		}catch(CampoInvalidoException ex) {
			erros.put("campoInvalido", ex.getMessage());
			apresentaErrors();
			return FALHA;
		}
	}

	/*Get & Set*/
	public String getAcesso() {
		return acesso;
	}
	public void setAcesso(String acesso) {
		this.acesso = acesso;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}

	public LoginFacade getLoginFacade() {
		return loginFacade;
	}

	public void setLoginFacade(LoginFacade loginFacade) {
		this.loginFacade = loginFacade;
	}

	public Usuario getUsr() {
		return usr;
	}

	public void setUsr(Usuario usr) {
		this.usr = usr;
	}

	public String getUsrLogado() {
		return this.usrLogado;
	}

}
