package br.com.sispam.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import br.com.sispam.dominio.Compromisso;
import br.com.sispam.dominio.Medico;
import br.com.sispam.excecao.CampoInteiroException;
import br.com.sispam.excecao.CampoInvalidoException;
import br.com.sispam.facade.CompromissoFacade;
import br.com.sispam.facade.MedicoFacade;


public class CompromissoAction extends Action{
	
	private Compromisso compromisso;
	private CompromissoFacade compromissoFacade;
	private MedicoFacade medicoFacade;
	private List<Compromisso> compromissosCadastrados;
	private List<Medico> medicos;
	private String horaInicioAux;
	private String horaFimAux;
	private String dataAux;
	
	public String incluirCompromisso(){
		compromissoFacade = new CompromissoFacade();
		
		//monta um mapa com todos os campos que devem ser inteiros.	
		Map<String, String> mapa = new HashMap<String, String>();
		mapa.put("horaInicio", horaInicioAux);
		mapa.put("horaFim", horaFimAux);
	
		try {
			//verifica se os campos são inteiros
			compromissoFacade.verificaCampoInteiro(mapa);

			//verifica se os campo obrigatorios foram preenchidos
			compromissoFacade.validaCampos(compromisso);

			//seta os valores das variváveis auxiliares.
			compromisso.setHoraInicio(Integer.parseInt(horaInicioAux));
			compromisso.setHoraFim(Integer.parseInt(horaFimAux));


			//verifica se já existe compromisso cadastrado com esses dados.
			compromissoFacade.verificaExistencia(compromisso);
			compromissoFacade.salvaCompromisso(compromisso);
			mensagens.put("salvo", "Compromisso cadastrado com sucesso!");

		}catch (CampoInvalidoException e) {
			e.printStackTrace();
			erros.put("campoInvalido", e.getMessage());
			apresentaErrors();
			return FALHA_SALVAR_COMPROMISSO;
		}catch (CampoInteiroException e) {
			erros.put("campoInvalido", e.getMessage());
			apresentaErrors();
			return FALHA_SALVAR_COMPROMISSO;
		}
		apresentaMensagens();
		this.limparCampos();
		return SUCESSO_INCLUIR_CONVENIO;
	}
	
	public String carregarInclusao(){
		this.medicoFacade = new MedicoFacade();
		this.medicos = this.medicoFacade.recuperarTodos();
		return CARREGAR_INCLUSAO_COMPROMISSO;
	}

	public String excluirCompromisso(){
		 
		this.compromissoFacade = new CompromissoFacade();		
		try {
			this.compromissoFacade.excluiCompromisso(this.compromisso);
			mensagens.put("excluido", "Compromisso excluido com sucesso!");
		} catch (Exception e) {
			e.printStackTrace();					
			return FALHA_EXCLUIR_COMPROMISSO;
		}
		apresentaMensagens();		
		return FALHA_EXCLUIR_COMPROMISSO;
	}

	public String consultarCompromisso(){
		compromissoFacade= new CompromissoFacade();
		try {
			this.compromissosCadastrados = new ArrayList<Compromisso>();
			this.compromissosCadastrados = compromissoFacade.pesquisaCompromisso(compromisso);
		} catch (CampoInvalidoException e) {
			erros.put("erro", e.getMessage());
		}

		return LISTAR_COMPROMISSOS;

	}
	
	public String carregaEdicaoCompromisso(){
		this.compromissoFacade = new CompromissoFacade();
		this.compromisso = this.compromissoFacade.recuperarPeloId(compromisso.getId());
		this.horaInicioAux = String.valueOf(compromisso.getHoraInicio());
		this.horaFimAux = String.valueOf(compromisso.getHoraFim());
		return SUCESSO_EDICAO_COMPROMISSO;
	}


	/*Utilitário*/
	private void limparCampos(){
		this.compromisso = null;
		this.horaInicioAux = null;
		this.horaFimAux = null;
	}
	
	public Compromisso getCompromisso() {
		return compromisso;
	}
	public void setCompromisso(Compromisso compromisso) {
		this.compromisso = compromisso;
	}
	public CompromissoFacade getCompromissoFacade() {
		return compromissoFacade;
	}
	public void setCompromissoFacade(CompromissoFacade compromissoFacade) {
		this.compromissoFacade = compromissoFacade;
	}
	public List<Compromisso> getCompromissosCadastrados() {
		return compromissosCadastrados;
	}
	public void setCompromissosCadastrados(List<Compromisso> compromissosCadastrados) {
		this.compromissosCadastrados = compromissosCadastrados;
	}
	public String getHoraInicioAux() {
		return horaInicioAux;
	}
	public void setHoraInicioAux(String horaInicioAux) {
		this.horaInicioAux = horaInicioAux;
	}
	public String getHoraFimAux() {
		return horaFimAux;
	}
	public void setHoraFimAux(String horaFimAux) {
		this.horaFimAux = horaFimAux;
	}

	public MedicoFacade getMedicoFacade() {
		return medicoFacade;
	}

	public void setMedicoFacade(MedicoFacade medicoFacade) {
		this.medicoFacade = medicoFacade;
	}

	public List<Medico> getMedicos() {
		return medicos;
	}

	public void setMedicos(List<Medico> medicos) {
		this.medicos = medicos;
	}

	public String getDataAux() {
		return dataAux;
	}

	public void setDataAux(String dataAux) {
		this.dataAux = dataAux;
	}
	
	
	
}