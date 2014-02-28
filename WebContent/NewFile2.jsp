<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="NewFile.css" rel="stylesheet" />
</head>

<body background="http://i32.photobucket.com/albums/d19/xdomains/gfxback/bg0032zt.gif" >

<jsp:useBean id="mybean" class="cls.connect" >

<form method="post" action="Redirect.jsp">

<ul id="minitabs">
    <li><a href="NewFile.jsp">Giris Yap</a></li>
    <li><a href="NewFile2.jsp">Mesajlasma</a></li>
    <li><a href="NewFile2.jsp">Hakkimizda</a></li>
    
</ul>



<div id="container" class="abc"  style="width:700px" align="center" >


	<div id="header" style="background-color:#880000;"  align="center">

	<br>
	
	<textarea name="comments" cols="70" rows="10">
	
	<%
	cls.connect con = new cls.connect();
	String dizi[] = con.mesajGetir();
	
	out.println("..");
	for(int i=0; i<dizi.length-1; i+=2)
	{
		if(dizi[i] == null || dizi[i+1] == null)
			break;
		
		out.println(dizi[i] + ":");
		out.println(dizi[i + 1]);
		out.println("");
	}
	
	%>
	
	</textarea><br>

	</div>



	<div id="header" style="background-color:#880000;"  align="center">

	<br>
	<input type="text" class="txtBig" name="txt" size="50"> <br> <br>

	</div>

	<div id="header" style="background-color:#FFA500;"  align="center";">
	<br>
	<%

	char alfabe[] = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','r','s','t','u','v','y','z','1','2','3','4','5','6','7','8','9','0'};
	//char alfabe = 'd';
	for(int i=0; i<33; i++)
	{
		out.println("<input class=input2 type=button value="+alfabe[i]+" name=a onclick=txt.value+='"+alfabe[i]+"' >");
		
		if(i%11==0 && i!=0)
			out.println("<br>");
	}	

	
	%>
	<br><br>	
	
	</div>
	
	
	
	
	
	
	
	
	<div id="header" style="background-color:#505050;" >
	
	<input type="submit" name="Gonder"  style="height: 30px; width: 65%" align="left" >
	<input type="reset" name="Temizle" style="height: 30px; width: 34%" align="right" >
	
	</div>
	
	
	
	</div>
	
	
	</form>
	
	

	
	
	<%
	
	if(session.getAttribute("att_kullaniciadi") == null)
	{
		String kAdi = request.getParameter("kullaniciAdi");
		session.setAttribute("att_kullaniciadi", kAdi);
	}
	else if(request.getParameter("kullaniciAdi") != null && session.getAttribute("att_kullaniciadi") != request.getParameter("kullaniciAdi"))
	{
		String kAdi = request.getParameter("kullaniciAdi");
		session.setAttribute("att_kullaniciadi", kAdi);
	}
	
	
	%>
	
	
	
	
	
	
	
	
	
	
	<div class="asd">
	deneme
	</div>
	
	
	


	<br><br><br><br>



 </jsp:useBean>


</body>
</html>