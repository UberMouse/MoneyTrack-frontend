React = require('react/addons')
R = React.DOM

module.exports = React.createClass
  mixins: [React.addons.LinkedStateMixin]
  getInitialState: ->
    {name: '', color: ''}
  handleSubmit: (e)->
    e.preventDefault()
    console.log(@state)
    @props.submitCb(@state.name, @state.color)
  handleCancel: (e)->
    e.preventDefault()

    @setState(@getInitialState())
    @props.cancelCb()
  render: ->
    R.form className: 'form-horizontal',
      R.fieldset null,
        R.div className: 'form-group',
          R.label htmlFor: 'groupName', className: 'col-lg-2 control-label',
            "Name"
          R.div className: 'col-lg-10',
            R.input type: 'text', className: 'form-control', id: 'groupName', valueLink: @linkState('name')
        R.div className: 'form-group',
          R.label htmlFor: 'groupColor', className: 'col-lg-2 control-label',
            "Color"
          R.div className: 'col-lg-10',
            R.input type: 'text', className: 'form-control', id: 'groupColor', valueLink: @linkState('color')
        R.div className: 'form-group',
          R.div className: 'col-lg-10 col-lg-offset-2',
            R.button className: 'btn btn-default', onClick: @handleCancel,
              "Cancel"
            R.button type: 'Submit', className: 'btn btn-primary', onClick: @handleSubmit,
              "Submit"