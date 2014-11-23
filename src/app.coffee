Flux = require 'flux'
Dispatcher = new Flux.Dispatcher()
React = require 'react'
TreeNode = require './tree.coffee'
console.log Dispatcher
treeData = require './treedata.coffee'

treeDataStore =
  data: treeData
  token: null

treeDataStore.token = Dispatcher.register (payload) ->
  if payload.actionType == 'tree-node-added'
    treeDataStore.data.items.push payload.data
    tree.setState()
  true

tree = React.render React.createElement(TreeNode, treeDataStore.data),
  document.getElementById('treeContent')
    
document.getElementById('addButton').onclick = ->
  console.log 'td', treeDataStore
  newItem = name: Math.random().toString(36).substring(8), items: []

  Dispatcher.dispatch
    actionType: 'tree-node-added'
    data: newItem
