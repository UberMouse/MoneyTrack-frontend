React = require('react')
Link = require('rrouter').Link
R = React.DOM

module.exports = React.createClass
  render: ->
    R.div className: 'navbar navbar-inverse',
      R.div className: 'navbar-header',
        new Link to:"/index", className: 'navbar-brand',
          "MoneyTrack"
      R.div className: 'navbar-collapse collapse navbar-inverse-collapse',
        R.ul className: 'nav navbar-nav',
          R.li null, new Link to: '/groups',
            "Groups"