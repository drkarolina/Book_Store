$(document).ready(() => {
  $(document).on('click', '.checkbox-input', function () {
      $('.remove-account').toggleClass('disabled');

      $(this).is(':checked') ? activateRemoveAccountButton() : disabledRemoveAccountButton()

      function activateRemoveAccountButton() {
          $('.remove-account').removeAttr('disabled')
      }

      function disabledRemoveAccountButton() {
          $('.remove-account').attr('disabled', true)
      }
  });
});