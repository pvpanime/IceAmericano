<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <jsp:include page="/WEB-INF/include/style.jsp" />
  <title>Index</title>
</head>
<body data-bs-theme="dark">
<jsp:include page="/WEB-INF/include/navbar.jsp"/>
<div class="container py-4">
  <main>
    <div class="jumbotron bg-dark text-light text-center py-5">
      <h1 class="display-1">Index</h1>
    </div>
    <div class="list-group">
      <a class="list-group-item list-group-item-action" href="${pageContext.request.contextPath}/food">Food</a>
    </div>
  </main>
</div>
<jsp:include page="/WEB-INF/include/bs-script.jsp" />
</body>
</html>
