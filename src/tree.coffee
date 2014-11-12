R = React.DOM
div = R.div
h1 = R.h1

Tree = React.createClass
  render: ->
    nodes = @props.items.map (item) ->
      TreeNode item
    div {key: @props.id},
      div {}, "\u25ba "+@props.name
      nodes

TreeNode = React.createClass
  # collapsed: true
  getInitialState: ->
    collapsed: true
  clickHandler: (e) ->
    @setState collapsed: !@state.collapsed
    console.log 'clicked', @state.collapsed
  render: ->
    collapsed = @props.collapsed ? @state.collapsed
    triangle = if collapsed then '\u25b6' else '\u25bc'
    triangle = '\u25B7' if @props.items.length is 0
    nodes = @props.items.map (item) ->
      TreeNode item
    subitemAttributes =
      style:
        display: if collapsed then 'none' else 'block'
    div {key: @props.id, className:'treeSubitems'},
      div {onClick: @clickHandler}, triangle+" "+@props.name
      div subitemAttributes, nodes

treeData =
  name: 'toto je meno'
  id: 1
  items: [
    {id: 2, name: '1.1 poditem', items: [
      {id: 4, name: '1.1.1 pod pod', items: []}
      {id: 5, name: '1.1.2 pod pod', items: []}
      ]}
    {id: 3, name: '1.2 poditem', items: []}
  ]

React.render React.createElement(TreeNode, treeData),
  document.getElementById('treeContent')
