var Location = React.createClass({ 
  getInitialState() {
    return {
      name: "",
      curItem: -1,
      items: [],
      id: this.props.locationID,
    };
  },

  loadLocation(locationID) {
    //setting the context of 'this'
    var self = this;
    var fetchURL = "/locations/" + locationID + ".json";

    //fetch the items associated with the location
    fetch(fetchURL, { credentials: 'include' })
      //parse the response to json
      .then(function(response) { return response.json(); })
      .then(function(json) {
        json.curItem = 0;
        self.setState(json);
      })
  },

  updateItemExpiryState(itemIndex, newExpiries) {
    newState = this.state;
    newState.items[itemIndex].expiries = newExpiries;

    this.state = newState;
  },

  componentWillMount() {
    this.loadLocation(this.props.locationID);
  },

  componentWillReceiveProps(newProps) {
    this.loadLocation(newProps.locationID);
  },

  prevItem() {
    if (this.state.curItem == -1) {
      alert("Loading...");
    } else if (this.state.curItem == 0) {
      alert("Error: No Previous Items");
    } else {
      this.setState((prevState, props) => ({
        curItem: prevState.curItem - 1
      }));
    }
  },

  nextItem() {
    if (this.state.curItem == -1) {
      alert("Loading...");
    } else if (this.state.curItem == this.state.items.length - 1) {
      alert("Error: No More Items");
    } else {
      this.setState((prevState, props) => ({
        curItem: prevState.curItem + 1
      }));
    }
  },

  render: function() {
    if(this.state.curItem != -1){
      return (
        <div>
          <Item item={this.state.items[this.state.curItem]}
                callback={this.updateItemExpiryState}
                itemIndex={this.state.curItem}
          />
          <button onClick={this.prevItem} className="btn">Previous</button>
          <button onClick={this.nextItem} className="btn">Next</button>
        </div>
      );
    } else{
      return (
        <div>Empty</div>
      )
    }
  }
});

