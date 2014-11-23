React = require 'react'
R = React.DOM

console.log 'react happens :)'

TreeNode = React.createClass
  getInitialState: ->
    collapsed: true
  clickHandler: (e) ->
    @setState collapsed: !@state.collapsed
    console.log 'clicked', @state.collapsed

  render: ->
    collapsed = @props.collapsed ? @state.collapsed
    triangle = if collapsed then '\u25b6' else '\u25bc'
    triangle = '' if @props.items.length is 0
    nodes = if collapsed then null else @props.items.map (item) ->
      React.createElement TreeNode, item

    R.div {key: @props.key, className:'treeNode'},
      R.div {onClick: @clickHandler, className: 'nodeName'},
        R.span {className: 'dirTriangle'}, triangle
        R.span {}, @props.name
        R.span {className: 'sizeLabel'}, '1'

      R.div {className: 'treeSubNodes'}, nodes unless collapsed




module.exports = TreeNode
