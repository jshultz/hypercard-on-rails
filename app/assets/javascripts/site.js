/**
 * Created by jasonshultz on 1/19/15.
 */

$(function() {

    if ($('form.edit_profile').length > 0) {
        $('form.edit_profile legend').on('click', function(e) {
            console.log(this)
            $(this).next().toggle('slow', function() {
            })
        })
    }

});