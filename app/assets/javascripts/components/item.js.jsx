class Item extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      stockItem: {
        name: "",
        expires: false
      },
      itemExpiries: [],
      required: 0,
      quantity: 0,
      errors: ""
    };
  }

  componentWillMount() {
    this.loadItem(this.props.itemID);
  }

  componentWillReceiveProps(newProps) {
    this.loadItem(newProps.itemID);
  }

  loadItem(itemID) {
    // Setting the context of 'this'
    var self = this;
    var fetchURL = "/items/" + itemID + ".json";

    // Fetch the items associated with the location
    fetch(fetchURL, { credentials: 'include' })
      // Parse the response to json
      .then(function (response) { return response.json(); })
      .then(function (json) {
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
  }

  getTotal(itemExpiries) {
    return itemExpiries.reduce(function (total, expiry) {
      return total + expiry.count;
    }, 0);
  }
  // checks the expiry entries 
  checkExpiry(count, expiry, curExpiries) {
    if (count <= 0 || count == null) {
      this.setState({ errors: "Please enter a valid count" });
      return false;
    }
    // make sure that there are no duplicates
    if (curExpiries.indexOf(expiry) > - 1) {
      this.setState({ errors: "Duplicate dates detected" });
      return false;
    }

    //create a new date object based on the expiry date entered. 
    var today = new Date(new Date().toJSON().slice(0, 10));
    var date = new Date(expiry);

    curExpiries.push(expiry);
    // check that the expiry is valid. 
    if (expiry == null || date < today) {
      this.setState({ errors: "Please enter a valid expiry date" })
      return false;
    }

    console.log("expiry in checkExpiry",expiry);
    dataArray = expiry.split("-");
    //check that each entry has the correct format
    if(dataArray[0].length != 4 || dataArray[1].length != 2 || dataArray[2] != 2 ){
     return false; 
    } 
    //pad the day and month with zeros. 
    numberday = parseInt(dataArray[2]);
    numbermonth = parseInt(dataArray[1]); 
    if(numberday < 10){
      dataArray[2] = '0'.concat(dataArray[2]); 
    }
    if(numbermonth < 10){
      dataArray[1] = '0'.concat(dataArray[1]); 
    }
    //check that year has 4 digits
    if(dataArray[0].length != 4){
      return false; 
    }
     return true;
  }

  saveItem() {
    var self = this;
    fetchURL = "/items/" + this.state.id + "/save_expiries";
    itemExpiries = this.state.itemExpiries.slice();

    if (this.state.quantity < 0) {
      this.setState({ errors: "Quantity cannot be negative" });
    }

    // if the item does not expire then no need to check that quantity matches
    if (!this.state.stockItem.expires) {
      itemExpiries = [{
        expiryDate: null,
        count: this.state.quantity
      }];

      if (this.state.quantity == 0) {
        itemExpiries = [];
      }
    } else {
      // checks that expiry quantities match the total quantity 
      total = this.getTotal(this.state.itemExpiries);
      if (total != this.state.quantity) {
        this.setState({ errors: "Quantity does not match total" });
        return false;
      }

      // checks that each entry has both an expiry and a quantity
      // checks that each expiry entry is valid (i.e item has not already expired)
      curExpiries = [];
      for (i = 0; i < self.state.itemExpiries.length; i++) {
        if (!this.checkExpiry(self.state.itemExpiries[i].count, self.state.itemExpiries[i].expiryDate, curExpiries)) {
          return false;
        }
      }
    }
    fetch(fetchURL, {
      credentials: 'include',
      method: 'post',
      body: JSON.stringify(itemExpiries)
    })

    return true;
  }

  onSelect(event) {
    //console.log("item: event.target.id", event.target.id);
    //this.props.setActiveID(event.target.id);
    element = document.getElementById(event.target.id);
    element.focus();

  }
  onQuantityChange(event) {
    this.setState({
      quantity: parseInt(event.target.value),
      errors: ""
    })

    event.preventDefault();
  }

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
  }

  updateExpiry(expiryIndex, expiry, type) {
    newItemExpiries = this.state.itemExpiries.slice();
    tempExp = newItemExpiries[expiryIndex].expiryDate;
    dateArray = tempExp.split("-");
    //insert the expiry based on the type that was passed in
    if (type == "day") {
      
      dateArray[2] = expiry;
    }
    else if (type == "month") {
      dateArray[1] = expiry;
    }
    else if (type == "year") {
      dateArray[0] = expiry;
    }
    newExpiry = dateArray.join("-");

    newItemExpiries[expiryIndex] = {
      expiryDate: newExpiry,
      count: this.state.itemExpiries[expiryIndex].count
    };

    this.setState({
      itemExpiries: newItemExpiries,
      errors: ""
    });


  }

  addExpiry() {
    newItemExpiries = this.state.itemExpiries.slice();
    newItemExpiries.push({
      expiryDate: new Date().toJSON().slice(0, 10),
      count: 1
    });

    this.setState({
      itemExpiries: newItemExpiries,
      errors: ""
    });
  }

  removeExpiry(expiryIndex) {
    newItemExpiries = this.state.itemExpiries.slice();
    newItemExpiries.splice(expiryIndex, 1);
    this.setState({
      itemExpiries: newItemExpiries,
      errors: ""
    });
  }

  prevItem() {
    if (this.saveItem()) {
      this.props.prevItem();
    }
  }

  nextItem() {
    if (this.saveItem()) {
      this.props.nextItem();
    }
  }

  preventDefault(event) {
    event.preventDefault();
  }

  render() {
    var self = this;
    expiries = "";
    button = "";

    if (this.state.stockItem.expires) {
      expiries = this.state.itemExpiries.map(function (itemExpiry, index) {
        return (
          <ItemExpiry
            key={index}
            expiryIndex={index}
            itemExpiry={itemExpiry}
            removeExpiry={self.removeExpiry.bind(self)}
            updateExpiry={self.updateExpiry.bind(self)}
            updateCount={self.updateCount.bind(self)}
          />
        );
      });
      button = (
        <div>
          <button onClick={this.addExpiry.bind(this)} className="btn">Add expiry</button>
        </div>
      );
    }

    return (
      <div >
        <h2>{this.state.stockItem.name}</h2>
        <p>Current (To be removed): {this.state.current}</p>
        <p>Required: {this.state.required}</p>
        <p>Order To: {this.state.orderTo}</p>
        <form onSubmit={this.preventDefault.bind(this)}>
          <label>Quantity:</label>
          <input type="number" id="itemquantity" name="quantity"
            value={this.state.quantity}
            onChange={this.onQuantityChange.bind(this)}
            onSelect={this.onSelect.bind(this)}
          />
        </form>
        <div>
          {expiries}
          {button}
        </div>
        <button onClick={this.prevItem.bind(this)} className="btn">Previous</button>
        <button onClick={this.nextItem.bind(this)} className="btn">Next</button>
        <p>{this.state.errors}</p>
      </div >
    );
  }
}

