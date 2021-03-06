<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<h1>Hello</h1>
<security:authorize access="!isAuthenticated()">
<a href="/registration">Register</a>
</security:authorize>
<security:authorize access="isAuthenticated() and hasRole('ROLE_ADMIN')">
<a href="/admin">Admin panel</a>
</security:authorize>
<security:authorize access="isAuthenticated() and hasRole('ROLE_USER')">
<a href="/user/product">Products to buy</a>
</security:authorize>
<a href="/user/productAll">Products</a>