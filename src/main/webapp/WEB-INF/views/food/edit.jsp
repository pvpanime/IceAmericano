<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <jsp:include page="/WEB-INF/include/style.jsp"/>
  <title>Edit :: Food</title>
</head>
<body data-bs-theme="dark">
<jsp:include page="/WEB-INF/include/navbar.jsp"/>
<div class="container py-2">
  <div class="py-4 text-center">
    <h1>Edit Food</h1>
  </div>
  <form id="MainForm" method="post" action="${pageContext.request.contextPath}/food/edit">
    <input type="hidden" name="id" value="<c:out value="${foodDTO.id}"/> "/>
    <div class="row">
      <div class="col-md">
        <div class="form-floating mb-3">
          <input name="name" type="text" class="form-control" id="nameInput" placeholder="Food name" value="<c:out value="${foodDTO.name}" />">
          <label for="nameInput">Food name</label>
        </div>
      </div>
      <div class="col-md">
        <div class="form-floating mb-3">
          <input name="wonPrice" type="number" class="form-control" id="priceInput" placeholder="Price" value="<c:out value="${foodDTO.wonPrice}" />">
          <label for="priceInput">Price (KRW)</label>
        </div>
      </div>
    </div>

    <div class="form-floating mb-3">
      <input name="until" type="datetime-local" class="form-control" id="untilInput" placeholder="Order limit" value="<c:out value="${foodDTO.until}" />">
      <label for="untilInput">Order Limit</label>
    </div>
    <div class="form-floating mb-3">
      <textarea class="form-control" name="description" placeholder="Description" id="descriptionInput" style="height: 200px"><%--
          --%><c:out value="${foodDTO.description}" /><%--
        --%></textarea>
      <label for="descriptionInput">Description</label>
    </div>
    <div>
      <input type="submit" class="btn btn-primary" value="Edit">
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
<jsp:include page="/WEB-INF/include/bs-script.jsp"/>
<script id="RequestPreserve" type="application/x-www-form-urlencoded"><c:out value="${requestDTO.usePage()}" /></script>
<script>

  function hide(name, value) {
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = name;
    input.value = value;
    return input;
  }

  const form = document.getElementById('MainForm');
  form.addEventListener('submit', (event) => {
    event.preventDefault();
    event.stopPropagation();

    const requestPreserved = document.getElementById('RequestPreserve').innerText.replace(/&amp;/g, '&');
    if (requestPreserved) {
      const usp = new URLSearchParams(requestPreserved);

      for (const [name, value] of usp.entries()) {
        form.append(hide(name, value));
      }
    }


    const formData = new FormData(form);
    console.log([...formData.entries()]);

    form.submit();
  })

</script>
</body>
</html>
