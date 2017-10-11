class ItemExpiry extends React.Component {
  preventDefault(event) {
    event.preventDefault();
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
    var expiryarray = this.props.itemExpiry.expiryDate.split('-');
    console.log(expiryarray);
    return (
      <div className="container-fluid">
        <form onSubmit={this.preventDefault.bind(this)}>
          <div className="form-group">
            <div className="row">
              <div className="col-xs-2">
                <label>Count:</label>
              </div>
              <div className="col-xs-4">
                <input type="number" name="count" id="count"
                  value={this.props.itemExpiry.count}
                  onChange={this.onCountChange.bind(this)}
                  className="form-control"
                />
              </div>
            </div>
            <div className="row no-gutters">
              <div className="col-xs-2">
                <label >Date:</label>
              </div>
              <div className="col-xs-2 fixed-width-day">

                <input type="number" name="day" id="day"
                  value={expiryarray[2]}
                  onChange={this.onExpiryChange.bind(this)}
                  className="form-control "
                />
              </div>

              <div className="col-xs-2 fixed-width-day">
                <input type="number" name="month" id="month"
                  value={expiryarray[1]}
                  onChange={this.onExpiryChange.bind(this)}
                  className="form-control "
                />
              </div>
              <div className="col-xs-4 fixed-width-year">              
                <input type="number" name="year" id="year"
                  value={expiryarray[0]}
                  onChange={this.onExpiryChange.bind(this)}
                  className="form-control"
                />
              </div>
              <div className="col-xs-2 fixed-width-year">
                <button onClick={this.removeExpiry.bind(this)} className="btn btn-danger">x</button>
              </div>
            </div>
          </div>
        </form>

      </div>
    );
  }
}
