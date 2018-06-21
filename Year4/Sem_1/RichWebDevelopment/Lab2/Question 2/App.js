var app = {};
var xmlhttp = new XMLHttpRequest();
var url = "http://jsonplaceholder.typicode.com/users";

// Deal with response
xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        var jsonArray = JSON.parse(this.responseText);
        app.parseData(jsonArray);
    }
};

app.run = function(){
  // Setup and send get request
  xmlhttp.open("GET", url, true);
  xmlhttp.send();
}

//Deal with data
app.parseData = function(jsonArray){
  console.log("Raw JSON array:");
  console.log(jsonArray);

  var namesArray = jsonArray.map(app.getUserName);
  console.log("User names array:");
  console.log(namesArray);

  var locationArray = jsonArray.map(app.getLocation);
  console.log("Location array:");
  console.log(locationArray);

  var specificArray = jsonArray.map(app.getSpecifics);
  console.log("Specifics array:");
  console.log(specificArray);

  var specificZipArray = jsonArray.filter(app.getSpecificZip).map(function (el){
    return el.address;
  });
  console.log("Specific zip array:");
  console.log(specificZipArray);

  var product = jsonArray.map(function (el){
    return el.id;
  }).reduce(app.getProduct);
  console.log("Product:");
  console.log(product);
}

app.getUserName = function(list) {
  return list.username;
}

app.getLocation = function(list){
  return list.address.geo;
}

app.getSpecifics = function(list){
  return [list.name,list.id,list.company.name,list.address.zipcode];
}

app.getSpecificZip = function(list){
  return list.address.zipcode.substring(0,1) === "5";
}

app.getProduct = function(total, id){
  return total * id;
}
