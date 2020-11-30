<%-- 
    Document   : index
    Created on : 5 de out de 2020, 23:57:02
    Author     : felip
--%>
<%@page import="prova_poo.Disciplina" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/head_references.jspf" %>
        <title>Inicio</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Felipe Rocha Barros</h1>
        <h2>RA: 1290481823013</h2>
        <h2>Cursando <%= Disciplina.getList().size() %> matérias.</h2>
        <%@include file="WEB-INF/jspf/body_scripts.jspf" %>
    </body>
</html>
