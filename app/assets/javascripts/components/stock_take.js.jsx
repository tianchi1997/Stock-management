var StockTake = React.createClass({
  propTypes: {
    location_id: React.PropTypes.number
  },
  getInitialState() {
    return { items: [{
      "id":0,
      "location_id": null,
      "name": "name",
      "description": "description",
      "created_at": null,
      "updated_at": null,
      "url": null
    }]};
  },
  componentDidMount(){
    //setting the context of 'this'
    var self = this;
    var fetchURL = "/locations/" + this.props.location_id + ".json";
    //fetch the items associated with the location
    fetch(fetchURL, { credentials: 'include' })
      //parse the response to json
      .then(function(response) { return response.json(); })
      .then(function(json) {
        self.setState({
          items: json
          },() => {
            //set a callback to log the change
            console.log('updated state value', self.state.items)
          })
      })
  },
 
  render: function() {
    const headerstyle = {
      fontSize: '20px'
    }
    return (
      <div>
        <div style={headerstyle}>Location: {this.props.location_id}</div>
        <div>Item name: {JSON.stringify(this.state.items.items)} Item description:{JSON.stringify(this.state.items.description)}</div>
      </div>
    );
  }
});


