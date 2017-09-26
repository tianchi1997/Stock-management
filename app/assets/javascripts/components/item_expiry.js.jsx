var ItemExpiry = React.createClass({
  preventDefault(event) {
    event.preventDefault();
  },

  onCountChange(event) {
    this.props.updateCount(this.props.expiryIndex, parseInt(event.target.value));
  },

  onExpiryChange(event) {
    this.props.updateExpiry(this.props.expiryIndex, event.target.value);
  },

  removeExpiry(event) {
    this.props.removeExpiry(this.props.expiryIndex);
    event.preventDefault();
  },

  render: function() {
    return (
      <div>
        <form onSubmit={this.preventDefault}>
          <label>Count:</label>
          <input type="number" name="count"
                 value={this.props.itemExpiry.count}
                 onChange={this.onCountChange}
          />
          <label>Date:</label>
          <input type="date" name="expiryDate"
                 value={this.props.itemExpiry.expiryDate}
                 onChange={this.onExpiryChange}
          />
          <button onClick={this.removeExpiry} className="btn">x</button>
        </form>
      </div>
    );
  }
});

