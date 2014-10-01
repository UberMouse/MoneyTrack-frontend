Fluxxor = require('fluxxor')
Constants = require('Constants')
_ = require('lodash')
$ = require('jquery')

module.exports = Fluxxor.createStore
  initialize: ->
    @groups = []
    @bindActions Constants.INIT_MODELS, @initModels,
                 Constants.CREATE_GROUP, @createGroup
                 Constants.DELETE_GROUP, @deleteGroup
  getState: ->
    groups: @groups
  createGroup: (args)->
    group = {Name: args.name, Color: args.color}
    
    $.post('api/groups', group).done (data)=>
      console.log(data)
      @groups.push data
      @emit("change")
  deleteGroup: (args)->
    $.ajax('api/groups/'+args.id, {
      method: 'DELETE'
    }).done (data)=>
      @groups = _.filter @groups, (group)->
        group.Id != args.Id
      @emit("change")
  initModels: (args)->
    @groups = args.groups
    @emit("change")

