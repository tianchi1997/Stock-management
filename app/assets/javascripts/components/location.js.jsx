var Location = React.createClass({
  getInitialState() {
    return {
      "cur_item": 0,
      "items": [],
      "id": 0,
      "name": "name"
    };
  },

  componentDidMount() {
    //setting the context of 'this'
    var self = this;
    var fetchURL = "/locations/" + this.props.location_id + ".json";
    //fetch the items associated with the location
    fetch(fetchURL, { credentials: 'include' })
      //parse the response to json
      .then(function(response) { return response.json(); })
      .then(function(json) {
        self.setState(json, () => {
          //set a callback to log the change
          console.log('updated state value', self.state.items);
        })
      })
  },


  render: function() {
    var has_items = this.state.items.length != 0;
    if (has_items) {
      return <Item item={this.state.items[this.state.cur_item]} />;
    } else {
      return <div>No Items</div>;
    }
  }
});

