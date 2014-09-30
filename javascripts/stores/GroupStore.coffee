Fluxxor = require('fluxxor')
Constants = require('Constants')
$ = require('jquery')

module.exports = Fluxxor.createStore
  initialize: ->
    @groups = []
    @bindActions Constants.INIT_MODELS, @initModels,
                 Constants.CREATE_GROUP, @createGroup
  getState: ->
    groups: @groups
  createGroup: (args)->
    group = {Name: args.name, Color: args.color}
    @groups.push group
    $.post('api/groups', group)
    @emit("change")
  initModels: (args)->
    @groups = args.groups
    @emit("change")

