<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <jsp:include page="/WEB-INF/include/style.jsp"/>
  <title>Food</title>
  <style>
      tr {
          cursor: pointer;
      }
  </style>
</head>
<body data-bs-theme="dark">
<jsp:include page="/WEB-INF/include/navbar.jsp"/>
<div class="container py-4">
  <main>
    <div class="jumbotron bg-dark text-light text-center py-5">
      <h1 class="display-1">Food</h1>
      <div class="row justify-content-center">
        <a class="col-auto btn btn-primary" href="${pageContext.request.contextPath}/food/create">Create New</a>
        <button id="SearchButton" type="button" class="btn btn-light col-auto" data-bs-toggle="collapse"
                data-bs-target="#SearchGroup">Search
        </button>
      </div>
    </div>
    <div class="collapse" id="SearchGroup">
      <div class="container">
        <div class="card card-body">
          <h3>Search</h3>
          <form id="SearchForm" action="${pageContext.request.contextPath}/food" method="GET">
            <div class="py-2">
              <div>Text</div>
              <div class="input-group">
                <input type="checkbox" class="btn-check" name="searchFor" id="UseName"
                       value="t" ${requestDTO.isSearchFor("t") ? "checked" : ""} autocomplete="off">
                <label class="btn btn-outline-light" for="UseName">Title</label>
                <input type="checkbox" class="btn-check" name="searchFor" id="UseDescription"
                       value="d" ${requestDTO.isSearchFor("d") ? "checked" : ""} autocomplete="off">
                <label class="btn btn-outline-light" for="UseDescription">Desc</label>
                <input type="text" class="form-control" name="search" placeholder="Search..."
                       value='<c:out value="${requestDTO.search != null ? requestDTO.search : \"\"}" />'
                       autocomplete="off">
              </div>
            </div>
            <div class="py-2">
              <div>Order limit range (From, To):</div>
              <div class="container">
                <div class="row">
                  <input type="datetime-local" class="form-control col" name="rangeStart" id="rangeStart"
                         autocomplete="off">
                  <input type="datetime-local" class="form-control col" name="rangeEnd" id="rangeEnd"
                         autocomplete="off">
                </div>
              </div>
            </div>
            <div class="container">
              <div class="row justify-content-between">
                <input type="submit" class="btn btn-primary col-auto" value="Search!">
                <a href="${pageContext.request.contextPath}/food" class="btn btn-danger col-auto">Clear Search</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <table class="table table-hover">
      <thead>
      <tr>
        <th>이름</th>
        <th>설명</th>
        <th>가격</th>
        <th>판매기한</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${foodDTO.list}" var="food">
        <tr data-food-id="${food.id}">
          <td><a href="/food/view/${food.id}${requestDTO.usePage()}"><c:out value="${food.name}"/></a></td>
          <td><c:out value="${food.description}"/></td>
          <td><c:out value="${food.wonPrice}"/></td>
          <td><c:out value="${food.until}"/></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <nav>
      <ul class="pagination justify-content-center">
        <c:if test="${foodDTO.start > 1}">
          <li class="page-item">
            <a class="page-link" href="${pageContext.request.contextPath}/food${requestDTO.usePage(1)}">
              1
            </a>
          </li>
          <li class="page-item disabled">
            <a class="page-link">
              &ctdot;
            </a>
          </li>
        </c:if>
        <c:forEach begin="${foodDTO.start}" end="${foodDTO.end}" var="pgIndex">
          <li class="page-item ${foodDTO.page == pgIndex? "active" : ""}">
            <a class="page-link" href="/food${requestDTO.usePage(pgIndex)}">
              <c:out value="${pgIndex}"/>
            </a>
          </li>
        </c:forEach>
        <c:if test="${foodDTO.end < dto.last}">
          <li class="page-item disabled">
            <a class="page-link">
              &ctdot;
            </a>
          </li>
          <li class="page-item">
            <a class="page-link" href="/food${requestDTO.usePage(dto.last)}">
              <c:out value="${foodDTO.last}"/>
            </a>
          </li>
        </c:if>
      </ul>
    </nav>
  </main>
</div>
<jsp:include page="/WEB-INF/include/bs-script.jsp"/>
<script>
  const f = document.getElementById("SearchForm");
  f.addEventListener("submit", (event) => {
    event.preventDefault();
    event.stopPropagation();
    const fd = new FormData(f);

    const realForm = document.createElement("form");

    let useSearch = !!fd.get("search");

    for (const [k, v] of fd.entries()) {
      if (!v) continue;
      if (!useSearch && (k === 'searchFor')) continue;
      const input = document.createElement("input");
      input.type = "hidden";
      input.name = k;
      input.value = v;
      realForm.appendChild(input);
    }

    document.body.appendChild(realForm);
    realForm.method = "GET";
    realForm.action = "${pageContext.request.contextPath}/food";
    realForm.submit();
  })
</script>
</body>
</html>
