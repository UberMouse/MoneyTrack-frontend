React = require('react')
Group = require('components/Group')
R = React.DOM

module.exports = React.createClass
  render: ->
    groups = _.map(@props.groups, (group)->
      new Group({group, key: group.Name}))
    R.div null, groups