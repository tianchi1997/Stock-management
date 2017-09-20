var StockTake = React.createClass({
  getInitialState() {
    return {
      "cur_location": 0,
      "location_ids": this.props.location_ids
    };
  },

  render: function() {
    return (
      <div>
        <Location location_id={this.state.location_ids[this.state.cur_location]}/>
      </div>
    );
  }
});


