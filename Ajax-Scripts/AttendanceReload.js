function getAspControlID(id) {
    var aspid = $("[id$=" + id + "]").attr("id");
    return aspid;
}

$(document).ready((function () {
    $("#" + getAspControlID("attntbl")).DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": false,
        "buttons": ["copy", "csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#' + getAspControlID("attntbl") + '_wrapper .col-md-6:eq(0)');
}));