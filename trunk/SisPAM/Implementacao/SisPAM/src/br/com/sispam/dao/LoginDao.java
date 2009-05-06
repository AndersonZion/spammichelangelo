package br.com.sispam.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import br.com.sispam.banco.Conexao;
import br.com.sispam.dominio.Usuario;

public class LoginDao {
	private Conexao conexao;
	private EntityManager manager;
	
	public Usuario recuperaSenha(String userAcess){
		conexao = new Conexao();
		manager = conexao.getEntityManger();
		Usuario usuario = null;
		try{
			//cria uma queri para fazer a busca pelo perfil
			Query query = manager.createQuery("from Usuario where userAcess = :userAcess ");
			//seta o parametro
			query.setParameter("userAcess", userAcess);
			usuario = (Usuario) query.getSingleResult();
		}catch (NoResultException e) {
			e.printStackTrace();
		}
		conexao.finalizaConexao();
		return usuario;
	}
}
