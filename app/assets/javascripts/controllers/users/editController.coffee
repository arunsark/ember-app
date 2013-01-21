App.UsersEditController = Ember.ObjectController.extend
  save: ->
    @store.commit()
    @transitionToRoute 'users.show', @content

  cancel: ->
    if @content.isDirty
      @content.rollback()
    @transitionToRoute 'users.show', @content

  headerTitle: 'Edit'
  buttonTitle: 'Update'

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute 'users.index'