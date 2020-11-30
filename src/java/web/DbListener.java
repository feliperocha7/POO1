/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import prova_poo.Disciplina;

/**
 * Web application lifecycle listener.
 *
 * @author felip
 */
public class DbListener implements ServletContextListener {
    private static final String CLASS_NAME = "org.sqlite.JDBC";
    private static final String DB_URL = "jdbc:sqlite:disciplinas.db";
    
    public static String exceptionMessage = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(DB_URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String etapa = "Inicialização...";
        Connection con = null;
        Statement stmt = null;
        try{
            etapa = "Registrando a classe do driver...";
            Class.forName(CLASS_NAME);
            con = getConnection();
            etapa = "Preparando statement...";
            stmt = con.createStatement();
            etapa = "Criar a tabela disciplinas...";
            stmt.execute(Disciplina.getCreateStatement());
            if(Disciplina.getList().isEmpty()){
                etapa = "Criar primeiros registros de disciplinas";
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Sociedade e Tecnologia,"
                        + "Comunicação e Informação – conceitos e implicações no mundo contemporâneo; "
                        + "Da Cultura de Massa à Cultura Digital – novas formas de socialização da "
                        + "informação e  novos desafios na comunicação. Tecnologia e Sociedade - Problemas "
                        + "humanos e sociais referentes à utilização da tecnologia da informação e da"
                        + " computação: aspectos humanos da segurança e privacidade das informações e "
                        + "aspectos econômicos e éticos da utilização dos computadores.,"
                        + "3,"
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Lab. de Banco de Dados,"
                        + "Tecnologias emergentes de mercado que serão aplicadas em laboratório,"
                        + "5,"
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Estrutura de Dados,"
                        + "Pilhas, filas, alocação dinâmica, recursividade, listas encadeadas, tabelas "
                        + "de espalhamento e árvores.,"
                        + "3,"
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Programação Orientada a Objetos,"
                        + "Conceitos e evolução da tecnologia de orientação a objetos. Limitações e diferenças"
                        + " entre o paradigma da programação estruturada em relação à orientação a objetos."
                        + " Conceito de objeto, classe, métodos, atributos, herança, polimorfismo, agregação,"
                        + " associação, dependência, encapsulamento, mensagem e suas respectivas notações na"
                        + " linguagem padrão de representação da orientação a objetos. Implementação de algoritmos"
                        + " orientado a objetos utilizando linguagens de programação. Aplicação e uso das estruturas"
                        + " fundamentais da orientação a objetos.,"
                        + "3,"
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Sistema de Informação,"
                        + "Estudos de conceitos básicos de Sistemas de Informações. Estudo das "
                        + "aplicações dos Sistemas de Informações nas organizações. Potencial "
                        + "estratégico dos Sistemas de Informações para o negócio. Perspectivas do"
                        + " uso dos Sistemas de Informações no suporte a Processos Gerenciais nas"
                        + " organizações. A Tecnologia da Informação como infraestrutura para os "
                        + "sistemas de informações.,"
                        + "2,"
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + ","
                        + ","
                        + ","
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Engenharia de Software II,"
                        + "Contexto atual das empresas em relação aos projetos de tecnologia de informação."
                        + " Modelagem de Negócio para o desenvolvimento de software. Conceitos, evolução e"
                        + " importância da Engenharia de Requisitos. Entendendo e analisando os problemas e"
                        + " as necessidades dos usuários, clientes e envolvidos no projeto. Técnicas de elicitação"
                        + ". Requisitos, seus tipos e matriz de rastreabilidade. Definição do sistema a partir dos"
                        + " requisitos. Gerenciamento de requisitos.,"
                        + "3,"
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Interação Humano Computador,"
                        + "Fatores Humanos em Sistemas Computacionais, Fundamentos Teóricos em "
                        + "Interação Humano-Computador, Usabilidade, Comunicabilidade, Acessibilidade,"
                        + "  Design de Interação, Processo de Design de Interação, Projeto, Construção "
                        + "e avaliação de interfaces.,"
                        + "3,"
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Sistemas Operacionais I,"
                        + "Introdução a Sistemas Operacionais. Estrutura dos Sistemas Operacionais. "
                        + "Processos e Threads. Gerencia de Processos. Sincronização de Processos "
                        + "Concorrentes. Gerenciamento de Memória. Memória Virtual. Sistemas de Arquivos. "
                        + "Gerência de Dispositivos. Tópicos complementares. Estudos de caso.,"
                        + "3,"
                        + "null"
                        + ")");
                stmt.execute("INSERT INTPO disciplinas VALUES("
                        + "Inglês IV,"
                        + "Consolidação da compreensão e produção oral e escrita por meio da integração "
                        + "das habilidades lingüístico-comunicativas desenvolvidas na disciplina Inglês 3."
                        + " Ênfase na oralidade, atendendo às especificidades acadêmico-profissionais da área "
                        + "e abordando aspectos sócio-culturais da língua inglesa,"
                        + "4,"
                        + "null"
                        + ")");
            }
        }catch(Exception ex){
            exceptionMessage = etapa + ": " + ex.getLocalizedMessage();
        }
    
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
