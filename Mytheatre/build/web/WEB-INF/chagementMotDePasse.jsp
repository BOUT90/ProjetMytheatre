<%-- 
    Document   : chagementMotDePasse
    Created on : 10 mars 2017, 16:17:44
    Author     : niangd
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Modeles.UtilisateurInfos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Bienvenu sur Mytheâtre</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="scripts/TousLesChampsRemplis.js" type="text/javascript"></script>
        <link href="Styles/StylesMyTheatre.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/MAJ_ElementsPage.js" type="text/javascript"></script>
        <script src="scripts/MAJ_ElementsPage.js" type="text/javascript"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div id="wrapper">

            <!-- l'en-tête de la page -->
            <header>
                <!-- la partie login : logo + login -->
                <% UtilisateurInfos user = (UtilisateurInfos) request.getSession().getAttribute("user");
                    if (user != null) {%>
                <div id="logoCompteUtilisateur"> <a href="/Mytheatre/ConnexionValidation?connexionPseudo=<%=user.getPseudo()%>&connexionMotDePasse=<%=user.getPassword()%>" title="Mon Compte"><img src="Images/user.png" width="20px"/><span>  <%=user.getPseudo()%></span></a></div>
                        <%}%>





                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">MyTheatre</a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li ><a href="/Mytheatre/indexCtrler">Accueil</a></li>
                            <li ><a href="/Mytheatre/Spectacle?typeCommade=general">Spectacle</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <%if (user != null) {%>
                            <li><a style="float: right" href="/Mytheatre/Deconnexion"><span class="glyphicon glyphicon-log-out"></span> déconnexion</a></li>
                                <%}%><%if (user == null) {%>
                            <li><a href="/Mytheatre/CreationDeCompte"><span class="glyphicon glyphicon-user"></span> S'inscrire</a></li>
                            <li ><a  href="/Mytheatre/Connexion"><span class="glyphicon glyphicon-log-in"></span> Connexion</a></li>

                            <%}%>
                        </ul>
                    </div>
                </nav> 

            </header>
            <div class="detailPage">
                <!-- le contenu de la page -->
                <form class="formulaireCentre" action="ModificationMotDePass"> 
                    <div>
                        <label>Ancien mot de Passe : </label>
                        <input id="ancienmotdepasse" type="password" name="ancienmotdepasse"/>

                    </div>
                    <div id="error-motdepasseincorrect">${motdepassincorrect}</div>
                    <div>
                        <label>Nouveau mot de Passe : </label>
                        <input id="changementmotdepasse1" onkeyup="validatePasswd()" type="password" name="ancienConnexionMotDePasse"/>

                    </div>

                    <div>
                        <label>Confirmation : </label>
                        <input id="changementmotdepasse2" onkeyup="validatePasswd()" type="password" name="confirmconnexionMotDePasse"/>

                    </div>
                    <div id="modepassfaux"></div>
                    <div class="centerStyle">
                        <input id="changementmotdepasse3" type="submit" value="Validation" disabled/>
                    </div>
                </form>
            </div>
            <%
                int status = (int) request.getSession().getAttribute("status");
                String urlRetour;
                if (status == 1) {
                    urlRetour = "/Mytheatre/Retour?action=changementmodepassegerant";
                } else {
                    urlRetour = "/Mytheatre/Retour?action=changementmodepasseprod";
                }
            %>       
            <div  id="gerant" class="boutonRetour">
                <a class="encours" href="<%=urlRetour%>">Retour</a>
            </div>  
            <div id="spacer"></div>
            <c:import url="footre.jsp"/>
        </div>
    </body>
</html>

