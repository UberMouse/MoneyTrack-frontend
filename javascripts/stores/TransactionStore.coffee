Fluxxor = require('fluxxor')
Constants = require('Constants')
_ = require('lodash')

module.exports = Fluxxor.createStore
  initialize: ->
    @transactions = []
    @bindActions Constants.INIT_MODELS, @initModels,
                 Constants.CHANGE_COLOR, @changeColor
  getState: ->
    transactions: @transactions
  changeColor: (args)->
    $.post('api/transactions/changeColor', args).done (data)=>
      transaction = _.find @transactions, (t)->
        t.Id == data.Id
      transaction.GroupId = data.GroupId
      transaction.Group = data.Group
      @emit('change')
  initModels: (args)->
    @transactions = args.transactions
    @emit("change")

