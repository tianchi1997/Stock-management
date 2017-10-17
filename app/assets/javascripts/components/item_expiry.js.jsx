class ItemExpiry extends React.Component {
  // Prevent default action of event
  preventDefault(event) {
    event.preventDefault();
  }

  // When user changes count of item expiry
  onCountChange(event) {
    if(event.key != undefined){
      event.target.value += event.key;
      this.props.updateCount(this.props.expiryIndex,parseInt(event.target.value)); 
    }
    else this.props.updateCount(this.props.expiryIndex, parseInt(event.target.value));
  }

  // When user changes expiry date
  onExpiryChange(event) {
    this.props.updateExpiry(this.props.expiryIndex, event.target.value);
  }

  removeExpiry(event) {
    this.props.removeExpiry(this.props.expiryIndex);
    event.preventDefault();
  }

  render() {
    var expiryarray = this.props.itemExpiry.expiryDate.split('-');
    return (
        <form onSubmit={this.preventDefault.bind(this)}>
          <div className="form-group">
            <div className="row">
              <div className="col-xs-2">
                <label className="pad-bottom">Count:</label>
              </div>
              <div className="col-xs-4">
                <input type="number" name={"count_" + this.props.expiryIndex} id="highlight"
                  value={this.props.itemExpiry.count}
                  onChange={this.onCountChange.bind(this)}
                  onKeyPress={this.onCountChange.bind(this)}
                  className="form-control white-background"
                  readOnly="true"
                />
              </div>
            </div>
            <div className="row ">
              <div className="col-xs-2 ">
                <label>Date:</label>
              </div>
              <div className="col-xs-4 fixed-width-date">
                <input type="date" name={"expiry_date_" + this.props.expiryIndex} id="highlight"
                  value={this.props.itemExpiry.expiryDate}
                  onChange={this.onExpiryChange.bind(this)}
                  className="form-control "
                />
              </div>
              <div className="col-xs-4 fixed-width-4">
                <button onClick={this.removeExpiry.bind(this)} className="btn btn-danger">x</button>
              </div>
            </div>
          </div>
        </form>
    );
  }
}
