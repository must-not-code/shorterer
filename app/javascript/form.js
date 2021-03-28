$(() => $(document).on('ajax:success', function(event) {
  var [data, status, xhr] = event.detail;
  if (data.short_url) {
    $('#form').html('<h1><a href="' + data.short_url + '">' + data.short_url + '</a></h1>');
  }
  if (data.error) {
    $('#error').text(data.error);
  }
}));
