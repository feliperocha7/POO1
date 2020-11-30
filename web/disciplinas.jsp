<%-- 
    Document   : disciplinas
    Created on : 6 de out de 2020, 00:14:38
    Author     : felip
--%>
<%@page import="prova_poo.Disciplina" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("alterar") != null){
        int indice = Integer.parseInt(request.getParameter("indice"));
        double nota = Double.parseDouble(request.getParameter("nota"));
        Disciplina disciplinas = Disciplina.getList().get(indice);
        disciplinas.setNota(nota);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head_references.jspf" %>
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Disciplina</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
            </tr>
            <% for(int i = 0; i < Disciplina.getList().size(); i++){
                Disciplina disciplinas = (Disciplina) Disciplina.getList().get(i);%>
                <tr>
                    <th><%= i + 1 %></th>
                    <th><%= disciplinas.getNome() %></th>
                    <th><%= disciplinas.getEmenta() %></th>
                    <th><%= disciplinas.getCiclo() %></th>
                    <th><%= disciplinas.getNota() %></th>
                    <th>
                        <form method="get">
                            <input type="text" name="nota"/>
                            <input type="submit" name="alterar" value="(Re)Definir"/>
                            <input type="hidden" name="indice" value="<%= i%>"/>
                            <input type="hidden" name="alterar" value="1"/>
                        </form>
                    </th>
                </tr>
            <%}%>
        </table>
        <%@include file="WEB-INF/jspf/body_scripts.jspf" %>
    </body>
</html>
