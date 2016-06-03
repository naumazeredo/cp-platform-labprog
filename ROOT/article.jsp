<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,sophos.Article,sophos.Category,sophos.Problem" %>

<% Article article = (Article)request.getAttribute("article"); %>
<% ArrayList<Category> categories = (ArrayList<Category>)request.getAttribute("categories"); %>
<% ArrayList<Problem> problems = (ArrayList<Problem>)request.getAttribute("problems"); %>

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
          <form action="/sophos/article/<%= article.getId() %>" method="POST" id="article-form">
            <div class="col-md-9 col-sm-12" id="article-control">
              <button type="button" class="btn" id="cancel" onclick="show_article()">Cancel</button>
              <div class="pull-right">
                <button type="button" class="btn" data-toggle="modal" data-target="#problems">Problems</button>
                <button type="button" class="btn" id="preview" onclick="show_preview()">Preview</button>
                <button type="button" class="btn" id="edit" onclick="show_edit()">Edit</button>
                <button type="submit" class="btn" id="save">Save</button>
              </div>
            </div>
            <div class="col-md-9 col-sm-12" id="article"></div>

            <!-- Problems -->
            <div class="modal fade" id="problems" tabindex="-1" role="dialog" aria-labelledby="problemsLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="problemsLabel">Problems</h4>
                        </div>
                        <div class="modal-body">
                            <%
                            if (problems.size() > 0) {
                                for(int i=0; i < problems.size(); ++i) {
                                    Problem p = problems.get(i);
                                    %><%=i+1%>. [<%=p.getName()%>](<%=p.getLink()%>)
<%}
                            } else { %>
                                <p> No problems for this article yet :( </p> <%
                            }%>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-9 col-sm-12 form-group" id="edit-article">
              <label for="title">Title</label>
              <input type="text" name="title" placeholder="Title" id="title" class="form-control">

              <label for="content">Content</label>
              <textarea name="content" placeholder="Content" id="content" class="form-control"></textarea>

              <label for="category">Category</label>
              <select class="form-control" id="category" name="category">
                <% for (int i = 0; i < categories.size(); i++) { %>
                <option value="<%= categories.get(i).getId() %>" <% if (article.getCategory().getId() == categories.get(i).getId()) { %>selected<% } %>><%= categories.get(i).getName() %></option>
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
      var title = '<%= article.getName() %>';
      var content = '<%= article.getContent() %>';

      show_article();

      $('#article-form').submit(function() {
        $('#title').val(encodeURI($('#title').val()));
        $('#content').val(encodeURI($('#content').val()));
        return true;
      });
    </script>

  </body>
</html>
