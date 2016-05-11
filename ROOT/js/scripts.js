/************/
/* AnchorJS */
/************/

anchors.options.placement = 'left';

/*******************/
/* Article scripts */
/*******************/

/* Render markdown text */
function rendermarkdown(title, content) {
    var title = '# ' + decodeURI(title.replace(/%5C/g, '%5C%5C')); // POG: to use the string in another function we have to escape the escape character...
    var content = decodeURI(content.replace(/%5C/g, '%5C%5C'));
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

/* Move to top of the page */
$(document).scroll(function() {
    var y = $(this).scrollTop();
    if (y > 51) $('#move-top').fadeIn();
    else $('#move-top').fadeOut();

    var winBot = y + $(window).height();
    var footerTop = $(document).height() - $('footer').height();
    if (winBot > footerTop) {
        $('#move-top').css('bottom', winBot - footerTop);
    } else {
        $('#move-top').css('bottom', 0);
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
