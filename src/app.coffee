Flux = require 'flux'
Dispatcher = Flux.Dispatcher
React = require 'react'
TreeNode = require './tree.coffee'

treeDataStore = require './treedata.coffee'

React.render React.createElement(TreeNode, treeDataStore),
  document.getElementById('treeContent')
