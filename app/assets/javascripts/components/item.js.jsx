
var Item = React.createClass({
  getInitialState() {
    newState = this.props.item;
    newState.total = this.getTotal(newState.itemExpiries);

    return newState;
  },

  getTotal(itemExpiries) {
    return itemExpiries.reduce(function(total, expiry) {
      return total + expiry.count;
    }, 0);
  },

  getFormValue(){
    return Math.max(this.state.required, this.state.total);
  },

  componentWillReceiveProps(nextProps) {
    newState = nextProps.item;
    newState.total = this.getTotal(newState.itemExpiries);

    this.setState(newState);
  },

  expiryForm(itemExpiry) {
    return (
      <form name="expiry" onSubmit={this.handleSubmit}>
        <label>Quantity</label>
        <input type="number" name="count" value={itemExpiry.count} />
        <label>Expiry Date</label>
        <input type="date" name="expiryDate" value={itemExpiry.expiryDate} />
        <input type="submit" value="✓" />
      </form>
    );
  },

  render: function () {
    var self = this;
    expiries = null;

    if (this.state.stockItem.expires) {
      expiries = this.state.itemExpiries.map((itemExpiry) =>
        <div key={itemExpiry.id}>
          {self.expiryForm(itemExpiry)}
        </div>
      );

      expiries = (
        <div>
          <h3>Expiries</h3>
          {expiries}
        </div>
      );
    }

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
              <td>{this.state.stockItem.name}</td>
            </tr>
          </tbody>
        </table>

        <form name="quantity" onSubmit={this.handleSubmit}>
          <h3>Quantity</h3> 
          <input type="number" value={this.getFormValue()} onChange={this.handleQuantity}></input><input type="submit" value="✓"></input>
        </form>

        {expiries}
      </div>
    );
  }
});

