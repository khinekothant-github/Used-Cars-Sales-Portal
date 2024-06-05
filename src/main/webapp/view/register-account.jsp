<%@ include file="components/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <%@ include file="components/header.jsp" %>
    <link rel="stylesheet" href="/css/form.css" />
  </head>
  <body>
    <!-- Navbar -->
    <%@ include file="components/navbar.jsp" %>

    <!-- Main -->
    <main>
      <div class="container d-flex justify-content-center">
        <div class="form-wrapper small">
          <h2 class="form-header">Register</h2>
          <%if (request.getAttribute("error") != null) {%>
          <div class="error-message text-danger m-2 fw-bold text-center">${error}</div>
          <%}%>
          <form:form action="accountProcess" method="POST" modelAttribute="account">
            <label class="form-label fs-6">Username</label>
            <div>
              <form:errors path="username" cssClass="error" />
            </div>
            <form:input class="form-control" type="text" path="username" cssErrorClass="form-control error-border" />

            <label class="form-label fs-6">Password</label>
            <div>
              <form:errors path="password" cssClass="error" />
            </div>
            <form:input class="form-control" type="password" path="password" cssErrorClass="form-control error-border" />

            <button class="btn btn-primary mt-3 form-button" type="submit">Register</button>
          </form:form>
        </div>
      </div>
    </main>

    <!-- Footer -->
    <%@ include file="components/footer.jsp" %>
  </body>
</html>
