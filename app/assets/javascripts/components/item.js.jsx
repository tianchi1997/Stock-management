var Item = React.createClass({
  getInitialState() {
    return {
      stockItem: {
        name: "",
        expires: false
      },
      itemExpiries: [],
      required: 0,
      quantity: 0,
      error: ""
    };
  },

  componentWillMount() {
    this.loadItem(this.props.itemID);
  },

  componentWillReceiveProps(newProps) {
    this.loadItem(newProps.itemID);
  },

  loadItem(itemID) {
    // Setting the context of 'this'
    var self = this;
    var fetchURL = "/items/" + itemID + ".json";

    // Fetch the items associated with the location
    fetch(fetchURL, { credentials: 'include' })
      // Parse the response to json
      .then(function(response) { return response.json(); })
      .then(function(json) {
        total = 0;
        if (!json.stockItem.expires) {
          if (json.itemExpiries.length) {
            total = json.itemExpiries[0].count;
            json.itemExpiries = [];
          } else {
            total = 0;
          }
        } else {
          total = self.getTotal(json.itemExpiries);
        }

        maximum = json.orderTo ? json.orderTo : json.required;
        json.current = total;

        json.quantity = Math.max(total, json.required);
        json.quantity = Math.min(maximum, json.quantity);
        json.errors = "";

        self.setState(json);
    })
  },

  getTotal(itemExpiries) {
    return itemExpiries.reduce(function(total, expiry) {
      return total + expiry.count;
    }, 0);
  },

  saveItem() {
    fetchURL = "/items/" + this.state.id + "/save_expiries";
    itemExpiries = this.state.itemExpiries.slice();

    if (!this.state.stockItem.expires) {
      itemExpiries = [{
        expiryDate: null,
        count: this.state.quantity
      }];
    } else {
      total = this.getTotal(this.state.itemExpiries);
      if (total != this.state.quantity) {
        this.setState({errors: "Quantity does not match total"});
        return false;
      }
    }

    fetch(fetchURL, {
      credentials: 'include',
      method: 'post',
      body: JSON.stringify(itemExpiries)
    })

    return true;
  },

  onQuantityChange(event) {
    this.setState({
      quantity: parseInt(event.target.value),
      errors: ""
    })

    event.preventDefault();
  },

  updateCount(expiryIndex, newCount) {
    newItemExpiries = this.state.itemExpiries.slice();
    newItemExpiries[expiryIndex] = {
      expiryDate: this.state.itemExpiries[expiryIndex].expiryDate,
      count: newCount
    };

    this.setState({
      itemExpiries: newItemExpiries,
      errors: ""
    });
  },

  updateExpiry(expiryIndex, newExpiry) {
    newItemExpiries = this.state.itemExpiries.slice();
    newItemExpiries[expiryIndex] = {
      expiryDate: newExpiry,
      count: this.state.itemExpiries[expiryIndex].count
    };

    this.setState({
      itemExpiries: newItemExpiries,
      errors: ""
    });
  },

  addExpiry() {
    newItemExpiries = this.state.itemExpiries.slice();
    newItemExpiries.push({
      expiryDate: new Date().today,
      count: 1
    });

    this.setState({
      itemExpiries: newItemExpiries,
      errors: ""
    });
  },

  removeExpiry(expiryIndex) {
    newItemExpiries = this.state.itemExpiries.slice();
    newItemExpiries.splice(expiryIndex, 1);
    this.setState({
      itemExpiries: newItemExpiries,
      errors: ""
    });
  },

  prevItem() {
    if (this.saveItem()) {
      this.props.prevItem();
    }
  },

  nextItem() {
    if (this.saveItem()) {
      this.props.nextItem();
    }
  },

  preventDefault(event) {
    event.preventDefault();
  },

  render() {
    self = this;

    expiries = "";
    button = "";

    if (this.state.stockItem.expires) {
      expiries = this.state.itemExpiries.map(function(itemExpiry, index) {
        return (
          <ItemExpiry
            key={index}
            expiryIndex={index}
            itemExpiry={itemExpiry}
            removeExpiry={self.removeExpiry}
            updateExpiry={self.updateExpiry}
            updateCount={self.updateCount}
          />
        );
      });
      button = (
        <div>
          <button onClick={this.addExpiry} className="btn">Add expiry</button>
        </div>
      );
    }

    return (
      <div>
        <h2>{this.state.stockItem.name}</h2>
        <p>Current (To be removed): {this.state.current}</p>
        <p>Required: {this.state.required}</p>
        <p>Order To: {this.state.orderTo}</p>
        <form onSubmit={this.preventDefault}>
          <label>Quantity:</label>
          <input type="number" name="quantity"
                 value={this.state.quantity}
                 onChange={this.onQuantityChange}
          />
        </form>
        <div>
          {expiries}
          {button}
        </div>
        <button onClick={this.prevItem} className="btn">Previous</button>
        <button onClick={this.nextItem} className="btn">Next</button>
        <p>{this.state.errors}</p>
      </div>
    );
  }
});

