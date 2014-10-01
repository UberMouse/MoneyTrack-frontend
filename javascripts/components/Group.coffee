React = require('react')
FluxChildMixin = require('fluxxor').FluxChildMixin(React)
R = React.DOM

module.exports = React.createClass
  mixins: [FluxChildMixin]
  handleDelete: (e)->
    e.preventDefault()

    @getFlux().actions.deleteGroup(@props.group.Id)
  render: ->
    R.div className: 'col-md-4',
      R.div className: "panel panel-default",
          R.div className: "panel-heading", style:{height: '32px'},
            @props.group.Name
          R.div className: 'panel-body', style: {backgroundColor: '#' + @props.group.Color},
            R.button className: 'btn btn-primary btn-xs', style: {margin: '0 auto'}, onClick: @handleDelete,
              "Delete"