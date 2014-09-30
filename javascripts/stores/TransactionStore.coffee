Fluxxor = require('fluxxor')
Constants = require('Constants')

module.exports = Fluxxor.createStore
  initialize: ->
    @transactions = []
    @bindActions(Constants.INIT_MODELS, @initModels)
  getState: ->
    transactions: @transactions
  changeColor: (args)->
    $.post('api/transactions/changeColor', args).done (data)=>
      @transactions = _.map @transactions, (transaction)->
        if transaction.Id == args.id
          data
        else
          group
      @emit("change")
  initModels: (args)->
    @transactions = args.transactions
    @emit("change")

