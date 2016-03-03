$('#toc-sidebar').affix({
    offset: {
        top: $('#toc-sidebar').offset().top
    }
});

$('body').scrollspy({ target: '#toc-sidebar' });
