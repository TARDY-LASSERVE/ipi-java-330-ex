<%@ include file="tags/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    ${exception.message}
</div>
<%@ include file="tags/footer.jsp" %>

