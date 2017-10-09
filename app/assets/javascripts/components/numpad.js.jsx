class Numpad extends React.Component {
  constructor(props) {
    super(props);
  }
  
  handleInput(e) {
    id = this.props.activeID; 
    if (id != null) {
      activeElement = document.getElementById(id);
      activeElement.value += e.target.value;

      var event = new Event('change');
      activeElement.dispatchEvent(event);
    }
  }

  del(e) {

  }

  render() {
    return (
      <div>
        <div id="Numpad">
          <input id="1" value="1" type="button" onClick={this.handleInput.bind(this)} />
          <input id="2" value="2" type="button" onClick={this.handleInput.bind(this)} />
          <input id="3" value="3" type="button" onClick={this.handleInput.bind(this)} />
          <br />
          <input id="4" value="4" type="button" onClick={this.handleInput.bind(this)} />
          <input id="5" value="5" type="button" onClick={this.handleInput.bind(this)} />
          <input id="6" value="6" type="button" onClick={this.handleInput.bind(this)} />
          <br />
          <input id="7" value="7" type="button" onClick={this.handleInput.bind(this)} />
          <input id="8" value="8" type="button" onClick={this.handleInput.bind(this)} />
          <input id="9" value="9" type="button" onClick={this.handleInput.bind(this)} />
          <br />
          <input id="0" value="0" type="button" onClick={this.handleInput.bind(this)} />
          <input id="btnDel" type="button" value="Del" onClick={this.del.bind(this)} />
        </div>
      </div>
    );
  }
}
