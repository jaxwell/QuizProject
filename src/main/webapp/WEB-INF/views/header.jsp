<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="QuizProject">
    <meta name="author" content="Ievgen Bykov">
    <link rel="icon" href="<c:url value='/resources/favicon.ico'/>">

    <title>QuizProject List Page</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/resources/css/list.css' />" rel="stylesheet">
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${context}/">QuizProject</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><strong>${loggedinuser}</strong></a></li>
                <li><a href="<c:url value="/logout" />">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <!-- Admin Section-->
            <sec:authorize access="hasRole('ADMIN')">
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="/admin/list">Users <span class="sr-only">(current)</span></a></li>
                    <li><a href="<c:url value='/admin/newuser' />">Add New User</a></li>
                    <li><a href="#">TODO Reports</a></li>
                    <li><a href="#">TODO Settings</a></li>
                </ul>
            </sec:authorize>
            <!-- Advanced Tutor Section -->
            <sec:authorize access="hasRole('ADMIN') or hasRole('ADVANCEED_TUTOR')">
                <ul class="nav nav-sidebar">
                    <li><a href="">All Tests</a></li>
                    <li><a href="">AdvTutorSection</a></li>
                    <li><a href="">AdvTutorSection2</a></li>
                </ul>
            </sec:authorize>
            <!-- Tutor Secton -->
            <sec:authorize access="hasAnyRole('ADMIN', 'ADVANCED_TUTOR', 'TUTOR')">
                <ul class="nav nav-sidebar">
                    <li><a href="">Tests</a></li>
                    <li><a href="">Add Test</a></li>
                    <li><a href="">TutorSection</a></li>
                </ul>
            </sec:authorize>
            <!-- Student Secton -->
            <sec:authorize access="hasAnyRole('ADMIN', 'ADVANCED_TUTOR', 'TUTOR', 'STUDENT' )">
                <ul class="nav nav-sidebar">
                    <li><a href="">Tests</a></li>
                    <li><a href="">Statistics</a></li>
                    <li><a href="">StudentSection</a></li>
                </ul>
            </sec:authorize>
        </div>