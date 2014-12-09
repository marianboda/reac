Flux = require 'flux'
Dispatcher = new Flux.Dispatcher()
React = require 'react'
TreeNode = require './tree.coffee'
treeDataRaw = require './treedata.coffee'
Router = require 'react-router'
Route = Router.Route
I = require 'immutable'

treeData = I.Map treeDataRaw

SubPage = React.createClass
  displayName: 'SubPage'
  render: ->
    console.log 'subpage props', @props
    React.DOM.div {},
      React.DOM.h3 {}, 'SUBPAGE: ' + @props.params.id
      React.createElement TreeNode,
        collapsed: false
        items: treeDataStore.data.get('items')
        name: treeDataStore.data.get('name')

DefPage = React.createClass
  displayName: 'DefPage'
  render: ->
    React.DOM.h3 {}, 'DEFAULT'


treeDataStore =
  data: treeData
  token: null

treeDataStore.token = Dispatcher.register (payload) ->
  if payload.actionType == 'tree-node-added'
    treeDataStore.data.items[1].items.push payload.data
    tree.setState()
  true

# tree = React.render React.createElement(TreeNode, treeDataStore.data),
#   document.getElementById('treeContent')

App = React.createClass
  displayName: 'App'
  render: ->
    React.DOM.div {},
      React.DOM.h1 {}, 'React Head1'
      React.DOM.a {href: '#/'}, 'Ins'
      React.DOM.span {}, ' '
      React.DOM.a {href: '#/sub/33'}, 'Inside2'
      React.createElement Router.RouteHandler, React.__spread({},  this.props)

# React.render React.createElement(App), document.getElementById('content')

document.getElementById('addButton').onclick = ->
  console.log 'td', treeDataStore
  newItem = name: Math.random().toString(36).substring(8), items: []

  Dispatcher.dispatch
    actionType: 'tree-node-added'
    data: newItem

routes =
  React.createElement Route, {name: 'app', path: '/', handler: App},
    React.createElement Route, {name: 'inside', path: 'inside', handler: SubPage}
    React.createElement Route, {name: 'sub', path: 'sub', handler: SubPage},
      React.createElement Route, {name: 'detail', path: ':id', handler: SubPage}
    React.createElement Router.DefaultRoute, {handler:DefPage}

Router.run routes, (Handler, state) ->
  console.log 'state', state
  React.render React.createElement(Handler, {params: state.params}), document.getElementById('content')
