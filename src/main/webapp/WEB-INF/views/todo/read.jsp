<%--
  Created by IntelliJ IDEA.
  User: treso
  Date: 2023-02-17
  Time: 오전 6:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
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
          <div class="card-header">
            Featured
          </div>
          <div class="card-body">

            <div class="input-group mb-3">
              <span class="input-group-text">TNO</span>
              <input type="text" name="tno" class="form-control" value=<c:out value="${dto.tno}"></c:out> readonly>
            </div>

            <div class="input-group mb-3">
              <span class="input-group-text">Title</span>
              <input type="text" name="title" class="form-control" value='<c:out value="${dto.title}"></c:out>' readonly>
            </div>

            <div class="input-group mb-3">
              <span class="input-group-text">DueDate</span>
              <input type="date" name="dueDate" class="form-control" value=<c:out value="${dto.dueDate}"></c:out> readonly>
            </div>

            <div class="input-group mb-3">
              <span class="input-group-text">Writer</span>
              <input type="text" name="writer" class="form-control" value=<c:out value="${dto.writer}"></c:out> readonly>
            </div>

            <div class="form-check">
              <label class="form-check-label">
                Finished &nbsp;
              </label>
              <input class="form-check-input" type="checkbox" name="finished" ${dto.finished?"checked":""} disabled>
            </div>

            <div class="my-4">
              <div class="float-end">
                <button type="button" class="btn btn-primary">Modify</button>
                <button type="button" class="btn btn-secondary">List</button>
              </div>
            </div>

            <script>
              document.querySelector(".btn-primary").addEventListener("click", function (e) {
                self.location = "/todo/modify?tno="+${dto.tno}
              }, false)

              document.querySelector(".btn-secondary").addEventListener("click", function (e) {
                self.location = "/todo/list";
              }, false)
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
