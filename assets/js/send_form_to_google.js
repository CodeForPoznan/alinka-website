googleFormUrl = localGoogleFormUrl ? localGoogleFormUrl : googleFormUrl;

function postContactToGoogle() {
    var email = $('#email').val();
    $.ajax({
        url: googleFormUrl,
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
