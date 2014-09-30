React = require('react')
Fluxxor = require('fluxxor')
actions = require('Actions')
router = require('rrouter')
ModelLoader = require('ModelLoader')
TransactionStore = require('stores/TransactionStore')
GroupStore = require('stores/GroupStore')
Routes = router.Routes
Route = router.Route

window.React = React


stores =
  TransactionStore: new TransactionStore()
  GroupStore: new GroupStore()
flux = new Fluxxor.Flux(stores, actions)

loader = new ModelLoader(flux.actions.initModels)
loader.load()

Index = require('pages/index')
Groups = require('pages/Groups')

routes = (
  new Routes null,
    new Route({path: '/', view: Index, flux, name: 'index'})
    new Route({path: '/groups', view: Groups, flux, name: 'groups'})
)

Layout = require('components/layout')

router.start routes, (view)->
  React.renderComponent(new Layout({view}), document.body)
