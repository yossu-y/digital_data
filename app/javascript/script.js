//aboutページ（クリックして開くメニュー）
document.addEventListener("turbolinks:load", function() {
  $(document).ready(function() {
    $('.menu h3').on('click', function() {
      $(this).next().toggleClass('hidden');
    });
  });
})
