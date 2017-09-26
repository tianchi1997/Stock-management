var Item = React.createClass({
  getInitialState() {
    return this.getNewStateFromProps(this.props);
  },

  componentWillReceiveProps(nextProps) {
    this.setState(this.getNewStateFromProps(nextProps));
  },

  getNewStateFromProps(props) {
    newState = props.item;
    if (!newState.quantity) {
      newState.quantity = Math.max(this.getTotal(newState.itemExpiries), newState.required);
    }

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
    newItemExpiries[event.target.dataset.id].changed = false;

    newState = this.state;
    newState.itemExpiries = newItemExpiries;

    this.props.callback(this.props.itemIndex, newState);
  },

  onCountChange(event) {
    newItemExpiries = this.state.itemExpiries;
    newItemExpiries[event.target.dataset.id].count = parseInt(event.target.value);
    newItemExpiries[event.target.dataset.id].changed = true;

    newState = this.state;
    newState.itemExpiries = newItemExpiries;

    this.props.callback(this.props.itemIndex, newState);
  },

  onQuantityChange(event) {
    newState = this.state;
    newState.quantity = parseInt(event.target.value);

    this.props.callback(this.props.itemIndex, newState);
  },

  addExpiry() {
    newState = this.state;
    newState.itemExpiries.push({
      count: 0,
      expiryDate: ""
    });

    this.props.callback(this.props.itemIndex, newState);
  },

  removeExpiry(event) {
    newItemExpiries = this.state.itemExpiries
    newItemExpiries.splice(event.target.dataset.id, 1);
    this.props.callback(this.props.itemIndex, newItemExpiries);
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

