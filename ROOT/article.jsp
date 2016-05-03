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
                <input type="text" class="form-control" placeholder="Search">
                <i class="form-control-feedback glyphicon glyphicon-search"></i>
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


    <!-- Scripts -->
    <script src="/js/scripts.js"></script>

    <script>
marked('# <%=request.getAttribute("name")%>\n\n<%=request.getAttribute("content")%>',
function(err, content) {
  $('#article').html(content);
  postrender();
  createtoc();
});

/*
marked('\
# Test\n\n\
## Section 1\n\n\
Lorem ipsum dolor sit amet, consectetur adipiscing elit. In fermentum accumsan metus eget vulputate. Donec sodales magna sed ornare sagittis. Ut vel turpis fringilla, porttitor odio a, finibus massa. Aenean scelerisque sagittis eros, nec sollicitudin velit viverra nec. Phasellus pellentesque nulla sit amet nibh placerat dapibus ut sit amet velit. Aenean aliquet rhoncus nunc quis pellentesque. Nullam id nisl mauris. Nullam pharetra posuere turpis.\n\n\
### Subsection 1\n\n\
Nam tincidunt commodo lacus, nec tempus nisi lobortis sollicitudin. Aliquam vitae nisl pellentesque, hendrerit nisi in, tempus diam. Quisque nulla sem, gravida eu augue vel, semper sollicitudin nunc. Duis aliquam, urna et ornare tempor, lacus quam aliquam lorem, sed eleifend neque lacus at erat. Cras rhoncus, nisl eget hendrerit pulvinar, sapien diam tristique enim, ut facilisis erat urna at neque. Vestibulum ullamcorper dolor id aliquet porttitor. Quisque euismod dignissim est eu fringilla. Morbi condimentum faucibus nunc, et tempor purus maximus a.\nDuis fringilla augue sed arcu tempus interdum. Nunc aliquet imperdiet nulla non convallis. Duis a nulla a nibh cursus condimentum. Cras semper risus turpis, at aliquam quam congue ut. Quisque lobortis vestibulum risus, nec tincidunt dolor scelerisque at. Ut blandit nisi non nulla commodo, eu molestie sapien rutrum. Fusce eleifend, dui ac dictum vestibulum, erat orci sagittis velit, et condimentum neque lectus viverra nunc. Aenean mattis augue metus, sed volutpat arcu tristique et. Nullam non nisl lacinia risus tempus auctor a ut nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\n\
### Subsection 2\n\n\
Maecenas id velit eget neque efficitur ultrices eget nec turpis. Nunc quis ullamcorper sapien. Duis nisl risus, ornare id volutpat ut, ultricies blandit massa. Sed eu gravida mi. Maecenas luctus et mi et blandit. In tempus tincidunt volutpat. Donec in porta nisl, ut feugiat orci. In auctor, purus at cursus venenatis, ligula nisi posuere libero, sit amet dignissim enim justo at mi. In hac habitasse platea dictumst. Fusce pellentesque eros vel bibendum maximus. Integer a sapien non tortor accumsan placerat in at leo. Suspendisse potenti. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Interdum et malesuada fames ac ante ipsum primis in faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque vulputate, turpis id molestie volutpat, diam orci tincidunt tortor, non faucibus lectus ex viverra enim.\nNam velit libero, euismod eget neque in, placerat tempus lorem. Fusce maximus commodo orci in consectetur. Curabitur vestibulum, justo et commodo laoreet, quam ante condimentum lorem, quis euismod metus est vitae velit. Duis a rutrum dolor, vulputate varius elit. Mauris at gravida metus. Aliquam lectus ante, dapibus a rutrum ac, euismod ac lectus. Phasellus porta accumsan justo in lacinia. Fusce id lacinia risus. Donec nec lorem posuere, dictum nunc dapibus, mollis eros. Sed id ligula condimentum dolor venenatis vestibulum. Etiam non odio metus. Pellentesque non magna maximus quam interdum pulvinar aliquet iaculis ante. Suspendisse vel vehicula eros.\n\n\
### Subsection 3\n\n\Nulla ornare auctor volutpat. Cras molestie bibendum facilisis. Suspendisse accumsan laoreet orci, vel egestas mauris. Cras aliquet, diam in viverra posuere, arcu eros finibus tellus, pulvinar malesuada elit nulla in massa. Curabitur id ornare purus. Aliquam erat volutpat. Curabitur et quam fermentum erat scelerisque cursus sit amet vel tortor. Integer pretium ligula in est ultrices egestas. Nulla condimentum mi et tellus congue, eget dignissim tortor pharetra. In at felis eu orci mollis laoreet a in purus. Fusce egestas mollis metus sed malesuada. Interdum et malesuada fames ac ante ipsum primis in faucibus.\nSed aliquam cursus hendrerit. Pellentesque auctor orci a dui euismod hendrerit. Maecenas venenatis ipsum non placerat vulputate. Ut dapibus, erat vel ornare ultricies, sapien tellus rhoncus ex, eu placerat mauris lectus efficitur leo. Aliquam condimentum justo ut neque gravida, ac sagittis est porta. Integer auctor quam turpis. In quis dolor pellentesque leo laoreet vehicula sed id enim. In hac habitasse platea dictumst. Donec facilisis porttitor facilisis. Praesent eu ornare eros, quis pretium orci. Cras bibendum sed erat nec ullamcorper. Aliquam eu imperdiet nulla. Donec consectetur facilisis nunc ac lacinia. In hac habitasse platea dictumst. Mauris malesuada posuere velit, vel vestibulum lacus semper at.\n\n\
## Section 2\n\n\
In dignissim non velit vitae ultricies. Nulla consectetur orci a magna gravida condimentum. Maecenas ac risus volutpat, accumsan ante quis, consectetur ex. Cras rhoncus facilisis est, sit amet scelerisque ex efficitur vel. Duis hendrerit elit nec velit vulputate, quis faucibus odio vehicula. Vivamus dictum lectus ut maximus aliquet. Sed elementum at diam id facilisis.\n\n\
### Subsection 1\n\n\
Nullam interdum pulvinar sapien, in gravida arcu consectetur ut. Sed volutpat justo pellentesque mi condimentum, ac elementum felis interdum. Maecenas pellentesque ipsum quis tincidunt porttitor. Integer nunc sem, tincidunt non eros quis, fermentum ultricies justo. Ut consequat ut felis ac consectetur. Morbi hendrerit hendrerit felis sed auctor. Morbi tempus ullamcorper pulvinar. In tempor vulputate ipsum, nec cursus arcu ultrices et. Praesent quam orci, molestie et suscipit lacinia, scelerisque at turpis. Integer pellentesque, lorem ut tristique viverra, massa elit sollicitudin tellus, ut posuere ante libero ac libero.\nNullam posuere sapien nec felis pulvinar pulvinar. Duis non nisl maximus, ullamcorper arcu eget, molestie massa. Aenean at pharetra risus. Nam hendrerit cursus pretium. Ut augue nunc, tincidunt sed augue in, ultrices euismod lorem. Vivamus id arcu sed orci euismod interdum ac dictum risus. Phasellus ultrices in quam at viverra. Nulla sem quam, viverra et lacus eget, dapibus bibendum odio. In urna est, facilisis quis orci sed, maximus gravida turpis. In et imperdiet nunc. Fusce pellentesque vel dolor et bibendum. Sed tempor turpis ut efficitur ultrices.\n\n\
### Subsection 2\n\n\
Etiam ac luctus sem. Vivamus hendrerit fringilla turpis in pretium. Vivamus mollis justo id consequat ornare. Quisque lobortis interdum consequat. Aliquam massa arcu, condimentum eu magna quis, feugiat mollis ipsum. Suspendisse lectus leo, porttitor at vulputate a, tristique sit amet elit. Aliquam elementum ullamcorper leo quis accumsan. Donec non quam in tortor imperdiet convallis. Vivamus semper accumsan mauris quis facilisis. Fusce ut quam consectetur, viverra nisl ac, venenatis leo. In gravida lorem a arcu semper, vel ultrices sem sagittis.\nQuisque ac lectus orci. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse consequat convallis neque nec ultrices. In euismod nunc in rhoncus faucibus. In finibus elementum ullamcorper. Proin malesuada quam venenatis, molestie magna ac, rutrum dui. Sed pharetra at ex a gravida. Vivamus pretium risus et urna scelerisque viverra. Praesent erat leo, iaculis non posuere vitae, gravida ac ante. Nulla eros mauris, commodo eget pulvinar ut, placerat faucibus nibh. Praesent consectetur neque erat, et feugiat odio accumsan ut. Sed consectetur magna vel augue imperdiet, vel dapibus ante porta.\n\n\
### Subsection 3\n\n\
Nunc purus leo, euismod nec iaculis lacinia, viverra sed sapien. Sed non tincidunt eros. Phasellus at vestibulum lacus. Aliquam non bibendum lacus, ut dictum urna. Curabitur lectus dolor, consectetur ut arcu in, dictum placerat arcu. Nulla quis quam justo. Sed laoreet elit eu dapibus ultrices.',
function(err, content) {
  $('#article').html(content);
  postrender();
  createtoc();
});
*/

    </script>

  </body>
</html>
