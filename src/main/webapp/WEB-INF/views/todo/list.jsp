<%--
  Created by IntelliJ IDEA.
  User: treso
  Date: 2023-02-17
  Time: 오전 6:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Todo List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<div class="container-fluid">
  <!--Header-->
  <div class="row">
    <div class="col">
      <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">Navbar</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Features</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Pricing</a>
              </li>
              <li class="nav-item">
                <a class="nav-link disabled">Disabled</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>

    <div class="row content">
      <div class="col">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title">Search </h5>
            <form action="/todo/list" method="get">
              <input type="hidden" name="size" value="${pageRequestDTO.size}">
              <div class="mb-3">
                <input type="checkbox" name="finished">완료 여부
              </div>
              <div class="mb-3">
                <input type="checkbox" name="types" value="t">제목
                <input type="checkbox" name="types" value="w">작성자
                <input type="text" name="keyword" class="form-control">
              </div>
              <div class="input-group mb-3 dueDateDiv">
                <input type="date" name="from" class="form-control">
                <input type="date" name="to" class="form-control">
              </div>
              <div class="input-group mb-3">
                <div class="float-end">
                  <button class="btn btn-primary" type="submit">Search</button>
                  <button class="btn btn-info" type="reset">Clear</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <div class="row content">
      <div class="col">
        <div class="card">
          <div class="card-header">
            Featured
          </div>
          <div class="card-body">
            <h5 class="card-title">Special title treatment</h5>
            <table class="table">
              <thead>
              <tr>
                <th scope="col">Tno</th>
                <th scope="col">Title</th>
                <th scope="col">Writer</th>
                <th scope="col">DueDate</th>
                <th scope="col">Finished</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${responseDTO.dtoList}" var="dto">
                <tr>
                  <th scope="row"><c:out value="${dto.tno}"/></th>
                  <td>
                    <a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none" data-tno="${dto.tno}">
                      <c:out value="${dto.title}"/>
                    </a>
                  </td>
                  <th scope="row"><c:out value="${dto.writer}"/></th>
                  <th scope="row"><c:out value="${dto.dueDate}"/></th>
                  <th scope="row"><c:out value="${dto.finished}"/></th>
                </tr>
              </c:forEach>
              </tbody>
            </table>

            <div class="float-end">
                <ul class="pagination flex-wrap">
                  <c:if test="${responseDTO.prev}">
                    <li class="page-item">
                      <a class="page-link" data-num="${responseDTO.start -1}">Previous</a>
                    </li>
                  </c:if>

                  <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                    <li class="page-item ${responseDTO.page == num? "active":""}">
                      <a class="page-link" data-num="${num}">${num}</a>
                    </li>
                  </c:forEach>

                  <c:if test="${responseDTO.next}">
                    <li class="page-item">
                      <a class="page-link" data-num="${responseDTO.end +1}">Next</a>
                    </li>
                  </c:if>
                </ul>
            </div>
            <script>
              document.querySelector(".pagination").addEventListener("click", function (e) {
                e.preventDefault()
                e.stopPropagation()

                const target = e.target

                if (target.tagName !== 'A') {
                  return
                }

                const num = target.getAttribute("data-num")

                self.location = `/todo/list?page=\${num}`
              }, false);
            </script>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row content">
    <h1>Content</h1>
  </div>

  <!--Footer-->
  <div class="row fixed-bottom" style="z-index: -100">
    <footer class="py-1 my-1">
      <p class="text-center text-muted">Footer</p>
    </footer>
  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>