React = require('react/addons')
Fluxxor = require('fluxxor')
FluxChildMixin = Fluxxor.FluxChildMixin(React)
_ = require('lodash')
cx = React.addons.classSet
R = React.DOM

Front = React.createClass
  render: ->
    R.span {className: @props.classes}, @props.amount

Back = React.createClass
  mixins: [React.addons.LinkedStateMixin, FluxChildMixin, Fluxxor.StoreWatchMixin("GroupStore")]
  getInitialState: ->
    groupId: ''
  getStateFromFlux: ->
    groups: @getFlux().store("GroupStore").getState().groups
  handleSubmit: (e)->
    e.preventDefault()

    @props.submitCb(@state.groupId)
  handleCancel: (e)->
    e.preventDefault()

    @props.cancelCb()
  render: ->
    groups = _.map @state.groups, (group)->
      R.option value: group.Id,
        group.Name
    R.form className: 'form-horizontal',
      R.fieldset null,
        R.div className: 'form-group',
          R.label className: 'control-label', htmlFor: 'colorPicker',
            "Color"
          R.select className: 'form-control', id: 'colorPicker', valueLink: @linkState('groupId'),
            groups
        R.div className: 'form-group',
          R.div className: 'col-lg-10 col-lg-offset-2',
            R.button className: 'btn btn-default', onClick: @handleCancel,
              "Cancel"
            R.button type: 'Submit', className: 'btn btn-primary', onClick: @handleSubmit,
              "Change"

module.exports = React.createClass
  mixins: [FluxChildMixin]
  getInitialState: ->
    assigningGroup: false
  handleColorChange: (groupId)->
    @getFlux().actions.changeColor(@props.transaction.Id, groupId)
    @flip()
  handleCancel: ->
    @flip()
  handleTagClick: (e)->
    e.preventDefault()

    @flip()
  flip: ->
    @setState(assigningGroup: !@state.assigningGroup)
  render: ->
    date = @props.transaction.Date.split("T")[0]

    R.div {className: "col-md-6"},
      R.div {className: "panel panel-default"},
        R.div {className: "panel-heading"},
          @props.transaction.Description || "N/A",
          R.span {"style": {'float': 'right'}}, date
        R.div {className: "panel-body"},
          if @state.assigningGroup
            new Back({submitCb: @handleColorChange, cancelCb: @handleCancel})
          else
            classes = cx(
              'text-success': @props.transaction.Amount.indexOf("-") == -1,
              'text-danger':  @props.transaction.Amount.indexOf("-") != -1,
            )
            R.div null,
              R.span style: {float: 'left'},
                new Front({classes, amount: @props.transaction.Amount})
              R.button style: {float: 'right'}, className: 'btn btn-primary btn-xs', onClick: @handleTagClick,
                "Tag"

  