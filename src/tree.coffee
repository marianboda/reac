R = React.DOM

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

treeData =
  name: '/', items: [
    {name: 'Applications', items: [
      {name: 'App Store', items: []}
      {name: 'Atom', items: []}
      {name: 'Calculator', items: []}
      {name: 'EasyFind', items: []}
      {name: 'GitHub', items: []}
      {name: 'Google Chrome', items: []}
      {name: 'Path Finder', items: []}
      {name: 'Pocket', items: []}
      {name: 'Sublime Text', items: []}
      {name: 'Swinsian', items: []}
      ]}
    {name: 'Extra', items: [
      {name: 'modules', items: []}
      {name: 'Themes', items: [
        {name: 'Default', items: []}
        ]}
      ]}
    {name: 'Library', items: [
      {name: 'Application Support', items: []}
      {name: 'Caches', items: []}
      {name: 'Extensions', items: []}
      {name: 'Filesystems', items: []}
      {name: 'Fonts', items: []}
      {name: 'Keyboard Layouts', items: []}
      {name: 'Logs', items: []}
      {name: 'Messages', items: []}
      {name: 'Python', items: []}
      {name: 'QuickLook', items: []}
      {name: 'Scripts', items: []}
      {name: 'Updates', items: []}
      {name: 'Video', items: []}
      ]}
    {name: 'opt', items: []}
    {name: 'System', items: [
      {name: 'Library', items: [
        {name: 'Application Support', items: []}
        {name: 'Caches', items: []}
        {name: 'Extensions', items: []}
        {name: 'Filesystems', items: []}
        {name: 'Fonts', items: []}
        {name: 'Keyboard Layouts', items: []}
        {name: 'Logs', items: []}
        {name: 'Messages', items: []}
        {name: 'Python', items: []}
        {name: 'QuickLook', items: []}
        {name: 'Scripts', items: []}
        {name: 'Updates', items: []}
        {name: 'Video', items: []}
        ]}
      {name: '1.1.3.2 pod pod', items: []}
      ]}
    {name: 'Users', items: [
      {name: 'arnoldrimmer', items: []}
      {name: 'davidlister', items: []}
      {name: 'kryten', items: []}
      ]}
    ]

React.render React.createElement(TreeNode, treeData),
  document.getElementById('treeContent')
