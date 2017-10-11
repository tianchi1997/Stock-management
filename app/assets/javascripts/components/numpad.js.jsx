class Numpad extends React.Component {
  constructor(props) {
    super(props);
  }
  
  handleInput(e) {
    e.preventDefault();
    if (document.activeElement.tagName.toLowerCase() == "input") {
      document.activeElement.value += e.target.value;
     
    }
  }

  del(e) {
    e.preventDefault(); 
    if(document.activeElement.tagName.toLowerCase() == "input"){
      element = document.activeElement; 
      element.value = element.value.substr(0, element.value.length - 1);
      ev = new Event("input", { bubbles: true });
      ev.simulated = true;
      document.activeElement.dispatchEvent(ev);
    }
  }

  render() {
    return (
      <div className="relative-position">
        <div id="Numpad">
          <input id="1" value="1" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="2" value="2" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="3" value="3" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <br />
          <input id="4" value="4" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="5" value="5" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="6" value="6" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <br />
          <input id="7" value="7" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="8" value="8" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="9" value="9" className="button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <br />
          <input id="0" value="0" type="button"  className="button-numpad" onMouseDown={this.handleInput.bind(this)} />
          <input id="btnDel" type="button" value="Del"  className="button-numpad" onMouseDown={this.del.bind(this)} />
        </div>
      </div>
    );
  }
}
