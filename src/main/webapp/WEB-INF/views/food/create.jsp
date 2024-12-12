<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <jsp:include page="/WEB-INF/include/style.jsp"/>
  <title>Create :: Food</title>
</head>
<body data-bs-theme="dark">
<jsp:include page="/WEB-INF/include/navbar.jsp"/>
<div class="container py-2">
  <div class="py-4 text-center">
    <h1>Create Food</h1>
  </div>
  <form method="post" action="${pageContext.request.contextPath}/food/create">
    <div class="row">
      <div class="col-md">
        <div class="form-floating mb-3">
          <input name="name" type="text" class="form-control" id="nameInput" placeholder="Food name" value="<c:out value="${bounceDTO.name}" />">
          <label for="nameInput">Food name</label>
        </div>
      </div>
      <div class="col-md">
        <div class="form-floating mb-3">
          <input name="wonPrice" type="number" class="form-control" id="priceInput" placeholder="Price" value="<c:out value="${bounceDTO.wonPrice}" />">
          <label for="priceInput">Price (KRW)</label>
        </div>
      </div>
    </div>

    <div class="form-floating mb-3">
      <input name="until" type="datetime-local" class="form-control" id="untilInput" placeholder="Order limit" value="<c:out value="${bounceDTO.until}" />">
      <label for="untilInput">Order Limit</label>
    </div>
    <div class="form-floating mb-3">
      <textarea class="form-control" name="description" placeholder="Description" id="descriptionInput" style="height: 200px"><%--
          --%><c:out value="${bounceDTO.description}" /><%--
        --%></textarea>
      <label for="descriptionInput">Description</label>
    </div>
    <div>
      <input type="submit" class="btn btn-primary" value="Create">
    </div>
  </form>
  <c:if test="${validation != null}">
    <div class="py-4 text-center">
      <c:forEach items="${validation}" var="error">
        <div class="alert alert-danger" role="alert">
            <c:out value="${error.getField()}"/> <c:out value="${error.defaultMessage}" />
        </div>
      </c:forEach>
    </div>
  </c:if>
</div>
</body>
</html>
