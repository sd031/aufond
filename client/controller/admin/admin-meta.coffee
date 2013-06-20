Template.adminMeta.profileForm = ->
  module: ProfileForm
  model: 'User'
  modelId: Meteor.userId()

Template.adminMeta.emailForm = ->
  module: EmailForm
  model: 'User'
  modelId: Meteor.userId()

Template.adminMeta.passwordForm = ->
  module: PasswordForm

Template.adminMeta.deleteUserForm = ->
  module: DeleteUserForm
  model: 'User'
  modelId: Meteor.userId()
