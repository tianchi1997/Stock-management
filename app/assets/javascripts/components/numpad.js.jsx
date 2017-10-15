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
      <div className="fixed-position container-fluid">
        <div className="row">
          <input id="1" value="1" className="col-xs-4 col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="2" value="2" className="col-xs-4 col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="3" value="3" className="col-xs-4 col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
        </div>
        <div className="row">
          <input id="4" value="4" className="col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="5" value="5" className="col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="6" value="6" className="col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
        </div>
        <div className="row">
          <input id="7" value="7" className="col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="8" value="8" className="col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
          <input id="9" value="9" className="col-xs-4 button-numpad" type="button" onMouseDown={this.handleInput.bind(this)} />
        </div>
        <div className="row">
          <input id="0" value="0" type="button"  className="col-xs-4 button-numpad" onMouseDown={this.handleInput.bind(this)} />
          <input id="btnDel" type="button" value="C"  className="col-xs-4 button-numpad" onMouseDown={this.clear.bind(this)} />
          <input id="btnDel" type="button" value="←"  className="col-xs-4 button-numpad" onMouseDown={this.del.bind(this)} />
        </div>
        <div className="row">
          <input id="btnDel" type="button" value="-"  className="col-xs-6 button-numpad" onMouseDown={this.decrease.bind(this)} />
          <input id="btnDel" type="button" value="+"  className="col-xs-6 button-numpad" onMouseDown={this.increase.bind(this)} />
        </div>
        <div className="row">
          <input onClick={this.props.prevItem} type="button" className="col-xs-6 button-numpad" value="Previous"/>
          <input onClick={this.props.nextItem} type="button"className="col-xs-6 button-numpad" value="Next" />
        </div>
      </div>
    );
  }
}
