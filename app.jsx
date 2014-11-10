// tutorial14.js
var CommentList = React.createClass({
  render: function() {
    return (
      <div className="commentList">
        Hello, world! I am a CommentList.
        {this.props.data}
      </div>
    );
  }
});

var Rea = React.createClass({
  refresh: function() {
    setTimeout(function(){
      console.log('fc')
      this.setState({data: ['3s', '-'+Math.round(Math.random()*10000)+'-a']});
    }.bind(this), 200);

  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.refresh();
    setInterval(this.refresh, 100);
  },
  render: function() {
    return (
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={this.state.data} />

      </div>
    );
  }
});

React.render(
  <Rea pollInterval={2000} />,
  document.getElementById('content')
);