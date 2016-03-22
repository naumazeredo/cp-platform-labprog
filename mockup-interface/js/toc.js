$('#toc-sidebar').affix({
    offset: {
        top: $('#toc-sidebar').offset().top-55
    }
});

$('body').scrollspy({ target: '#toc-sidebar' });
