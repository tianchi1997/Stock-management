var Item = React.createClass({
  handleChange(event) {
    this.setState({value: event.target.required});
    console.log(this.state);
  },

  handleSubmit(event) {
    alert('A name was submitted: ' + this.props);
    event.preventDefault();
  },

  componentDidMount() {
    this.setState(this.props.item);
  },

  render: function() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Name:
          <input type="number" value={this.props.required} onChange={this.handleChange} />
        </label>
        <input type="submit" value="Submit" />
      </form>
    );
  }
});

