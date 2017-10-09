class Numpad extends React.Component {
  constructor(props) {
    super(props);
  }
  
  handleInput(e) {
    e.preventDefault();
    if (document.activeElement.tagName.toLowerCase() == "input") {
      document.activeElement.value += e.target.value;
      element.dispatchEvent(new Event("input", { bubbles: true }));
    }
  }

  del(e) {

  }

  render() {
    return (
      <div>
        <div id="Numpad">
          <input id="1" value="1" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="2" value="2" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="3" value="3" type="button" onMouseDown={this.handleInput.bind(this)} />
          <br />
          <input id="4" value="4" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="5" value="5" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="6" value="6" type="button" onMouseDown={this.handleInput.bind(this)} />
          <br />
          <input id="7" value="7" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="8" value="8" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="9" value="9" type="button" onMouseDown={this.handleInput.bind(this)} />
          <br />
          <input id="0" value="0" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="btnDel" type="button" value="Del" onMouseDown={this.del.bind(this)} />
        </div>
      </div>
    );
  }
}
