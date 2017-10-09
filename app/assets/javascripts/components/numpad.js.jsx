class Numpad extends React.Component {
    constructor(props) {
        super(props);
        
        console.log(this.props);
    }
   
    handleInput(e){
        id = this.props.activeID; 
        activeElement = document.getElementById(id);
        activeElement.focus(); 
        document.activeElement.value += e.target.value; 
    }

    render() {
        return (
            <div>
                <div id="Numpad">
                    <input id="1" value="1" type="button" onClick={this.handleInput} />
                    <input id="2" value="2" type="button" onClick={this.handleInput} />
                    <input id="3" value="3" type="button" onClick={this.handleInput} />
                    <br />
                    <input id="4" value="4" type="button" onClick={this.handleInput} />
                    <input id="5" value="5" type="button" onClick={this.handleInput} />
                    <input id="6" value="6" type="button" onClick={this.handleInput} />
                    <br />
                    <input id="7" value="7" type="button" onClick={this.handleInput} />
                    <input id="8" value="8" type="button" onClick={this.handleInput} />
                    <input id="9" value="9" type="button" onClick={this.handleInput} />
                    <br />
                        <input id="0" value="0" type="button" onClick={this.handleInput} />
                    <input id="btnDel" type="button" value="Del" onClick="del();" />
                </div>
            </div>
        );
    }
}