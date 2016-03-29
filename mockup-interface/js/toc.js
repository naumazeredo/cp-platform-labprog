/*
$('#toc-sidebar').affix({
    offset: {
        top: $('#toc-sidebar').offset().top-55
    }
});
*/

function createtoc() {
    var toc = $('<ul />', {'class': 'nav'});
    toc.append($('<li />', {'id': 'toc-header', 'text': 'Table of Contents'}));

    $('#toc-sidebar').append(toc);

    var h2elem, h3elem;
    $('#article h2, #article h3').each(function(index, elem) {
        if (elem.nodeName === 'H2') {
            console.log("OK!");
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
}

createtoc();
$('body').scrollspy({ target: '#toc-sidebar' });
