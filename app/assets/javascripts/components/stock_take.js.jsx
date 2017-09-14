var StockTake = React.createClass({
  propTypes: {
    location_id: React.PropTypes.number
  },

  render: function() {
    return (
      <div>
        <div>Location: {this.props.location_id}</div>
      </div>
    );
  }
});

