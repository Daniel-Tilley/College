import React, { Component } from 'react';
import axios from 'axios';
import '../ComponentsCSS/Data.css';

//componebt for rendering returned data
class Data extends Component {
  constructor(props) {
    super(props);
    this.state = {
      results: [],
      currentItemName: null
    }
  }

  //Used to make the initial api call
  getApiData(){
    axios.get("https://swapi.co/api/" + this.props.search.searchType + "/?search=" + this.props.search.searchData+ "&format=json")
      .then((response) => {
        this.setState({results: response.data.results});
      })
      .catch((error) => {
        console.log(error);
    });
  }

  //Was used to try and make the api call for the names, but was never used
  getApiNameData = (url) =>{
    var instance = axios.create({
      baseURL: url,
      timeout: 1000,
      headers: {'X-Requested-With': 'XMLHttpRequest'},
      responseType: 'json'
    });

    instance.get()
      .then((response) => {
        var data = response.data;
        this.setState({currentItemName: data[Object.keys(data)[0]]});
      })
      .catch((error) => {
        console.log(error);
    });
  }

  //Used to translate returned objects into html
  prepareData = (dataObject) =>{
    var displayText = Object.entries(dataObject).map(([key, value]) => {
      // Skip the arrays (unable to do them)
      if (!Array.isArray(value)) {
        //Check for links
        if (value.startsWith('http')) {

          // Tried to get array name working using this method
          //this.getApiNameData(value);

          //Trued rendering changes using this
          //{this.state.currentItemName}
          return (
            <tr>
              <td colSpan="2">
                <a href={value}>
                  {key}
                </a>
              </td>
            </tr>
          );
          }
        else {
          return (
            <tr>
              <td>
                {key}
              </td>
              <td>
                {value}
              </td>
            </tr>
          );
        }
      }
    });

    return displayText;
  }

  render() {
    var data = ""; // object
    var displayText = ""; // html to render

    // Check for empty props
    if(this.props.search.searchData !== null){
      // make the api call
      this.getApiData();
      data = this.state.results[0];

      // prepare the data
      if (data !== undefined){
        displayText = this.prepareData(data)
      }
    }

    return (
      <table id="dataTable">
        <tbody>
          {displayText}
        </tbody>
      </table>
    );
  }
}

export default Data;
