<%@ page import="com.ipiecoles.java.java320.model.Commercial" %>
<%@ page import="com.ipiecoles.java.java320.model.Employe" %>
<%@ page import="com.ipiecoles.java.java320.model.Technicien" %>
<%@ page import="com.ipiecoles.java.java320.model.Manager" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../tags/header.jsp" %>
<% Employe employe = (Employe) request.getAttribute("employe"); %>
<div class="container">
    <h2>Détail du ${employe.className} ${employe.matricule} </h2>

    <div class="row">
        <form id="saveForm" action="/<%= employe.getClassName().toLowerCase() + "s"%>/${employe.getId()}" method="post">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="nom">Nom</label>
                <input type="text" value="${employe.nom}" class="form-control" name="nom" id="nom">

                <label class="form-control-label" for="prenom">Prénom</label>
                <input type="text" value="${employe.prenom}" class="form-control" name="prenom" id="prenom">

                <label class="form-control-label" for="matricule">Matricule</label>
                <input type="text" value="${employe.matricule}" class="form-control" name="matricule" id="matricule">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label class="form-control-label" for="salaire">Salaire</label>
                <div class="input-group">
                    <input type="number" value="${employe.salaire}" class="form-control" name="salaire" id="salaire">
                    <span class="input-group-addon">€</span>
                </div>

                <% if(employe.getId() != null) { %>
                <label class="form-control-label" for="PrimeAnnuelle">Prime Annuelle</label>
                <div class="input-group">
                    <input type="text" value="${employe.getPrimeAnnuelle()}" class="form-control" name="primeAnnuelle" id="primeAnnuelle">
                    <span class="input-group-addon">€</span>
                </div>
                <% } %>

                <label class="form-control-label" for="dateEmbauche">Date d'embauche</label>
                <input type="text" value="${employe.dateEmbauche.toString("dd/MM/YYYY")}" class="form-control" name="dateEmbauche" id="dateEmbauche">

                <% if( employe instanceof Commercial) { %>
                <label class="form-control-label" for="performance">Performance</label>
                <input type="number" value="${employe.performance}" class="form-control" name="performance" id="performance">

                <label class="form-control-label" for="caAnnuel">CA Annuel</label>
                <div class="input-group">
                    <input type="number" value="${employe.caAnnuel}" class="form-control" name="caAnnuel" id="caAnnuel">
                    <span class="input-group-addon">€</span>
                </div>
                <% } %>


                <% if( employe instanceof Technicien) { %>
                <label class="form-control-label" for="grade">Grade</label>
                <input type="number" value="${employe.grade}" class="form-control" name="grade" id="grade">
                <% } %>


                <% if( employe instanceof Manager && employe.getId() != null) { %>
                <label class="form-control-label" for="performance">Equipe</label>
                <div class="row">
                    <div class="col-lg-10">
                        <ul class="list-group">
                            <% for (Technicien t : ((Manager) employe).getEquipe()) { %>
                            <li class="list-group-item">
                                <a href="/employes/<%= t.getId() %>">
                                    <%= t.getPrenom() %> <%= t.getNom() %>
                                    <span class="badge pull-right"><%= t.getMatricule() %></span>
                                </a>
                            </li>
                            <% } %>
                        </ul>
                    </div>
                    <div class="col-lg-2 text-center">
                        <ul class="list-group text-center">
                            <% for (Technicien t : ((Manager) employe).getEquipe()) { %>
                            <li class="list-group-item"><a href=""><span class="glyphicon glyphicon-remove"></span></a></li>
                            <% } %>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        </form>
        <div class="col-lg-6">
            <input form="saveForm" class="btn btn-primary" type="submit" value="Enregistrer"/>
                <a href="" class="btn btn-danger">Supprimer</a>
        </div>

        <div class="col-lg-6">
            <% if( employe instanceof Manager && employe.getId() != null) { %>
            <form action="" method="get">
                <div class="col-lg-10">
                    <input type="text" name="matricule" value="" placeholder="Ajouter un technicien avec le matricule..." class="form-control">
                </div>
                <div class="col-lg-2 text-center">
                    <button type="submit" class="btn-success list-group-item list-group-item-action"><span class="glyphicon glyphicon-plus"></span></button>
                </div>
            </form>
            <% } else if( employe instanceof Technicien && employe.getId() != null) { %>
            <div class="row">
                <% if( ((Technicien) employe).getManager() != null) { %>
                <div class="col-lg-12">
                    <label class="form-control-label">Manager</label>
                </div>
                <div class="col-lg-10">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a href="/employes/${employe.manager.id}">${employe.manager.prenom} ${employe.manager.nom}
                                <span class="badge pull-right">${employe.manager.matricule}</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-2">
                    <li class="list-group-item"><a href=""><span class="glyphicon glyphicon-remove"></span></a></li>
                </div>
                <% } else { %>
                <form action="" method="get">
                    <div class="col-lg-10">
                        <input type="text" name="matricule" value="" placeholder="Ajouter un manager avec le matricule..." class="form-control">
                    </div>
                    <div class="col-lg-2 text-center">
                        <button type="submit" class="btn-success list-group-item list-group-item-action"><span class="glyphicon glyphicon-plus"></span></button>
                    </div>
                </form>
                <% } %>
            </div>
            <% } %>
        </div>
    </div>
</div>
<%@ include file="../tags/footer.jsp" %>