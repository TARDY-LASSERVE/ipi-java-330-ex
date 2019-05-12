<%@ include file="../tags/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! int i = 0; %>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1>Liste des employés</h1>
            <div class="btn-group">
                <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    Nouvel employé
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="/employes/new/technicien">Technicien</a></li>
                    <li><a href="/employes/new/commercial">Commercial</a></li>
                    <li><a href="/employes/new/manager">Manager</a></li>
                </ul>
            </div>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th scope="col">
                    <c:choose>
                        <c:when test="${sortProperty.equals('matricule')}">
                            <c:choose>
                                <c:when test="${sortDirection.equals('DESC')}">
                                    Matricule <a href="/employes?page=${pageAffichage}&size=${size}&sortDirection=ASC&sortProperty=matricule"><span class="glyphicon glyphicon-chevron-down"></span></a>
                                </c:when>
                                <c:otherwise>
                                    Matricule <a href="/employes?page=${pageAffichage}&size=${size}&sortDirection=DESC&sortProperty=matricule"><span class="glyphicon glyphicon-chevron-up"></span></a>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <a href="/employes?page=${page}&size=${size}&sortDirection=ASC&sortProperty=matricule">Matricule</a>
                        </c:otherwise>
                    </c:choose>
                    </th>
                    <th scope="col">
                        Nom <a href=""><span class="glyphicon glyphicon-chevron-down"></span></a>
                    </th>
                    <th scope="col">
                        <a href="">Prénom</a>
                    </th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${employes.getContent()}" var="employe">
                    <tr>
                        <th scope="row"><c:out value = "${employe.matricule}"/></th>
                        <td><c:out value = "${employe.nom}"/></td>
                        <td><c:out value = "${employe.prenom}"/></td>
                        <td><a href="/employes/${employe.id}">Détail</a></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="row">
                <div class="col-lg-6">
                    <p>Affichage des employés ${numOfEmploye} à ${numOfElements} sur un total de ${employes.getTotalElements()}</p>
                </div>
                <div class="col-lg-6">
                    <ul class="pagination">
                        <c:if test="${!employes.isFirst()}">
                            <li><a href="/employes?page=${previousPage}&size=${size}&sortProperty=${sortProperty}&sortDirection=${sortDirection}">&laquo;</a></li>
                        </c:if>
                        <li><a href="#">Page ${pageAffichage}</a></li>
                        <c:if test="${!employes.isLast()}">
                            <li><a href="/employes?page=${nextPage}&size=${size}&sortProperty=${sortProperty}&sortDirection=${sortDirection}">&raquo;</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../tags/footer.jsp" %>
