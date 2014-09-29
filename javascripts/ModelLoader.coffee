$ = require('jquery')
Promise = require('bluebird')

module.exports = class ModelLoader
  constructor: (initFunction) ->
    @initFunction = initFunction
  load: ->
    Promise.join @loadTransactions(@initFunction),
      (transactions)=> @initFunction({transactions})
  loadTransactions: ->
    Promise.resolve($.get('http://localhost:55934/api/transactions/all'))
  
