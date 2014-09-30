$ = require('jquery')
Promise = require('bluebird')

module.exports = class ModelLoader
  constructor: (initFunction) ->
    @initFunction = initFunction
  load: ->
    Promise.join @loadTransactions(), @loadGroups(),
      (transactions, groups)=> @initFunction({transactions, groups: groups})
  loadTransactions: ->
    Promise.resolve($.get('/api/transactions'))
  loadGroups: ->
    Promise.resolve($.get('/api/groups'))
  
