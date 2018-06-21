import React, { Component } from 'react';
import '../ComponentsCSS/Nav.css';

// Navbar component of the page
class Nav extends Component {
  constructor(props) {
    super(props);
    this.state = {
      searchText: ''
    }
  }

  //Gets the search text
  getNewSearchText(e) {
    this.setState({searchText: e.target.value});
  }

  //Gets the type of search
  setSearchType(type){
    this.props.parentCallBack(this.state.searchText, type);
  }

  render() {
    return (
      <div className="searchContainer">
        <input id="searchBox" type="text" value={this.state.searchText} onChange={this.getNewSearchText.bind(this)} placeholder="What would you like to search for???"/>
        <div className="flexContainer">
          <button type="button" className="flexBox" onClick={() => this.setSearchType("films")}>Films</button>
          <button type="button" className="flexBox" onClick={() => this.setSearchType("people")}>People</button>
          <button type="button" className="flexBox" onClick={() => this.setSearchType("vehicles")}>Vehicle</button>
          <button type="button" className="flexBox" onClick={() => this.setSearchType("starships")}>Starships</button>
          <button type="button" className="flexBox" onClick={() => this.setSearchType("species")}>Species</button>
          <button type="button" className="flexBox" onClick={() => this.setSearchType("planets")}>Planets</button>
        </div>
      </div>
    );
  }
}

export default Nav;
