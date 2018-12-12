function postContactToGoogle() {
    var email = $('#email').val();
    $.ajax({
        url: "https://docs.google.com/forms/d/e/1FAIpQLSdBDdzs0F0aPlOgaUaF2c0qXhkQk4lCero7n0QaaUHUCxuVSQ/formResponse",
        data: { "entry_771587508": email },
        type: "POST",
        dataType: "xml",
        statusCode: {
            0: function () {

            },
            200: function () {

            }
        }
    });
}
