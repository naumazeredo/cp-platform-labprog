/************/
/* AnchorJS */
/************/

anchors.options.placement = 'left';

/*******************/
/* Article scripts */
/*******************/

/* Render markdown text */
function rendermarkdown(title, content) {
  var title = '# ' + decodeURIComponent(title.replace(/%5C/g, '%5C%5C')); // POG: to use the string in another function we have to escape the escape character...
  var content = decodeURIComponent(content.replace(/%5C/g, '%5C%5C'));
  marked(title + '\n\n' + content, function(err, content) {
    $('#article').html(content);
    postrender();
    createtoc();
  });
}

// TODO(naum): Get H1 elements and separate sections in TOC
/* Treat markdown rendering ids */
function postrender() {
  var parent;
  var sec = 0, sub = 0;
  $('#article h2, #article h3').each(function(index, elem) {
    $(elem).attr('class', 'anchor');
    if (elem.nodeName === 'H2') {
      sec++;
      sub = 0;
      $(elem).attr('id', "sec-"+sec);
    } else {
      sub++;
      $(elem).attr('id', "sec-"+sec+"-"+sub);
    }
  });
  anchors.add('.anchor');
}

/* Table of contents */
function createtoc() {
  var toc = $('<ul />', {'class': 'nav'});
  toc.append($('<li />', {'id': 'toc-header', 'text': 'Table of Contents'}));

  $('#toc-sidebar').html('');
  $('#toc-sidebar').append(toc);

  var h2elem, h3elem;
  $('#article h2, #article h3').each(function(index, elem) {
    if (elem.nodeName === 'H2') {
      if (h2elem) {
        if (h3elem.text()) h2elem.append(h3elem);
        toc.append(h2elem);
      }

      h2elem = $('<li/>');
      h2elem.append($('<a/>', { 'href': '#'+$(elem).attr('id'), 'text': $(elem).text() }));
      h3elem = $('<ul/>', {'class': 'nav'});
    } else {
      h3elem.append($('<li/>').append($('<a/>', { 'href': '#'+$(elem).attr('id'), 'text': $(elem).text() })));
    }
  });

  if (h2elem) {
    if (h3elem.text()) h2elem.append(h3elem);
    toc.append(h2elem);
  }

  $('body').scrollspy({ target: '#toc-sidebar' });
}

function cleartoc() { $('#toc-sidebar').html(''); }

/* Move to top of the page */
$(document).scroll(function() {
  var y = $(this).scrollTop();
  if (y > 80) $('#move-top-wrapper').fadeIn();
  else $('#move-top-wrapper').fadeOut();

  var winBot = y + $(window).height();
  var footerTop = $(document).height() - $('footer').height();
  if (winBot > footerTop) {
    $('#move-top-wrapper').css('bottom', winBot - footerTop);
  } else {
    $('#move-top-wrapper').css('bottom', 0);
  }
});

$('#move-top').on('click', function() {
  $('html,body').animate({ scrollTop: 0 }, 'fast');
});


/*************/
/* Side-menu */
/*************/

$('[data-toggle="toggle"').on('click', function() {
  $($(this).data('target')).toggleClass('toggled');
});

// Hides menu if clicking outside and screen is small
$('html').on('click', function() {
  if ($(window).width() < 768) { // Small window
    $('#wrapper').removeClass("toggled");
    console.log("hide");
  }
});

$('#sidebar-wrapper, #sidebar-toggle').on('click', function(e) {
  e.stopPropagation();
});


/****************/
/* Edit Article */
/****************/

/* Text area auto resize */
$('textarea').each(function () {
  this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
}).on('input', function () {
  this.style.height = 'auto';
  this.style.height = (this.scrollHeight) + 'px';
});

function show_article() {
  $('#edit-article').hide();
  $('#article').show();
  rendermarkdown(title, content);
  MathJax.Hub.Queue(["Typeset",MathJax.Hub,'#article'])();

  // Buttons
  $('#cancel').hide();
  $('#preview').hide();
  $('#edit').show();
  $('#save').hide();

  // Reset edit
  $('#title').val(decodeURIComponent(title.replace(/\+/g, '%20')));
  $('#content').val(decodeURIComponent(content.replace(/\+/g, '%20')));
}

function show_preview() {
  $('#edit-article').hide();
  $('#article').show();
  rendermarkdown($('#title').val().replace(/\\/g, '\\\\'), $('#content').val().replace(/\\/g, '\\\\'));
  MathJax.Hub.Queue(["Typeset",MathJax.Hub,'#article'])();

  // Buttons
  $('#cancel').show();
  $('#preview').hide();
  $('#edit').show();
  $('#save').show();
}

function show_edit() {
  $('#article').hide();
  $('#edit-article').show();
  cleartoc();

  // Buttons
  $('#cancel').show();
  $('#preview').show();
  $('#edit').hide();
  $('#save').show();
}
