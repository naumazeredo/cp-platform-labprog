/************/
/* AnchorJS */
/************/

anchors.options.placement = 'left';

/*******************/
/* Article scripts */
/*******************/

/* Treat markdown rendering ids */
function postrender() {
    var parent;
    $('#article h2, #article h3').each(function(index, elem) {
        $(elem).attr('class', 'anchor');
        if (elem.nodeName === 'H2') parent = elem.id;
        else $(elem).attr('id', parent+'-'+elem.id);
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
            h2elem.append($('<a/>', { 'href': '#'+elem.id, 'text': $(elem).text() }));
            h3elem = $('<ul/>', {'class': 'nav'});
        } else {
            h3elem.append($('<li/>').append($('<a/>', { 'href': '#'+elem.id, 'text': $(elem).text() })));
        }
    });

    if (h3elem) h2elem.append(h3elem);
    toc.append(h2elem);

    $('body').scrollspy({ target: '#toc-sidebar' });
}


/*************/
/* Side-menu */
/*************/

$('[data-toggle="toggle"').on('click', function() {
    $($(this).data('target')).toggleClass('toggled');
});
