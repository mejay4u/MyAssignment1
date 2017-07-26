$(document).ready(function () {
    var links = [
        {
            "bgcolor": "red",
            "icon": "+"
        },
        {
            "url": "http://www.example.com",
            "bgcolor": "red",
            "color": "#fffff",
            "icon": "<i class='fa fa-phone'></i>",
            "target": "_blank"
        },
        {
            "url": "http://www.example.com",
            "bgcolor": "black",
            "color": "white",
            "icon": "<i class='fa fa-music'></i>"
        }
    ]
    $('.kc_fab_wrapper').kc_fab(links);
});