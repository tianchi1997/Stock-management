var Item = React.createClass({
  getInitialState() {
    return {
      "item_expiries": [],
      "stock_item": [],
      "id": 0,
      "location_id": 0,
      "expires": false
    };
  },

  handleSubmit(event) {
    alert('A name was submitted: ' + this.props);
    event.preventDefault();
  },

  componentDidMount() {
    this.setState(this.props.item);
    
  },
  componentWillReceiveProps(nextProps){
    console.log("newprops",nextProps)
    this.setState(nextProps.item, ()=>console.log("newpropsitem", nextProps.item));
  },

  expiryDisplay(item_expiry) {
    return <div>{JSON.stringify(item_expiry)}</div>
  },

  render: function() {
    if(this.state.stock_item.name != []){
    console.log("items_component name",this.state.stock_item)
    return (
      <div>
        <div>{this.state.stock_item.name}</div>
        <div>{JSON.stringify(this.state.item_expiries)}</div>
        <div>{this.state.item_expiries.map(this.expiryDisplay)}</div>
      </div>
    );
    }
    else{
      return (
        <div></div>
      )
    }
  }
});

