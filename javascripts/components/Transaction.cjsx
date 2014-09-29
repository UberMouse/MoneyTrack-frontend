React = require('react/addons')
cx = React.addons.classSet
R = React.DOM

module.exports = React.createClass
  render: ->
    classes = cx(
      'text-success': @props.transaction.Amount.indexOf("-") == -1,
      'text-danger':  @props.transaction.Amount.indexOf("-") != -1,
    )
    date = @props.transaction.Date.split("T")[0]

    R.div {className: "col-md-6"},
      R.div {className: "panel panel-default"},
        R.div {className: "panel-heading"},
          @props.transaction.Description || "N/A",
          R.span {"style": {'float': 'right'}}, date
        R.div {className: "panel-body"},
          R.span {className: classes}, @props.transaction.Amount