class PasswordForm extends Form
  template: Template.passwordForm

  submit: ->
    data = @getDataFromForm()

    # Validate user data beforehand
    error = null
    if not data.oldPassword and not data.newPassword
      error = 'Update _what_, exactly?'
    else if not data.newPassword
      error = "New password can't be empty"

    if error
      @update(error: error, true)
    else
      Accounts.changePassword data.oldPassword, data.newPassword, (error) =>
        if error
          # XXX send custom error to users
          @update(error: error.reason, true)
        else if _.isFunction(@onSuccess)
          @onSuccess()

  onSuccess: ->
    @update(success: 'Password changed successfully')
    # Clear form inputs manually since they are preserved by default, because
    # of the preserve-inputs package
    @view.$el.find('input').val('')