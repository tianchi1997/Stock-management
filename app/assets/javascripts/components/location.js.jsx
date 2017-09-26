var Location = React.createClass({ 
  getInitialState() {
    return {
      name: "",
      curItem: -1,
      items: [],
      id: this.props.locationID,
    };
  },

  loadLocation(locationID) {
    //setting the context of 'this'
    var self = this;
    var fetchURL = "/locations/" + locationID + ".json";

    //fetch the items associated with the location
    fetch(fetchURL, { credentials: 'include' })
      //parse the response to json
      .then(function(response) { return response.json(); })
      .then(function(json) {
        json.curItem = 0;
        self.setState(json);
    })
  },

  updateItemState(itemIndex, newItem) {
    newState = this.state;
    newState.items[itemIndex] = newItem;

    this.setState(newState);
  },

  componentWillMount() {
    this.loadLocation(this.props.locationID);
  },

  componentWillReceiveProps(newProps) {
    this.loadLocation(newProps.locationID);
  },

  prevItem() {
    if (this.state.curItem == -1) {
      alert("Loading...");
    } else if (this.state.curItem == 0) {
      alert("Error: No Previous Items");
    } else if (this.validState()) {
      this.setState((prevState, props) => ({
        curItem: prevState.curItem - 1
      }));
    }
  },

  nextItem() {
    if (this.state.curItem == -1) {
      alert("Loading...");
    } else if (this.state.curItem == this.state.items.length - 1) {
      alert("Error: No More Items");
    } else if (this.validState()) {
      this.saveItemExpiries();
      this.setState((prevState, props) => ({
        curItem: prevState.curItem + 1
      }));
    }
  },

  validState() {
    curItem = this.state.items[this.state.curItem];
    if (curItem.stockItem.expires) {
      total = this.getTotal(curItem.itemExpiries);
      if (total != curItem.quantity) {
        setTimeout(function() { alert("Quantity does not match total"); }, 1);
        return false;
      } else {
        if (curItem.itemExpiries.every(this.itemExpiryValid)) {
          return true;
        } else {
          setTimeout(function() { alert("Invalid Expiry"); }, 1);
        }
      }
    } else {
      return true;
    }
  },

  itemExpiryValid(itemExpiry) {
    if (this.state.items[this.state.curItem].stockItem.expires) {
      if (itemExpiry.expiryDate != null && new Date(itemExpiry.expiryDate) >= new Date()) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  },

  getTotal(itemExpiries) {
    return itemExpiries.reduce(function(total, expiry) {
      return total + expiry.count;
    }, 0);
  },

  saveItemExpiries() {
    item = this.state.items[this.state.curItem];
    itemID = item.id;
    var fetchURL = "/items/" + itemID + "/save_expiries";

    if (!item.stockItem.expires) {
      item.itemExpiries = [{
        expiryDate: null,
        count: item.quantity
      }];
    }

    //fetch the items associated with the location
    fetch(fetchURL, {
      credentials: 'include',
      method: 'post',
      body: JSON.stringify(item.itemExpiries)
    })
  },

  render: function() {
    if(this.state.curItem != -1){
      return (
        <div>
          <p>{this.state.errors}</p>
          <Item item={this.state.items[this.state.curItem]}
                callback={this.updateItemState}
                itemIndex={this.state.curItem}
          />
          <button onClick={this.prevItem} className="btn">Previous</button>
          <button onClick={this.nextItem} className="btn">Next</button>
        </div>
      );
    } else{
      return (
        <div>Empty</div>
      )
    }
  }
});

