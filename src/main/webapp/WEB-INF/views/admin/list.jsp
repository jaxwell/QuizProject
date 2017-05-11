<%@include file="../header.jsp" %>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Admin Section</h1>

    <h2 class="sub-header">Users</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>#</th>
                <th>Email</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Active</th>
                <th>Roles</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.email}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.active}</td>
                    <td><c:forEach items="${user.roles}" var="role">
                        [${role.type}]
                    </c:forEach>
                            </td>
                    <td><a href="<c:url value='edit-user-${user.email}' />" class="btn btn-success">edit</a></td>
                    <td><a href="<c:url value='delete-user-${user.email}' />" class="btn btn-danger">delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%@include file="../footer.jsp" %>

