class StockTake extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      curLocation: 0,
      locationIDs: props.locationIDs,
      activeID: null
    };
  }

  nextLocation() {
    if (this.state.curLocation != this.state.locationIDs.length - 1) {
      this.setState((prevState, props) => ({
        curLocation: prevState.curLocation + 1
      }));
    } else {
      alert("Stocktake completed");
      this.props.locationIDs[0]
      window.location.assign(window.location.href.replace("/stock_take", ""))
    }
  }

  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-xs-6">
            <Location locationID={this.state.locationIDs[this.state.curLocation]} nextLocation={this.nextLocation.bind(this)} />
          </div>
          <div className="col-xs-6">
            <Numpad />
          </div>
        </div>
      </div>
    );
  }
}


