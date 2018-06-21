var app = {};

// Function for generating random rows
// Returns an array of tile states
app.GenerateRow = function(rowIndex, previousRowStates, maxRows){

  // Check to stop iteration
  if (maxRows > 0){
    var numberOfCells = 101; // number of cells
    var currentRowStates = []; // stores current states
    var isActive; // Current tile state

    // Container for rows to tidy html
    var rowContainer = document.createElement('div');
    rowContainer.setAttribute('id','row'+rowIndex);
    rowContainer.style.height = "10px";
    document.body.appendChild(rowContainer);

    //Loop to create x amount of cells
    for (var i = 0; i < numberOfCells + 1; i ++){
      var box = document.createElement('div');

      // First row check
      if (rowIndex === 0){
        isActive = Math.random() >= 0.5;
      }
      else{
        // Get the state by checking Ancestor
        isActive = app.EvaluateAncestor(i, previousRowStates);
      }

      // Add current state to list
      currentRowStates.push(isActive);

      // Set the deault box styles
      box.style.width = "8px";
      box.style.height = "8px";
      box.style.border = "1px solid #000";
      box.style.display = "inline-block";

      if (isActive){
        box.style.backgroundColor = "#e9ff00";
      }
      else{
        box.style.backgroundColor = "#720087";
      }

      // Add box to page
      rowContainer.appendChild(box);
    }

    return app.GenerateRow(rowIndex + 1, currentRowStates, maxRows - 1)
  }
  else{
    return;
  }
}

// Starter function called in HTML
app.GenerateRows = function(numberOfRows){
    app.GenerateRow(0,[],numberOfRows);
}

// Function used to check parent ancestors
app.EvaluateAncestor = function(cellIndex, previousRowStates){
  // Flag to determine what to return
  var flag = false;

  //ancestor elements
  listLength = previousRowStates.length - 1;
  var ancestorState = previousRowStates[cellIndex];
  var ancestorLeftState;
  var ancestorRightState;

  // Check to see if we are at the start
  if (cellIndex === 0){
    ancestorLeftState = previousRowStates[listLength];
  }
  else{
    ancestorLeftState = previousRowStates[cellIndex - 1];
  }

  // Check to see if we are at the end
  if (cellIndex === listLength) {
    ancestorRightstate = previousRowStates[0];
  }
  else{
    ancestorRightState = previousRowStates[cellIndex + 1];
  }

  // True flags
  if (
    ancestorLeftState && ancestorState && ancestorRightState ||
    ancestorLeftState && !ancestorState && ancestorRightState ||
    ancestorLeftState && !ancestorState && !ancestorRightState ||
    !ancestorLeftState && ancestorState && !ancestorRightState ||
    !ancestorLeftState && !ancestorState && ancestorRightState
  ){
    flag = true;
  }

  // False flags
  if (
    ancestorLeftState && ancestorState && !ancestorRightState ||
    !ancestorLeftState && ancestorState && ancestorRightState ||
    !ancestorLeftState && !ancestorState && !ancestorRightState
  ){
    flag = false;
  }

  return flag;
}
