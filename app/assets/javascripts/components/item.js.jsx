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
      errors: "",
      prevItemTrigger: 0,
      nextItemTrigger: 0

    };
  }

  componentWillMount() {
    //load the item details
    this.loadItem(this.props.itemID);
    //load the prev and next item trigger values 
    this.setState({prevItemTrigger: this.props.prevItemTrigger,nextItemTrigger: this.props.nextItemTrigger}); 
  }

  componentWillReceiveProps(newProps) {
    //only load item when a new item is actually being passed, not when prev item or next item is being passed in. 
    if(newProps.prevItemTrigger == this.state.prevItemTrigger && newProps.nextItemTrigger == this.state.nextItemTrigger){
      this.loadItem(newProps.itemID);
    }
    //otherwise update the prevItem and nextItem index and call next/prev item function. 
    else if(newProps.prevItemTrigger > this.state.prevItemTrigger){
      this.setState({prevItemTrigger: newProps.prevItemTrigger},function(){this.prevItem()});
    }
    else if(newProps.nextItemTrigger > this.state.nextItemTrigger){
      this.setState({nextItemTrigger: newProps.nextItemTrigger},function(){this.nextItem()});
    }
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
      alert("Please enter a valid count"); 
      this.setState({ errors: "Please enter a valid count" });
      return false;
    }
    // make sure that there are no duplicates
    if (curExpiries.indexOf(expiry) > - 1) {
      alert("Duplicate dates detected"); 
      this.setState({ errors: "Duplicate dates detected" });
      return false;
    }

    //create a new date object based on the expiry date entered. 
    var today = new Date(new Date().toJSON().slice(0, 10));
    var date = new Date(expiry);

    curExpiries.push(expiry);
    // check that the expiry is valid.
    if (expiry == null || date < today) {
       alert("Please enter a valid expiry date");
      this.setState({ errors: "Please enter a valid expiry date" });
      return false;
    }
     return true;
  }

  saveItem() {
    var self = this;
    fetchURL = "/items/" + this.state.id + "/save_expiries";
    itemExpiries = this.state.itemExpiries.slice();

    if (this.state.quantity < 0) {
      alert("Quantity cannot be negative");
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
        alert("Quantity does not match total");
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
  onQuantityChange(event) {
    if(event.key != undefined){
      //if the key was a number then append the number
      if(parseInt(event.key) > 0 || parseInt(event.key) <= 9 ){
        event.target.value += event.key;
      }
      //if the key press was backspace 
      else if(event.key == "Backspace"){
        event.target.value = event.target.value.substr(0, event.target.value.length - 1)
      }
      this.setState({
        quantity: parseInt(event.target.value),
        errors: ""
      });
    }
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

  updateExpiry(expiryIndex, expiry) {
    newItemExpiries = this.state.itemExpiries.slice();
    
    newItemExpiries[expiryIndex] = {
      expiryDate: expiry,
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
    expiryheader ="";

    if (this.state.stockItem.expires) {
      expiryheader = "Expiries"
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
          <button onClick={this.addExpiry.bind(this)} className="btn btn-primary add-expiry-btn-margins">Add expiry</button>
        </div>
      );
    }

    return (
      <div className="no-margin" >
        <h2>{this.state.stockItem.name}</h2>
        <h4>Required: {this.state.required}</h4>
        <h4>Order To: {this.state.orderTo}</h4>
        <form onSubmit={this.preventDefault.bind(this)}>
          <h3>Quantity:</h3>
          <input type="number" id="highlight" name="quantity"
            value={this.state.quantity}
            onChange={this.onQuantityChange.bind(this)}
            onKeyDown={this.onQuantityChange.bind(this)}
            className="input-lg"
            readOnly="true"
          />
        </form>
        <div>
          <h3>{expiryheader}</h3>
          {expiries}
          {button}
        </div>
        <br/>
      </div >
    );
  }
}

