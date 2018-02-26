var loading
$(document).ready(function() {
  loading = $('#loading');
  loading.hide();

  jQuery.ajaxSetup({
    beforeSend: function() {
      console.log('sending');
    },
    complete: function() {
      console.log('complete');
    }
  })
})

