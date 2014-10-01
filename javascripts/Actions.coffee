Constants = require('Constants')

module.exports =
  initModels: (models)->
    @dispatch(Constants.INIT_MODELS, models)
  createGroup: (name, color)->
    @dispatch(Constants.CREATE_GROUP, {name, color})
  changeColor: (id, groupId)->
    @dispatch(Constants.CHANGE_COLOR, {id, groupId})
  deleteGroup: (id)->
    @dispatch(Constants.DELETE_GROUP, {id})