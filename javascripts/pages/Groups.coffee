React = require('react')
Fluxxor = require('fluxxor')
_ = require('lodash')
ViewGroups = require('pages/components/ViewGroups')
CreateGroup = require('pages/components/CreateGroup')
FluxMixin = Fluxxor.FluxMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin
R = React.DOM

module.exports = React.createClass
  mixins: [FluxMixin, StoreWatchMixin("GroupStore")]
  getInitialState: ->
    creatingGroup: false
  getStateFromFlux: ->
    groups: @getFlux().store("GroupStore").getState().groups
  handleEditClick: -> @flipEditState()
  createGroup: (name, color)->
    @getFlux().actions.createGroup(name, color)
    @flipEditState()
  flipEditState: -> @setState(creatingGroup: !@state.creatingGroup)
  render: ->
    R.div null,
      if @state.creatingGroup
        new CreateGroup(groups: @state.groups, submitCb: @createGroup, cancelCb: @flipEditState)
      else
        R.div null,
          R.button className: 'btn btn-primary', onClick: @handleEditClick,
            "Create"
          new ViewGroups(groups: @state.groups)