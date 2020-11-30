<%-- 
    Document   : disciplinas
    Created on : 6 de out de 2020, 00:14:38
    Author     : felip
--%>
<%@page import="prova_poo.Disciplina" %>
<%@page import="web.DbListener" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String exceptionMessage = null;
    if(request.getParameter("Cancelar")!=null){
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("FormInsert")!=null){
        try{
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            double nota = Double.parseDouble(request.getParameter("nota"));
            Disciplina.insert(nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormUpdate")!=null){
        try{
            long rowId = Long.parseLong(request.getParameter("rowId"));
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            int ciclo = Integer.parseInt(request.getParameter("ciclo"));
            double nota = Double.parseDouble(request.getParameter("nota"));
            Disciplina.update(rowId, nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter("FormDelete")!=null){
        try{
            long rowId = Long.parseLong(request.getParameter("rowId"));
            Disciplina.delete(rowId);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
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
        <h3>Disciplinas</h3>
        <%if(request.getParameter("prepararInsert")!=null){%>
            <h3>Incluir disciplina</h3>
            <form>
                Nome: <input type="text" name="nome"/>
                Ementa: <input type="text" name="ementa"/>
                Ciclo: <input type="text" name="ciclo"/>
                Nota: <input type="text" name="nota"/>
                <input type="submit" name="FormInsert" value="Inserir"/>
                <input type="submit" name="Cancelar" value="Cancelar"/>
            </form>
        <%}else if(request.getParameter("prepararUpdate")!=null){%>
            <h3>Alterar Disciplina</h3>
            <form>
                <%
                    String rowId = request.getParameter("rowId");
                    String nome = request.getParameter("nome");
                    String ementa = request.getParameter("ementa");
                    String ciclo = request.getParameter("ciclo");
                    String nota = request.getParameter("nota");
                %>
                <input type="hidden" name="rowId" value="<%= rowId %>"/>
                Nome: <input type="text" name="nome" value="<%= nome %>"/>
                Ementa: <input type="text" name="ementa" value="<%= ementa %>"/>
                Ciclo: <input type="text" name="ciclo" value="<%= ciclo %>"/>
                Nota: <input type="text" name="nota" value="<%= nota %>"/>
                <input type="submit" name="FormUpdate" value="Alterar"/>
                <input type="submit" name="Cancelar" value="Cancelar"/>
            </form>
        <%}else if(request.getParameter("prepararDelete")!=null){%>
            <h3>Excluir Disciplina</h3>
            <form>
                <%String rowId = request.getParameter("rowId");%>
                <input type="hidden" name="rowId" value="<%= rowId %>"/>
                <input type="submit" name="FormDelete" value="Excluir"/>
                <input type="submit" name="Cancelar" value="Cancelar"/>
            </form>
        <%}else{%>
            <form method="post">
                <input type="submit" name="prepararInsert" value="Inserir"/>
            </form>
        <%}%>
        <table border="1">
            
            <tr>
                <th>Índice</th>
                <th>Disciplina</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
            </tr>
            <% for(Disciplina d: Disciplina.getList()){%>
                <tr>
                    <th><%= d.getRowId() %></th>
                    <th><%= d.getNome() %></th>
                    <th><%= d.getEmenta() %></th>
                    <th><%= d.getCiclo() %></th>
                    <th><%= d.getNota() %></th>
                    <th>
                        <form method="get">
                            <input type="hidden" name="rowId" value="<%= d.getRowId() %>"/>
                            <input type="hidden" name="nome" value="<%= d.getNome() %>"/>
                            <input type="hidden" name="ementa" value="<%= d.getEmenta() %>"/>
                            <input type="hidden" name="ciclo" value="<%= d.getCiclo() %>"/>
                            <input type="hidden" name="nota" value="<%= d.getNota() %>"/>
                            <input type="submit" name="prepararUpdate" value="Alterar"/>
                            <input type="submit" name="prepararDelete" value="Excluir"/>
                        </form>
                    </th>
                </tr>
            <%}%>
        </table>
        <%@include file="WEB-INF/jspf/body_scripts.jspf" %>
    </body>
</html>
