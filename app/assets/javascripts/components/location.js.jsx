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

  componentWillMount() {
    this.loadLocation(this.props.locationID);
  },

  componentWillReceiveProps(newProps) {
    this.loadLocation(newProps.locationID);
  },

  prevItem() {
    if (this.state.curItem > 0) {
      this.setState({curItem: this.state.curItem - 1});
    }
  },

  nextItem() {
    if (this.state.curItem < this.state.items.length - 1) {
      this.setState({curItem: this.state.curItem + 1});
    }
  },

  render: function() {
    if(this.state.curItem != -1){
      return (
        <div>
          <div>{this.state.name}</div>
          <Item
            itemID={this.state.items[this.state.curItem].id}
            prevItem={this.prevItem}
            nextItem={this.nextItem}
          />
        </div>
      );
    } else{
      return (
        <div>{this.state.name}</div>
      )
    }
  }
});

