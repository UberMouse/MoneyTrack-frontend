React = require('react')
R = React.DOM

module.exports = React.createClass
  render: ->
    R.div {style: {border: 'black 1px solid'}}, "Sidebar"