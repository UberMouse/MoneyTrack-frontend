React = require('react')
require('main.scss')
require('material.css')
require('ripples.css')
require('ripples.js')
require('material.js')
R = React.DOM

module.exports = React.createClass
  render: ->
    R.div {className: 'container'},
      @props.view
