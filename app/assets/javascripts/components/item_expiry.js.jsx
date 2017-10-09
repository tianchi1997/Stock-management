class ItemExpiry extends React.Component {
  preventDefault(event) {
    event.preventDefault();
  }
  onSelect(event){
    //console.log("item: event.target.id", event.target.id);
    //this.props.setActiveID(event.target.id);
    element = document.getElementById(event.target.id);
    element.focus();   

  }
  onCountChange(event) {
    this.props.updateCount(this.props.expiryIndex, parseInt(event.target.value));
  }

  onExpiryChange(event) {
    this.props.updateExpiry(this.props.expiryIndex, event.target.value, event.target.name);
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
                 onSelect={this.onSelect.bind(this)}
          />
          <label>Date:</label>
          <input type="number" name="day"
                 value={this.props.itemExpiry.expiryDate.substring(8,10)}
                 onChange={this.onExpiryChange.bind(this)}
          />
          <input type="number" name="month"
                 value={this.props.itemExpiry.expiryDate.substring(5,7)}
                 onChange={this.onExpiryChange.bind(this)}
          />
          <input type="number" name="year"
                 value={this.props.itemExpiry.expiryDate.substring(0,4)}
                 onChange={this.onExpiryChange.bind(this)}
          />
          <button onClick={this.removeExpiry.bind(this)} className="btn">x</button>
        </form>
      </div>
    );
  }
}
