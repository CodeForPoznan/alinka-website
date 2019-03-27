googleFormUrl = localGoogleFormUrl || googleFormUrl;
googleFormEntry = localGoogleFormEntry || googleFormEntry;

function postContactToGoogle(event) {
    var email = $('#email').val();
    $.ajax({
        url: googleFormUrl,
        data: { [googleFormEntry]: email },
        type: "POST",
        dataType: "xml",
        statusCode: {
            0: function () {

            },
            200: function () {

            }
        }
    });

    event.preventDefault();
}
