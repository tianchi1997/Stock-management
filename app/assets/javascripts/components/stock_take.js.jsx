var StockTake = React.createClass({
  getInitialState() {
    return {
      curLocation: 0,
      locationIDs: this.props.locationIDs
    };
  },

  nextLocation() {
    if (this.state.curLocation != this.state.locationIDs.length - 1) {
      this.setState((prevState, props) => ({
        curLocation: prevState.curLocation + 1
      }));
    } else {
      alert("No more locations");
    }
  },

  render: function() {
    return (
      <div>
        <Location locationID={this.state.locationIDs[this.state.curLocation]}/>
        <button onClick={this.nextLocation} className="btn">Next Location</button>
      </div>
    );
  }
});


