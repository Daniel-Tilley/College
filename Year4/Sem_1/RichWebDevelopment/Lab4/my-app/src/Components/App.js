import React, { Component } from 'react';
import logo from '../logo.svg';
import '../ComponentsCSS/App.css';
import Nav from './Nav';
import Data from './Data';

// component for running the app
class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      searchData: null,
      searchType: null
    }

    // binding callback so that it can access the class
    this.searchCallBack = this.searchCallBack.bind(this);
  }

  //callback function to be executed when the buttons are clicked
  searchCallBack(srchData, srchType){
    this.setState({ searchData: srchData});
    this.setState({ searchType: srchType});
  }

  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Search everything Star Wars below!</h1>
          <div>
            <Nav parentCallBack={this.searchCallBack}/>
          </div>
        </header>
        <Data search={this.state}/>
      </div>
    );
  }
}

export default App;
