<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../header.jsp" %>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header">Admin Section</h1>
    <h2 class="sub-header">Create New User</h2>

    <form:form method="POST" modelAttribute="user" class="form-horizontal">
        <form:input type="hidden" path="id" id="id"/>

        <div class="row">
            <div class="form-group col-md-10">
                <label class="col-md-3 control-lable" for="email">Email</label>
                <div class="col-md-7">
                    <c:choose>
                        <c:when test="${edit}">
                            <form:input type="text" path="email" id="email" class="form-control input-sm" disabled="true"/>
                        </c:when>
                        <c:otherwise>
                            <form:input type="text" path="email" id="email" class="form-control input-sm" />
                            <div class="has-error">
                                <form:errors path="email" class="bg-danger"/>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-10">
                <label class="col-md-3 control-lable" for="firstName">First Name</label>
                <div class="col-md-7">
                    <form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
                    <div class="has-error">
                        <form:errors path="firstName" class="bg-danger"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-10">
                <label class="col-md-3 control-lable" for="lastName">Last Name</label>
                <div class="col-md-7">
                    <form:input type="text" path="lastName" id="lastName" class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="lastName" class="bg-danger"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-10">
                <label class="col-md-3 control-lable" for="password">Password</label>
                <div class="col-md-7">
                    <form:input type="password" path="password" id="password" class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="password" class="bg-danger"/>
                    </div>
                </div>
            </div>
        </div>

        <%--<div class="row">--%>
            <%--<div class="form-group col-md-12">--%>
                <%--<label class="col-md-3 control-lable" for="email">Email</label>--%>
                <%--<div class="col-md-7">--%>
                    <%--<form:input type="text" path="email" id="email" class="form-control input-sm" />--%>
                    <%--<div class="has-error">--%>
                        <%--<form:errors path="email" class="help-inline"/>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

        <div class="row">
            <div class="form-group col-md-10">
                <label class="col-md-3 control-lable" for="active">Active</label>
                <div class="col-md-7">
                    <input type="checkbox" id="active" name="active" checked />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-group col-md-10">
                <label class="col-md-3 control-lable" for="roles">Roles</label>
                <div class="col-md-7">
                    <form:select path="roles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm" />
                    <div class="has-error">
                        <form:errors path="roles" class="bg-danger"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="form-actions floatRight">
                <c:choose>
                    <c:when test="${edit}">
                        <input type="submit" value="Update" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
                    </c:when>
                    <c:otherwise>
                        <input type="submit" value="Register" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">Cancel</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>

</div>

<%@include file="../footer.jsp" %>