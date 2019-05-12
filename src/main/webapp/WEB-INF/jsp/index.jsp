<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="tags/header.jsp" %>
<div class="container">
    <div class="jumbotron">
        <h1><% out.print("Bienvenue"); %> dans l'interface de gestion des <span>${nbEmployes}</span> employés !</h1>
        <p>Cette application web est paramétrée pour récupérer les données d'une base <em>entreprise</em> sur le serveur MySQL situé à <code>http://localhost:3306</code>.</p>
        <p>Il est nécessaire de développer les contrôleurs et de compléter les JSP existantes. Voici l'ensemble des fonctionnalités :</p>
        <ul class="list-group">
            <li class="list-group-item">
                <h4 class="list-group-item-heading">1 - Compter le nombre d'employés</h4>
                <p class="list-group-item-text">Dans le titre ci-dessus, on doit voir apparaître le nombre d'employés : <em>Bienvenue dans l'interface de gestion des X employés</em>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">2 - Afficher un employé</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/5">ici</a>, on peut afficher les informations basiques de l'employé d'identifiant 5 (matricule M00001). On consulte l'URL <code>/employes/5</code>. En cliquant <a href="/employes/0">ici</a>, on essaye d'afficher l'employé d'identifiant 0 mais on doit être redirigé vers la page d'erreur car il n'existe pas.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">3 - Recherche par matricule</h4>
                <p class="list-group-item-text">Lorsqu'on recherche le matricule <em>C00019</em> dans la barre de recherche, on tombe sur <em>Sarah Renault</em>. L'URL auquel on accède est <code>/employes?matricule=C00019</code>. Lorsqu'on recherche un matricule inexistant commme <em>ABCDEF</em>, on doit être redirigé vers la page d'erreur.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">4 - Liste des employés</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes?page=0&size=10&sortDirection=ASC&sortProperty=matricule">ici</a>, tous les employés sont affichés, de manière paginée. Il est possible de changer de page en utilisant les boutons. L'URL utilisée est <code>/employes?page=0&size=10&sortProperty=matricule&sortDirection=ASC</code></p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">5 - Création d'un Commercial</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/new/commercial">ici</a> ou via le bouton <em>Nouvel employé</em>, <em>Commercial</em>, présent dans la liste des employés, on accède au formulaire de création d'un commercial. L'appel qui est effectué est <code>POST /commercials/save</code> avec les données du formulaire qui sont envoyées.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">6 - Modification d'un Commercial</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/8">ici</a> ou en consultant les détails du commercial de matricule <em>C00002</em> (id 8), il est possible de modifier les informations du commercial d'identifiant 8 qui sont persistées en base de donnée lorsqu'on clique sur le bouton <em>Enregistrer</em>. L'URL qui est appelé est <code>POST /commercials/8</code> avec les données du formulaire qui sont envoyées.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">7 - Suppression d'un Commercial</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/22">ici</a> ou en consultant les détails du commercial de matricule <em>C00018</em> (id 22), il est possible de supprimer ce dernier lorsqu'on clique sur le bouton <em>Supprimer</em>. L'appel qui est effectué est <code>GET /employes/22/delete</code>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">8 - Création, modification et suppression d'un Technicien</h4>
                <p class="list-group-item-text">Faire la même chose que les trois questions précédentes pour les techniciens. Le chemin de l'API est <code>/techniciens</code>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">9 - Création, modification et suppression d'un Manager</h4>
                <p class="list-group-item-text">Faire la même chose que la question précédente pour les managers. Le chemin de l'API est <code>/managers</code>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">10 - Ajouter ou supprimer un technicien dans l'équipe d'un manager</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/532">ici</a> ou en consultant le détail du manager <em>M00528</em> (id 532), il est possible de supprimer (Appel API <code>GET /managers/532/techniciens/576/delete</code>) un membre de son équipe (ici le technicien d'id 576) avec le bouton <span class="glyphicon glyphicon-remove"></span> et d'ajouter (Appel API <code>GET /managers/532/techniciens/add?matricule=T00110</code>) un membre à l'équipe en renseignant son matricule (dans l'exemple T00110) et en cliquant sur le bouton <span class="glyphicon glyphicon-plus"></span>.</p>
            </li>
            <li class="list-group-item">
                <h4 class="list-group-item-heading">11 - Ajouter ou supprimer un manager à un technicien</h4>
                <p class="list-group-item-text">En cliquant <a href="/employes/576">ici</a> ou en consultant le détail du technicien <em>T00572</em> (id 576), il est possible de supprimer (<code>GET /techniciens/576/manager/remove</code>) son manager avec le bouton <span class="glyphicon glyphicon-remove"></span> et d'ajouter (Appel API <code>GET /techniciens/576/manager/M00528/add</code>) un manager en renseignant son matricule (dans l'exemple M00528) et en cliquant sur le bouton <span class="glyphicon glyphicon-plus"></span>.
                </p>
            </li>
        </ul>
    </div>
</div>
<%@ include file="tags/footer.jsp" %>


