React = require('react')
Fluxxor = require('fluxxor')
actions = require('Actions')
router = require('rrouter')
ModelLoader = require('ModelLoader')
TransactionStore = require('stores/TransactionStore')
Routes = router.Routes
Route = router.Route

window.React = React


stores =
  TransactionStore: new TransactionStore()
flux = new Fluxxor.Flux(stores, actions)

loader = new ModelLoader(flux.actions.initModels)
loader.load()

Index = require('pages/index')

routes = (
  new Routes null,
    new Route({path: '/', view: Index, flux, name: 'index'})
)

Layout = require('components/layout')

router.start routes, (view)->
  React.renderComponent(new Layout({view}), document.body)
