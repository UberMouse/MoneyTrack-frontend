Constants = require('Constants')

module.exports =
  initModels: (models)->
    @dispatch(Constants.INIT_MODELS, models)