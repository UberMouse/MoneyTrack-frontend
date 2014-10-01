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
    
    $.post('api/groups', group).done (data)=>
      console.log(data)
      @groups.push data
      @emit("change") 
  initModels: (args)->
    @groups = args.groups
    @emit("change")

