var Location = React.createClass({
  getInitialState() {
    return {
      "cur_item": 0,
      "items": [],
      "id": 0,
      "name": "name",
      "readytorender": 0
    };
  },

  componentWillMount() {
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
        self.setState({readytorender: 1}, () => {
          console.log('readytorender',self.state.readytorender)
        } )
      })
  },

  nextitem() {
    var self = this
   
    if(Object.keys(self.state.items).length>self.state.cur_item+1){
      self.setState({
        cur_item: self.state.cur_item += 1  
      },() => console.log('incremented state', self.state.cur_item) )
    }
    else{
      window.alert("no more items")
      self.setState({readytorender: 0}, () => {
          console.log('readytorender',self.state.readytorender)
        } )
    }
  },
  render: function() {
      if(this.state.readytorender == 1){
        console.log("currentitem",this.state.items[this.state.cur_item])  
        return (
          <div>
            <Item item={this.state.items[this.state.cur_item]} />
            <button onClick={this.nextitem}>Next</button>
          </div>
        );
      }
      else{
        return (
          <div>Empty</div>
        )
      }
    
    
  }
});

