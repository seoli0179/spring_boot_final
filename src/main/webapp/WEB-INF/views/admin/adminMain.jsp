<%--
  Created by IntelliJ IDEA.
  User: newp
  Date: 2022/09/20
  Time: 3:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Artchive :: ADMIN</title>

    <link type="text/css" rel="stylesheet" href="<c:url value='/tools/reset.css'/>">
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/admin/adminMain.css'/>">
</head>
<body>
    <header>

    </header>
    <section>
        <nav id="sidebar">
            <div id="logoBox">
                <a href="<c:url value='/admin'/>">Artchive</a>
                <span>Admin</span>
            </div>
            <ul>
                <li>회원관리</li>
                <li>전시관리</li>
                <li>게시글관리</li>
            </ul>
        </nav>
        <main>

        </main>
    </section>
    <footer>

    </footer>
</body>
</html>
