<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,sophos.Article,sophos.Category" %>

<% ArrayList<Category> categories = (ArrayList<Category>)request.getAttribute("categories"); %>

<!DOCTYPE html>
<html lang="pt">
  <head>
    <%@ include file="/common/header.html" %>
    <title>Sophos - Coding Wiki</title>
  </head>
  <body >
    <!-- Navigation Bar -->
    <%@ include file="/common/nav.html" %>

    <div id="wrapper">
      <%@ include file="/common/sidebar.html" %>

      <!-- Main Content -->
      <div id="page-content-wrapper">
        <div class="container-fluid">
          <form action="/sophos/new-article" method="POST">
            <div class="col-md-9 col-sm-12" id="article-control">
              <div class="pull-right">
                <button type="button" class="btn" id="preview" onclick="show_preview()">Preview</button>
                <button type="button" class="btn" id="edit" onclick="show_edit()">Edit</button>
                <button type="submit" class="btn" id="save">Save</button>
              </div>
            </div>
            <div class="col-md-9 col-sm-12" id="article"></div>

            <div class="col-md-9 col-sm-12 form-group" id="edit-article">
              <label for="title">Title</label>
              <input type="text" name="title" placeholder="Title" id="title" class="form-control">

              <label for="content">Content</label>
              <textarea name="content" placeholder="Content" id="content" class="form-control"></textarea>

              <label for="category">Category</label>
              <select class="form-control" id="category" name="category">
                <% for (int i = 0; i < categories.size(); i++) { %>
                <option value="<%= categories.get(i).getId() %>"><%= categories.get(i).getName() %></option>
                <% } %>
              </select>
            </div>
          </form>

          <!-- Table of Contents -->
          <div class="col-md-3 hidden-sm hidden-xs"><nav id="toc-sidebar"></nav></div>
        </div>
      </div>
    </div>

    <div id="move-top-wrapper"><div id="move-top"><span class="fa fa-arrow-up fa-lg"></span></div></div>

    <!-- Page footer -->
    <%@ include file="/common/footer.html" %>

    <!-- Scripts -->
    <%@ include file="/common/scripts.html" %>
    <script src="/vendor/marked.min.js"></script>

    <script>
      show_edit();
    </script>

  </body>
</html>
