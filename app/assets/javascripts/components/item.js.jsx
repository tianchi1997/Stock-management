var Item = React.createClass({
  getInitialState() {
    return this.getNewStateFromProps(this.props);
  },


  componentWillReceiveProps(nextProps) {
    this.setState(this.getNewStateFromProps(nextProps));
  },

  getNewStateFromProps(props) {
    newState = props.item;
    newState.quantity = Math.max(this.getTotal(newState.itemExpiries), newState.required);

    newState.itemExpiries = newState.itemExpiries.sort(function(a, b) {
      return new Date(a.expiryDate) - new Date(b.expiryDate);
    });

    return newState;
  },

  getTotal(itemExpiries) {
    return itemExpiries.reduce(function(total, expiry) {
      return total + expiry.count;
    }, 0);
  },

  onExpiryDateChange(event) {
    newItemExpiries = this.state.itemExpiries;
    newItemExpiries[event.target.dataset.id].expiryDate = event.target.value;

    this.setState({
      itemExpiries: newItemExpiries
    });
  },

  onCountChange(event) {
    newItemExpiries = this.state.itemExpiries;
    newItemExpiries[event.target.dataset.id].count = event.target.value;

    this.setState({
      itemExpiries: newItemExpiries
    });
  },

  onQuantityChange(event) {
    this.setState({quantity: event.target.value});
  },

  addExpiry() {
    newItemExpiries = this.state.itemExpiries;
    newItemExpiries.push({
      count: 1,
      expiryDate: ""
    });

    this.setState({
      itemExpiries: newItemExpiries
    });
  },

  removeExpiry(event) {
    newItemExpiries = this.state.itemExpiries
    newItemExpiries.splice(event.target.dataset.id, 1);

    this.setState({
      itemExpiries: newItemExpiries
    });
  },

  expiryForm(itemExpiry, index) {
    return (
      <form name="expiry">
        <label>Quantity</label>
        <input type="number" name="count" value={itemExpiry.count} data-id={index} onChange={this.onCountChange} />
        <label>Expiry Date</label>
        <input type="date" name="expiryDate" value={itemExpiry.expiryDate} onChange={this.onExpiryDateChange} data-id={index} />
        <button type="button" onClick={this.removeExpiry} className="btn" data-id={index}>x</button>
      </form>
    );
  },

  render: function () {
    var self = this;
    expiries = null;

    if (this.state.stockItem.expires) {
      itemExpiries = this.state.itemExpiries;

      expiries = itemExpiries.map((itemExpiry, index) =>
        <div key={index}>
          {self.expiryForm(itemExpiry, index)}
        </div>
      );

      expiries = (
        <div>
          <h3>Expiries</h3>
          {expiries}

          <button onClick={this.addExpiry} className="btn">Add Expiry</button>
        </div>
      );
    }

    return (
      <div>
        <table>
          <thead>
            <tr>
              <th>Name</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{this.state.stockItem.name}</td>
            </tr>
          </tbody>
        </table>

        <form name="quantity">
          <h3>Quantity</h3> 
          <input type="number" value={this.state.quantity} onChange={this.onQuantityChange}></input>
        </form>

        {expiries}
      </div>
    );
  }
});

