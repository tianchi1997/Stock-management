var StockTake = React.createClass({
  propTypes: {
    location_id: React.PropTypes.number
  },
  getInitialState() {
    return { 
      items: [],
      item: [],
      index: 0
    };  
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
          items: json.items
          },() => {
            //set a callback to log the change
            console.log('updated state items', self.state.items)
          })
        self.setState({
          item: self.state.items[self.state.index].stock_item
        },() => {
          console.log('updated state item', self.state.item.stock_item)
        })
      })
  },
  nextitem() {
    var self = this
   
    if(Object.keys(self.state.items).length>self.state.index+1){
      window.alert(Object.keys(self.state.items).length)
      self.setState({
        index: self.state.index += 1  
      },() => console.log('incremented state', self.state.index) )
    }
    else{
      window.alert("no more items")
      //window.location.href = ""
    }
  },
 
  render: function() {
    const headerstyle = {
      fontSize: '20px'
    }
    
    return (
      <div>
        <div style={headerstyle}>Location: {this.props.location_id}</div>
        <div>Item name: {JSON.stringify(this.state.item.name)} </div>
        <button onClick={this.nextitem}>Next</button>
      </div>
    );
  }
});


