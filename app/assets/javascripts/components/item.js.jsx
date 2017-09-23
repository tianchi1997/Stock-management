
var Item = React.createClass({
  getInitialState() {
    return {
      "item_expiries": [],
      "stock_item": [],
      "id": 0,
      "location_id": 0,
      "order_to": 0,
      "required": 0,
      "expires": false,
      "readytorender": 0, //set to 1 when the item is loaded in
      "formvalue": 0, //a variable storing which form value to show under quantity
      "expiryquantity": 0, //the quantity of the expired item.
    };
  },

  handleSubmit(event) {
    alert('Form Submitted');
    event.preventDefault();
    console.log("submit",event.target.name)
  },

  getFormValue(){
    //default to getting no. required
    this.setState({formvalue: this.state.required},() => console.log("formvalue", this.state.formvalue))
  },

  componentDidMount() {
    this.setState(this.props.item,() => this.getFormValue());
    this.setState({readytorender: 1})
  },

  componentWillReceiveProps(nextProps) {
    console.log("newprops", nextProps)
    this.setState(nextProps.item, () => console.log("newpropsitem", nextProps.item));
    this.getFormValue()
  },

  expiryDisplay(item_expiry) {
    return ( 
      <div> 
        <div> Count: {JSON.stringify(item_expiry.count)} </div>
        <div>Expiry: {JSON.stringify(item_expiry.expiry_date)} </div>
      </div> );
  },

  handleQuantity(event){
    this.setState({formvalue: event.target.value});
  },

  handleExpiry(event){
    //0 and 1 simply state whether a number or an expiry was changed 
    const type = event.target.name ==="number" ? 0 : 1;
    if(type == 0){
      this.state.expiryquantity = event.target.value
    }
    else {
      //TODO: if expiry was entered
    }
    
  },
 
  render: function () {
    if (this.state.readytorender == 1 && this.state.formvalue !=0 ) {
      return (
        <div>
          <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Description</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>{this.state.stock_item.name}</td>
                <td>{this.state.stock_item.description}</td>
              </tr>
            </tbody>
          </table>
          <form name="quantity" onSubmit={this.handleSubmit}>
            <h3>Quantity</h3> 
            <input type="number" value={this.state.formvalue} onChange={this.handleQuantity}></input><input type="submit" value="✓"></input>

          </form>
          <form name="expiry" onSubmit={this.handleSubmit}>
            <h3>Expiries</h3>
            <div>{this.state.item_expiries.map(this.expiryDisplay)}</div>
            <label>Quantity</label>
            <input type="number" name="quantity" value={this.state.required} onChange={this.handleExpiry}/> 
            <label>Expiry Date</label>
            <input type="date" name="expiry" value={this.state.item_expiries[0].expiry} onChange={this.handleExpiry}/>  <input type="submit" value="✓"></input>
          </form>
        </div>
      );
    }
    else {
      return (
        <div></div>
      )
    }
  }
});

