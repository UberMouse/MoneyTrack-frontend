React = require('react')
R = React.DOM

module.exports = React.createClass
  render: ->
    R.div className: 'col-md-4',
      R.div className: "panel panel-default",
          R.div className: "panel-heading",
            @props.group.Name
          R.div className: 'panel-body', style: {height: '32px', backgroundColor: '#' + @props.group.Color}