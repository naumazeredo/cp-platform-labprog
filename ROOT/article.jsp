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
          <div class="col-md-9 col-sm-12" id="article"></div>
          <!-- Table of Contents -->
          <div class="col-md-3 hidden-sm hidden-xs"><nav id="toc-sidebar"></nav></div>
        </div>
      </div>
    </div>

    <!-- Page footer -->
    <%@ include file="/common/footer.html" %>

    <!-- Scripts -->
    <%@ include file="/common/scripts.html" %>
    <script src="/vendor/marked.min.js"></script>

    <script>
      rendermarkdown('<%=request.getAttribute("name")%>', '<%=request.getAttribute("content")%>');
    </script>

  </body>
</html>
