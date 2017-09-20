
var Item = React.createClass({
  getInitialState() {
    return {
      "item_expiries": [],
      "stock_item": [],
      "id": 0,
      "location_id": 0,
      "order_to": 0,
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
  componentWillReceiveProps(nextProps) {
    console.log("newprops", nextProps)
    this.setState(nextProps.item, () => console.log("newpropsitem", nextProps.item));
  },

  expiryDisplay(item_expiry) {
    return <div>{JSON.stringify(item_expiry)}</div>
  },

  render: function () {
    if (this.state.stock_item.name != []) {
      console.log("items_component name", this.state.stock_item)
      const border = {
        border: '3px solid black',
      };
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
          <h3>Quantity</h3> 
          <input type="number" placeholder={this.state.order_to} ></input>
          <h3>Expiries</h3>
          <div>{this.state.item_expiries.map(this.expiryDisplay)}</div>
          <label>Quantity</label>
          <input type="number" placeholder={this.state.order_to} /> 
          <label>Expiry Date</label>
          <input type="date"/>  <input type="button" value="✓"></input>
          
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

