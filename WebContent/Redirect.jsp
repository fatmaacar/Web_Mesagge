<%@page import="cls.connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body background="http://i32.photobucket.com/albums/d19/xdomains/gfxback/bg0032zt.gif" >

Simdi anasayfaya yonlendiriliyorsunuz

<jsp:useBean id="mybean" class="cls.connect" >

<%
String kullaniciAdi = String.valueOf(session.getAttribute("att_kullaniciadi"));
String mesaj = request.getParameter("txt");

cls.connect con = new cls.connect();
con.mesajEkle(kullaniciAdi, mesaj);

//System.out.println(kullaniciAdi);
//System.out.println(mesaj);

response.sendRedirect("NewFile2.jsp");
%>

</jsp:useBean>

</body>
</html>