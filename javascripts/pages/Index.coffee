React = require('react')
Fluxxor = require('fluxxor')
Transaction = require('components/Transaction')
_ = require('lodash')
FluxMixin = Fluxxor.FluxMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin
R = React.DOM

module.exports = React.createClass
  mixins: [FluxMixin, StoreWatchMixin("TransactionStore", "GroupStore")]
  getStateFromFlux: ->
    transactions: @getFlux().store("TransactionStore").getState().transactions,
    groups: @getFlux().store("GroupStore").getState().groups
  render: ->
    transactions = _.map(@state.transactions, (transaction)=>
      new Transaction({transaction, key: transaction.Id, groups: @state.groups}))
    R.div null,
      transactions