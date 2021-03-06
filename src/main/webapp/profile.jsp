<%-- 
    Document   : profile.jsp
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Instagrim</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/imagelightbox.css" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.css" type="text/css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" type="text/css">
        <link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <nav class="navbar navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button" style="color:#888888">
                        <i class="fa fa-3x fa-bars"></i>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-left" href="/Instagrim" style="color:graytext; font-size: x-large;">Instagrim</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                            <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");%>
                        <li>
                            <%if (lg!= null){
                                if(lg.getlogedin()==true){%>
                                    <a class="scroll" href="/Instagrim/Profile/<%=lg.getUsername()%>" style="color:black;">Profile</a>
                              <%}}%>       
                        </li>
                        <li>
                            <%if (lg!= null){
                                if(lg.getlogedin()==true){%>
                                    <a class="scroll" href="/Instagrim/Upload" style="color:black;">Upload</a>
                              <%}
                                else{%><a class="scroll" href="/Instagrim/Login" style="color:black;">Upload</a><%}
                             }
                             else{%><a class="scroll" href="/Instagrim/Login" style="color:black;">Upload</a><%}%>                  
                        </li>
                        <li>
                            <%if (lg!= null){
                                if(lg.getlogedin()==true){%>
                                    <a class="scroll" href="/Instagrim/Images/<%=lg.getUsername()%>" style="color:black;">Your Images</a>
                              <%}
                                else{%><a class="scroll" href="/Instagrim/Login" style="color:black;">Your Images</a><%}       
                             }
                            else{%> <a class="scroll" href="/Instagrim/Login" style="color:black;">Your Images</a><%}%>
                        </li>
                        <li>
                                                      <%if (lg!= null){
                                if(lg.getlogedin()==false){%>
                            <a class="scroll" href="/Instagrim/Register" style="color:black;">Register</a>
                                <%}
                            }
                            if (lg==null){%>
                                <a class="scroll" href="/Instagrim/Register" style="color:black;">Register</a>
                            <%}%>
                        </li>
                        <li>
                            
                        <%
                            if(lg!= null) {
                                if(lg.getlogedin()==true){%>
                                <div class ="col-lg-6">
                                    <p style="font-size: 0.75em;"><%=lg.getUsername()%></p>
                                </div>
                                <div class ="col-lg-6">
                                    <a class="scroll" href="/Instagrim/Logout" style=" font-size: 0.75em; color:black;">Logout</a></div><%}
                                else{%><a class="scroll" href="/Instagrim/Login" style="color:black;">Login</a><%
                                }
                            }
                            else{
                                %><a class="scroll" href="/Instagrim/Login" style="color:black;">Login</a><%
                            }%>
                        </li>                           
                    </ul>
                </div>
            </div>
                <div class="container-fluid">
                    <div class="col-xs-12" style="background-color:#888888;">
                    </div>
                </div>
            </div>
        </nav>
        <section>
            <div class ="container centerpeice">
                
                <div class="col-xs-4">
                    <form method="POST">
                       <input  name = "picture" type="submit" value="Change"> 
                    </form><p style=" display: block; overflow: auto; text-align: center; color:black;">PROFILE PICTURE</p>
                    <br/>
                <% Set<String> tmtp = (HashSet<String>) request.getAttribute("setdata");
                Iterator itr;
                if(tmtp!=null){
                    itr = tmtp.iterator();

                %>
                    <form method="POST">
                       <input  name = "name" type="submit" value="Change"> 
                    </form><p style=" display: block; overflow: auto; text-align: center; color:black;">NAME</p><br/>
                    <%while(itr.hasNext()){%>
                    <p><%=itr.next()%></p>                       
                    <%;}%>
                <%}%>
                </div>
                <div class="col-xs-4">
                    <br/>
                    
                    <br/>
                    
                    <br/>
                    
                    <br/>
                    
                    <br/>
                </div>
                <div class="col-xs-4">
                    <%Pic PROPic = (Pic) request.getAttribute("Pic");%>
                    <%if (PROPic ==null){%>
                        <p>NO profile pic exists!</p>
                    <%}
                    else{%>
                    <img src="/Instagrim/ThumbP/<%=PROPic.getOwner()%>">
                    <%}%>
                    <p>${requestScope.setdata}</p>
                    <p><%=PROPic.getOwner()%></p>  
                </div>    
            </div>
        </section>
    </body>
</html>
