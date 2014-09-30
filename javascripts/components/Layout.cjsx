React = require('react')
Sidebar = require('components/Sidebar')
require('main.scss')
require('material.css')
require('ripples.css')
require('ripples.js')
require('material.js')
R = React.DOM

module.exports = React.createClass
  render: ->
    R.div {className: 'container'},
      R.div {className: 'col-md-9'},
        @props.view
      R.div {className: 'col-md-3'},
        new Sidebar()
