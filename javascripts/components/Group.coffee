React = require('react')
R = React.DOM

module.exports = React.createClass
  render: ->
    R.p {style: {color: @props.group.Color}}, @props.group.Name