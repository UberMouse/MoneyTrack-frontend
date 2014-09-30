Fluxxor = require('fluxxor')
Constants = require('Constants')

module.exports = Fluxxor.createStore
  initialize: ->
    @transactions = []
    @bindActions Constants.INIT_MODELS, @initModels,
                 Constants.CHANGE_COLOR, @changeColor
  getState: ->
    transactions: @transactions
  changeColor: (args)->
    $.post('api/transactions/changeColor', args).done (data)->
      console.log(data)
  initModels: (args)->
    @transactions = args.transactions
    @emit("change")

