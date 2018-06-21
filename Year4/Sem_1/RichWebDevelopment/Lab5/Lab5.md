# Lab 5

---

### Question 1

**Question:** Compare a server-rendered application (e.g. PHP) - having its presentation layer in server-side logic - with a Rich-web approach (having is presentation layer as client-side logic). Mention two advantages of each approach

**Answer:**

Two advantages of a Server-Rendered Application are:

1. There is less load on the client to render and update specific pages. Because the server has already pre rendered the page, less processing power is needed on the client side ultimately increasing loading times.
2. Also, as there in no direct link to the likes of databases on the client side, there are less likely to be security vulnerabilities within the application.

Two advantages of a Client-Rendered Application are:

1. Data synchronisation is better implemented within a client rendered application. Usually with a server rendered approach, data needs to be taken from multiple servers and sent back once, where as in a client rendered application, data can be generated on the fly.
2. Data validation and user experience are usually superior within a client rendered application also. This is mainly due to the fact that data does not need to be sent to the server to be validated and can all be handled from within the application.

---

### Question 2

**Question:** Explain how the box model works in CSS using example code in your answer

**Answer:** By using the flexbox model, a developer can ensure that elements behave in a predictable manner when the size of a screen varies from one device to another. This is achieved by creating a container and placing all other elements within in, Each element within the container is assigned a set of rules for its width, height and order and the browser works to scale the items accordingly.

```css
.flex-container {
  display: inline-flex;
  flex-flow: row wrap;
  justify-content: space-between;
}

.flex-item {
  flex-grow: 1;
}
```

---

### Question 3

**Question:** Suppose your web App has to run on an older browser that does not have built-in support for the fetch() API. Sketch an outline of how the fetch() API could be poly-filled in Javascript based on the XMLHttpRequest() API

**Answer:**

```javascript
let response;
const xhr = new XMLHttpRequest();
xhr.onreadystatechange = () => {
  if (xhr.readyState === XMLHttpRequest.DONE) {
    if (xhr.status === 200) {
      response = JSON.parse(xhr.responseText);
    } else {
      console.log('Error ' + xhr.statusText);
    }
  }
}
```

---

### Question 4

**Question:** CSS allows the reuse of code for styling DOM elements. Javascript functions can all be used for element styling and support code reuse. Compare the two code sharing approaches

**Answer:**

1. Javascript allows styling and elements to be generated on the fly, however a template is used and data can only be placed into that one single template. If you wish to style the elements different, you would need to create a brand new template so that it could be re-used.

```javascript
//Loop to create x amount of cells
for (var i = 0; i < numberOfCells + 1; i ++){
  var box = document.createElement('div');

  // Set the deault box styles
  box.style.width = "8px";
  box.style.height = "8px";
  box.style.border = "1px solid #000";
  box.style.display = "inline-block";
  box.style.backgroundColor = "#e9ff00";

  // Add box to page
  rowContainer.appendChild(box);
}
```

2. CSS on the other hand allows for re-usable templates that can be targeted at several different types of elements or single elements using things like ID's and class names.

```css
.allBoxes {
  border: 1px solid black;
}

#specificBox {
  border: 5px solid black;
}
```

---

### Question 5

**Question:** Describe the Web Component abstraction and explain its perceived advantages as a separation-of-concerns mechanism over other single responsibility approaches

**Answer:** In general, a user interface component is associated with two important aspects, namely its presentation and its behaviour. Each component has its own unique representation (i.e. its presentation). The presentation of a component, can be visual in nature such as an image or a video, or be input text field, or be audible such as a sound. Component behaviour, is the set of actions that can be taken on behalf of the component based on user feedback or input to the component. Some of its advantages are:

* The component abstraction does offer the opportunity and capability to comply with good design principles.
* Abstraction allows us to encapsulate and hide implementation details of the component’s presentation and behaviour at the individual component level.
* Components can be composed together in a hierarchical manner to create more complex applications and can be tested independently of the application.

---

### Question 6

**Question:** Describe how a React JS stateful class component is created and how its instantiated life-cycle can be managed

**Answer:** A component is created in the below example and can be managed using methods from the component class such as constructor(), componentWillMount(), render() and componentWillUpdate()

```javascript
class MyComponent extends React.Component {
  constructor() {
	this.state = { name: “some name” }
  }
  .
  .
  render() {
	this.setState({name: “a different name”})
  }
}
```

---

### Question 7

**Question:** In asynchronous programming, we have three approaches to handling data which may or may not arrive at some point in the future, namely callbacks, promises and streams. Describe each of these approaches. Are there any significant drawbacks of each in your opinion?

**Answer:**

1. **Callbacks:** The callback style can be used whenever the code needs to make a request which will take a relatively long time. As soon as the request is made, it is queued by the browser and the callback function is stored for subsequent execution. Meanwhile control is returned back to the executing context and the program proceeds. During this time, the app may handle user input events or make further async requests.

2. **Promises:** A promise is a value which is a contract for delivering a value in the future. The future is the time that the response arrives and the value will be a success value or an error value. As a promise is itself a value, it can be assigned to a variable, passed as an argument to a function and returned as an argument from a function.

3. **Streams:** Streams are an abstraction used to model asynchronous data sources. A stream is a powerful technique when processing data when you either don’t  know its potential size and/or you don’t know when it will arrive into your application. Processing of streams generally must be done in time-separated chunks in sequence or concurrently, depending on the application.

An example of all 3:

```javascript
const request$ = Observable.just('https://api.github.com/users');

const response$ = request$
  .flatMap(requestUrl =>
    Observable.fromPromise(fetch(requestUrl))
  );

response$.subscribe(response => {
  // render `response` to the DOM however you wish
});
```

---

### Question 8

**Question:** What are your reflections on how the Rich Web technologies stack up as a development environment based on your experience in this module or elsewhere?

**Answer:** For me personally, the technologies used in this module stack up quite well against other languages or technologies. React, JavaScript and RXJS are all extremely powerful technologies that hold so much potential for a developer to utilise. If we compare React and Javascript to say HTML, CSS and PHP, we can cut the later 3 out of the picture all together and use solely Javascript and React if needs be. The technologies used offer so many possibilities and offer developers great opportunities to be creative and inventive with their solutions.

---

### Question 9

**Question:** You will have encountered many bugs and issues during your code development in this module’s labs. Describe your approach to debugging your javascript application, mentioning any tools or techniques you have used

**Answer:** As most of my development was done locally using a text editor (ATOM), I relied on a browser such as google chrome to run most of my javascript code. In order to debug code, I would often print the contents of variables to a log or print error messages at certain lines due to the fact that my IDE did not display and syntactical errors. When the application ran, I would check the log to see any error / success messages and also the contents of data and would use these to assist me with debugging my code.

---
