var app = {};
var user = {
  userData: [],
  repoData: []
};

app.run = function (){
  let button = document.getElementById("usernameSearchButton");
  button.onclick = app.searchUser
}

// Triggered when user clicks the search button
app.searchUser = function (){
  var node = document.getElementById("scrollable");
  while (node.hasChildNodes()) {
    node.removeChild(node.lastChild);
  }

  var username = document.getElementById("usernameSearchInput").value;
  var url = "https://api.github.com/users/" + username;

  //Send requests
  if (username !== ""){
    app.sendRequest(url).then(function (jsonArray){
      app.getUserData(jsonArray);
    });

    url = url + "/repos";
    app.sendRequest(url).then(function (jsonArray){
      app.getRepoData(jsonArray);
    });
  }
  else{
    alert("Username is blank, please try again!");
  }
}

//Deals with sending the request and return a promise object which contains the JSON array
app.sendRequest = function (url){
  return fetch(url)
  .then(app.getPromiseStatus)
  .then(app.getJson)
  .then(function(data) {
    console.log('Request succeeded with JSON response');
    return data;
  }).catch(function(error) {
    console.log('Request failed', error);
    alert("User not found, please try again!");
  });
}

//Check the ststus of the request to see if data can be parsed
app.getPromiseStatus = function (response) {
  if (response.status >= 200 && response.status < 300) {
    return Promise.resolve(response)
  } else {
    return Promise.reject(new Error(response.statusText))
  }
}

//Get json
app.getJson = function (response) {
  return response.json()
}

//Function for getting all user data
app.getUserData = function (jsonArray){
  console.log("Mapping user data for user: " + jsonArray.login);
  var userData = [jsonArray["avatar_url"],jsonArray["name"],jsonArray["login"], jsonArray["email"], jsonArray["location"], jsonArray["public_gists"]];
  app.displayUserProfile(userData);
}

//Function for getting all repo data
app.getRepoData = function (jsonArray){
  console.log("Mapping repo data");
  var repoData = jsonArray.map(function (el){
    return [el.name, el.description];
  });
  app.displayUserRepos(repoData);
}

//update the UI with the retrieved data
app.displayUserProfile = function(userData){
  var userContainer = document.getElementById("nonScrollable");
  var childElements = userContainer.children;

  childElements[0].attributes.src.value = userData[0];
  var pageText = ["Name: ","Username: ","E-mail: ","Location: ","Number of Gists: "];
  for (var i = 1; i < userData.length; i ++){
    childElements[i].innerText = pageText[i-1] + userData[i];
  }
}

//Update the UI with the retrieved data
app.displayUserRepos = function(repoArray){
  var repoContainer = document.getElementById("scrollable");

  for (var i = 0; i < repoArray.length; i ++){
    var repo = document.createElement("p");
    var className = document.createAttribute("class");
    className.value = "flexRowItem";
    repo.setAttributeNode(className);
    repo.innerText = "Repo: " + repoArray[i][0] + "\r\n\r\nDetails: " + repoArray[i][1];
    repoContainer.appendChild(repo);
  }
}
