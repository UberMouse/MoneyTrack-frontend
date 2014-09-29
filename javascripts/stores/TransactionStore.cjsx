Fluxxor = require('fluxxor')
Constants = require('Constants')

module.exports = Fluxxor.createStore
  initialize: (options)->
    @transactions = options.transactions || []
    @bindActions(Constants.INIT_MODELS, @initModels)
  getState: ->
    transactions: @transactions
  initModels: (args)->
    @transactions = args.transactions
    @emit("change")

