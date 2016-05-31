<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <form>
            <div class="col-md-9 col-sm-12" id="article-control">
              <button type="button" class="btn" id="cancel" onclick="show_article()">Cancel</button>
              <div class="pull-right">
                <button type="button" class="btn" id="preview" onclick="show_preview()">Preview</button>
                <button type="button" class="btn" id="edit" onclick="show_edit()">Edit</button>
                <button type="button" class="btn" id="save">Save</button>
              </div>
            </div>
            <div class="col-md-9 col-sm-12" id="article"></div>

            <div class="col-md-9 col-sm-12" id="edit-article">
              <span>Title</span>
              <input type="text" name="title" placeholder="Title" id="title">

              <span>Content</span>
              <textarea name="content" placeholder="Content" id="content"></textarea>

              <span>References</span>
              <input type="text" name="references" id="references">
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
      var title = '<%=request.getAttribute("name")%>';
      var content = '<%=request.getAttribute("content")%>';

      show_article();
    </script>

  </body>
</html>
