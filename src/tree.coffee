R = React.DOM
div = R.div
h1 = R.h1

Tree = React.createClass
  render: ->
    nodes = @props.items.map (item) ->
      TreeNode item
    div {key: @props.id},
      div {}, @props.name
      nodes

TreeNode = React.createClass
  render: ->
    nodes = @props.items.map (item) ->
      TreeNode item
    div {key: @props.id},
      div {}, @props.name
      nodes


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

React.render React.createElement(Tree, treeData),
  document.getElementById('treeContent')
