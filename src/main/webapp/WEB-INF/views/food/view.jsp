<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <jsp:include page="/WEB-INF/include/style.jsp" />
  <title><c:out value="${foodDTO.name}" /> Food</title>
</head>
<body data-bs-theme="dark">
<jsp:include page="/WEB-INF/include/navbar.jsp"/>
<div class="container py-4">
  <main>
    <div class="jumbotron text-center py-5">
      <h1 class="display-1"><c:out value="${foodDTO.name}" /></h1>
      <section class="display-5 mb-4"><c:out value="${foodDTO.wonPrice}" />원</section>
      <section class="text-muted"><c:out value="${foodDTO.until}" />까지</section>
    </div>
    <section class="mb-4">
      <h3>상품설명</h3>
      <c:out value="${foodDTO.description}" />
    </section>
    <section class="mb-4 text-muted" style="font-size: 0.8rem;">
      등록일 = <c:out value="${foodDTO.added}" />
    </section>
  </main>
  <div class="container row">
    <a class="btn btn-secondary col-auto" href="/food${requestDTO.usePage()}">Back to list</a>
    <a class="btn btn-warning col-auto" href="/food/edit/${foodDTO.id}${requestDTO.usePage()}">Edit</a>
    <button id="deleteButton" class="btn btn-danger col-auto">Delete</button>
  </div>
</div>
<jsp:include page="/WEB-INF/include/bs-script.jsp" />
<script>
  function actionDelete() {
    const form = document.createElement('form');
    form.action = '/food/delete/<c:out value="${foodDTO.id}" />';
    form.method = 'POST';
    document.body.appendChild(form);
    form.submit();
  }

  document.getElementById("deleteButton").addEventListener("click", () => {
    if (window.confirm("Are you really sure you want to delete this task?"))
      actionDelete();
  })
</script>
</body>
</html>
