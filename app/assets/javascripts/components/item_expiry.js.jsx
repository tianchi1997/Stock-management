class ItemExpiry extends React.Component {
  preventDefault(event) {
    event.preventDefault();
  }

  onCountChange(event) {
    this.props.updateCount(this.props.expiryIndex, parseInt(event.target.value));
  }

  onExpiryChange(event) {
    this.props.updateExpiry(this.props.expiryIndex, event.target.value);
  }

  removeExpiry(event) {
    this.props.removeExpiry(this.props.expiryIndex);
    event.preventDefault();
  }

  render() {
    return (
      <div>
        <form onSubmit={this.preventDefault.bind(this)}>
          <label>Count:</label>
          <input type="number" name="count"
                 value={this.props.itemExpiry.count}
                 onChange={this.onCountChange.bind(this)}
          />
          <label>Date:</label>
          <input type="date" name="expiryDate"
                 value={this.props.itemExpiry.expiryDate}
                 onChange={this.onExpiryChange.bind(this)}
          />
          <button onClick={this.removeExpiry.bind(this)} className="btn">x</button>
        </form>
      </div>
    );
  }
}
