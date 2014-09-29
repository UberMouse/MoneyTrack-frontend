React = require('react')
Fluxxor = require('fluxxor')
Transaction = require('components/Transaction')
_ = require('lodash')
FluxMixin = Fluxxor.FluxMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin
R = React.DOM

module.exports = React.createClass
  mixins: [FluxMixin, StoreWatchMixin("TransactionStore")]
  getStateFromFlux: ->
    transactions: @getFlux().store("TransactionStore").getState().transactions
  render: ->
    transactions = _.map(@state.transactions, (transaction)->
      new Transaction({transaction, key: transaction.Id}))
    R.div {className: 'col-md-12'},
      transactions