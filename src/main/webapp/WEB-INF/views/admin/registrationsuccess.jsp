<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Admin Section</h1>


    <div class="row">
        <div class="form-group col-md-10">
            <div class="alert alert-success lead">
                ${success}
            </div>

            <span class="well floatRight">
			Go to <a href="<c:url value='list' />">Users List</a>
		</span>
        </div>
    </div>

</div>

<%@include file="../footer.jsp" %>
