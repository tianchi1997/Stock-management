class Location extends React.Component {
  constructor(props) {
    super(props);
    console.log(this.props);
    this.state = {
      name: "",
      description: "",
      curItem: -1,
      items: [],
      id: props.locationID,
      path: null 
    };
  }

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
  }

  componentWillMount() {
    //if the component will mount, fetch the information for the current locationID. 
    this.loadLocation(this.props.locationID);
  }

  componentDidUpdate(prevProps, prevState) {
    if (this.state.curItem != -1 && this.state.items.length == 0) {
      this.props.nextLocation();
    }
  }

  componentWillReceiveProps(newProps) {
    this.setState({curItem: -1});
    this.loadLocation(newProps.locationID);
  }

  prevItem() {
    if (this.state.curItem > 0) {
      this.setState({curItem: this.state.curItem - 1});
    }
  }

  nextItem() {
    if (this.state.curItem < this.state.items.length - 1) {
      this.setState({curItem: this.state.curItem + 1});
    } else {
      this.props.nextLocation();
    }
  }
  setActiveID(id){
    console.log("location: activeID",id);
    this.props.setActiveID(id);
  }
  render() {
    // only render the item after the item has been loaded into the state. 
    if(this.state.curItem != -1 && this.state.items.length > 0){
      return (
        <div>
          <div>
              <h2>Location: {this.state.name}</h2>
              <p> {this.state.description}</p>
              <p> {this.state.path}</p>
          </div>
          <Item
            itemID={this.state.items[this.state.curItem].id}
            prevItem={this.prevItem.bind(this)}
            nextItem={this.nextItem.bind(this)}
            setActiveID={this.setActiveID.bind(this)}
          />
        </div>
      );
    } else {
      return (
        <div>{this.state.name}</div>
      )
    }
  }
}

