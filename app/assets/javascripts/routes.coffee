App.Router.reopen
  location: 'history'
  rootURL: '/'

App.Router.map ->
  @resource 'users', ->
    @route 'show',
      path: '/:user_id'

App.Router.map (match) ->
  @resource 'users', ->
    @route 'new'
    @route 'edit',
      path: '/:user_id/edit'
    @route 'show',
      path: '/:user_id'

App.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')

App.UsersRoute = Ember.Route.extend
  setupController: ->
    @controllerFor('application').set('currentRoute', 'users')

App.UsersIndexRoute = Ember.Route.extend
  model: ->
    App.User.find()
  setupController: (controller, model) ->
    @_super()
    controller.set('users', model)

App.UsersNewRoute = App.UsersRoute.extend
  model: ->
    App.User.createRecord()
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

App.UserRoute = Ember.Route.extend
  model: (params) ->
    App.User.find(params.user_id)
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

App.UsersShowRoute = AppUserRoute.extend()
App.UsersEditRoute = AppUserRoute.extend()