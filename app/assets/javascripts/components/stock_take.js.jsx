class StockTake extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      curLocation: 0,
      locationIDs: props.locationIDs,
      activeID: null,
      prevItemTrigger: 0,
      nextItemTrigger: 0
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
  pItem(){
    console.log("prev Item pressed"); 
    this.setState({prevItemTrigger: this.state.prevItemTrigger + 1});
  }
  nItem(){
    console.log("next Item pressed");
    this.setState({nextItemTrigger: this.state.nextItemTrigger + 1});
  }
  render() {
    return (
      <div className="container-fluid">
        <div className="row no-gutters">
          <div className="col-xs-6 no-margin">
            <Location 
            locationID={this.state.locationIDs[this.state.curLocation]} 
            nextLocation={this.nextLocation.bind(this)} 
            prevItemTrigger={this.state.prevItemTrigger}
            nextItemTrigger={this.state.nextItemTrigger}
            />
          </div>
          <div className="col-xs-6 no-margin">
            <Numpad prevItem={this.pItem.bind(this)} nextItem={this.nItem.bind(this)}/>
          </div>
        </div>
      </div>
    );
  }
}


