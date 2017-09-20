var Item = React.createClass({
  getInitialState() {
    return {
      "item_expiries": [],
      "stock_item": null,
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

  expiryDisplay(item_expiry) {
    return <div>{JSON.stringify(item_expiry)}</div>
  },

  render: function() {
    return <div>{JSON.stringify(this.state.item_expiries)}</div>
    return (
      this.state.item_expiries.map(expiryDisplay)
    );
  }
});

