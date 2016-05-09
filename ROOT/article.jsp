<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Sophos - Coding Wiki</title>

    <!-- Bootstrap -->
    <link href="/vendor/bootstrap.min.css" rel="stylesheet">
    <link href="/vendor/font-awesome.min.css" rel="stylesheet">
    <link href="/vendor/simple-sidebar.css" rel="stylesheet">

    <link href="/styles/style.css" rel="stylesheet">
  </head>
  <body >
    <!-- Navigation Bar -->
    <header>
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid" id="menu">
          <div class="navbar-header">
            <span class="navbar-brand" id="menu-brand" data-toggle="toggle" data-target="#wrapper">
              <span class="fa fa-code fa-lg"></span> Sophos
            </span>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>

          <div class="collapse navbar-collapse">
            <div class="navbar-form navbar-left">
              <div class="form-group has-feedback">
                <form action="/sophos" method="GET">
                  <input type="text" name="search" class="form-control" placeholder="Search">
                  <i class="form-control-feedback glyphicon glyphicon-search"></i>
                </form>
              </div>
            </div>
            <div class="nav navbar-nav navbar-right">
              <p class="navbar-text hidden-xs"><i class="fa fa-user"></i> Username </p>
              <button type="button" class="btn btn-default navbar-btn">Sign in</button>
              <!--<button type="button" class="btn btn-default navbar-btn">Register</button>-->
            </div>
          </div>
        </div>
      </nav>
    </header>

    <div id="wrapper">
      <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
          <li><a href="/sophos">Home</a></li>
          <li><a href="#">Categorias</a></li>
          <li><a href="#">Artigos</a></li>
        </ul>
      </div>

      <!-- Main Content -->
      <div id="page-content-wrapper">
        <div class="container-fluid">
          <div class="col-md-9 col-sm-12" id="article"></div>
          <div class="col-md-3 hidden-sm hidden-xs">
            <nav id="toc-sidebar"></nav>
          </div>
        </div>
      </div>
    </div>

    <!-- Page footer -->
    <footer>
      <div class="text-center">
        <small>&copy; &lt;Sophos 2016&gt;</small>
      </div>
    </footer>

    <!-- Plugins -->
    <script src="/vendor/jquery-2.1.3.min.js"></script>
    <script src="/vendor/bootstrap.min.js"></script>
    <script src="/vendor/anchor.min.js"></script>
    <script src="/vendor/marked.min.js"></script>
    <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML"></script>

    <!-- Scripts -->
    <script src="/js/scripts.js"></script>

    <script>
var title = '# ' + decodeURI('<%=request.getAttribute("name")%>'.replace(/%5C/g, '%5C%5C')); // POG: to use the string in another function we have to escape the escape character...
var content = decodeURI('<%=request.getAttribute("content")%>'.replace(/%5C/g, '%5C%5C'));
marked(title + '\n\n' + content,
function(err, content) {
  $('#article').html(content);
  postrender();
  createtoc();
});
    </script>

  </body>
</html>
