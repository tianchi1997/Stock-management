class Numpad extends React.Component {
  constructor(props) {
    super(props);
  }

  handleInput(e) {
    e.preventDefault();
    if (document.activeElement.tagName.toLowerCase() == "input") {
      if (document.activeElement.value != "0") {
        document.activeElement.value += e.target.value;
      } else {
        document.activeElement.value = e.target.value;
      }
      ev = new Event("change", { bubbles: true });
      ev.simulated = true;
      document.activeElement.dispatchEvent(ev);
    }
  }

  del(e) {
    e.preventDefault();
    if(document.activeElement.tagName.toLowerCase() == "input"){
      element = document.activeElement;
      element.value = element.value.substr(0, element.value.length - 1);
      ev = new Event("change", { bubbles: true });
      ev.simulated = true;
      document.activeElement.dispatchEvent(ev);
    }
  }

  clear(e) {
    e.preventDefault();
    if(document.activeElement.tagName.toLowerCase() == "input"){
      element = document.activeElement;
      element.value = "";
      ev = new Event("change", { bubbles: true });
      ev.simulated = true;
      document.activeElement.dispatchEvent(ev);
    }
  }

  increase(e) {
    e.preventDefault();
    if(document.activeElement.tagName.toLowerCase() == "input"){
      element = document.activeElement;
      element.value = parseInt(element.value) + 1;
      ev = new Event("change", { bubbles: true });
      ev.simulated = true;
      document.activeElement.dispatchEvent(ev);
    }
  }

  decrease(e) {
    e.preventDefault();
    if(document.activeElement.tagName.toLowerCase() == "input"){
      element = document.activeElement;
      element.value = Math.max(parseInt(element.value) - 1, 0);
      ev = new Event("change", { bubbles: true });
      ev.simulated = true;
      document.activeElement.dispatchEvent(ev);
    }
  }



  render() {
    return (
      <div className="fixed-position">
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
          <input id="btnDel" type="button" value="←"  className="button-numpad" onMouseDown={this.del.bind(this)} />
          <input id="btnDel" type="button" value="C"  className="button-numpad" onMouseDown={this.clear.bind(this)} />
          <br />
          <input id="btnDel" type="button" value="-"  className="button-numpad" onMouseDown={this.decrease.bind(this)} />
          <input id="btnDel" type="button" value="+"  className="button-numpad" onMouseDown={this.increase.bind(this)} />
        </div>
      </div>
    );
  }
}
