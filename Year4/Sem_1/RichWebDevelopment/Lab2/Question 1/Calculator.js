var calculator = {
  text: ""
};

calculator.run = function(){
  //Add button listeners to calculator
  let buttons = document.getElementsByClassName("flex-item");
  for(var i = 0; i < buttons.length; i ++){
    buttons[i].addEventListener("click", this.processClick(buttons[i].innerText));
  }

  //Setup event for button press and bind to function
  document.onkeydown = calculator.processButtonPress;
}

//function for dealing with button clicks
calculator.processClick = function(buttonText){
  return function(){
              calculator.calculateResult(buttonText);
           };
}

//function for dealing with button presses
calculator.processButtonPress = function(e){
  calculator.calculateResult(e.key);
}

//function to deal with calculation
calculator.calculateResult = function(input){
  //Get display text
  var displayText = document.getElementsByTagName("input");

  //Handle input and calculate result
  switch(input) {
    case "(":
    case ")":
    case "-":
    case "+":
    case ".":{
      calculator.text = calculator.text + input;
      break;
    }

    case "±":{
        //calculator.text = calculator.text + input;
        break;
    }

    case "÷":
    case "/":{
        calculator.text = calculator.text + "/";
        break;
    }

    case "x":
    case "X":
    case "*":{
        calculator.text = calculator.text + "*";
        break;
    }

    case "C":
    case "c":{
        calculator.text = "";
        break;
    }

    case "Backspace":
    case "backspace":{
        if (calculator.text.length !== 0 ){
          calculator.text = calculator.text.substring(0,calculator.text.length-1);
        }
        break;
    }

    case "=":{
      try {
        calculator.text = math.eval(calculator.text);
      } catch (e) {
          console.log(e.message);
          alert("Error with calculation, please try again!");
          calculator.text = "";
      }
      break;
    }

    default:
        if(input > -1 || input < 10){
          calculator.text = calculator.text + input;
        }
  }//End Switch

  displayText[0].value = calculator.text;
}//End Function calculateResult
