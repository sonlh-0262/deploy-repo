### Data Types:

undefined, null, boolean, string, symbol, number, and object

Define:

```
var myName = "abc"
myName = 8

let ourName = "dddd"
const pi = 3.14
```

### Variable:
- Name is Case Sensitivity in variable

```
var studyHard
STUDYHARD is different
```

### Change number
- Increment number
```
var num = 80;
num = num + 1 or
num++;
```

- Decrement number
```
var num = 80;
num = num - 1 or
num--
```

syntax:
+=
-=
*=
/=

### Escaping Literal Quotes (\)
```
var nmae = "Hello my name is \"a man\" and I live in \"earth\""
or 
# show "
url = '<a href="google.com"></a>'
or 
# show both ' and "
url = `'<a href="google.com"></a>'`
```

### Special escape
```
\'  single quote
\"  double quote
\\  backslash
\n  new line
\t  tab
\r  carriage return
\b  backspace
\f form feed
```

### String immutability
```
var name = "hello"
name[0] = "g" => can not change
```

### Nest Array

### push() - append last

```
var ourArray = [1, 2, 3]
ourArray.push([4, 5]) => [1, 2, 3, [4, 5]]
```

### pop() - remove last
```
var ourArray = [1,2,3]
var removedArray = ourArray.pop()
# removedArray = 3
# ourArray = [1,2]
```

### shift() - remove first
```
var ourArray = [1,2,3]
var removedArray = ourArray.shift()
# removedArray = 1
# ourArray = [2,3]
```

### unshift() - append first
```
var ourArray = [1,2,3]
ourArray.unshift("happy")
# ourArray = ["happy", 1,2,3]
```

### function
```
function ourReuseFunction(a, b) {
  return a - b;
}

ourReuseFunction(1, 2);
ourReuseFunction(3, 4);
```

### Global scope / local scope, global var / local var

In function, local var is priority than global var if have same name

If do not have `return` in function, function will return `undefined`

### Condition

```
if (var < 10) {

} else if (var < 15) {

} else {

}
```

```
# switch
switch(val) {
  case 1:
    answer = "one";
    break;
  case 2:
    answer = "two";
    break;
  default:
    answer = "zero";
    break;
}
```

### Object

```
var ourDog = {
  "name": "abc", # name is property
  "legs": 4,
  "friends": ["everything"]
}

# Access property:
ourDog.name
ourDog.legs

var testObj = {
  "an egg": "hamburger",
  "my side": "abc",
  19: "dddd"
}
# access using bracket notation
testObj["an egg"]
testObj["my side"]
testObj[19]
```

### Delete property in object

```
var testObj = {
  "x": 1,
  "y": 2
}
delete testObj.x
```

### Copy object

```
var testObj = {}

copyObj = JSON.parse(JSON.stringify(testObj));
```

### const vs let vs var
const and let is from ES2015

- `var`: can has affect in outer block, can allow duplicate declare variable
- `let`: can set value , can not allow duplicate declare variable, and has limit in scope, can not affect in outer block 
- `const`: all feature of let and read only

### Prevent object mutation

```
const MATH_CONSTANT = { PI: 3.14 }
Object.freeze(MATH_CONSTANT)
```

### anonymous function

is function without name

```
var anonymous = function() {
  return new Date();
}
```

`Arrow function`:
```
var magic = () => {
  return new Date();
}
var magic = () => new Date();
```

### Higher Order Arrow Function
map, filter

```
# default argument
const increment = (function () {
  return function increment(number, value = 1) {
    return number + value;
  };
})();

increment(5, 2);
increment(5);

# Rest Operator
convert all number ...args to array args
function sum(...args) {
  console.log(args) => array
}

# Spread Operator
can use to copy object / array
arr2 = [...arr1] // arr2 is equal all content arr1

# Destructing Assignment
const obj = { x: 1, y: 2, z: 3 }
const { x: a, y: b, z: c } = obj;
=> a = 1, b = 2, c = 3

# String Literals:
const abc = `hello ${var}`

# Simple fields
const createPerson = (name, age, gender) => ({ name, age, gender });
same as 
return {
  name: name,
  age: age,
  gender: gender
}

# Write concise declarative function
const bicycle = {
  gear: 2,
  setGear: function(newGear) {
    this.gear = newGear;
  }
}
=> 
const bicycle = {
  gear: 2,
  setGear(newGear) {
    this.gear = newGear;
  }
}
```

### Class and object

```
class Hello {
  constructor(newValue) {
    this.value = newValue;
  }
}

or

var Hello = function(newValue) {
  this.value = newValue;
}
var hello = new Hello();
hello.value
```

### Difference import and export file

```
# function.js
export const myFunction = do something;

# index.js
import { myFunction } from "./function";

const hello = myFunction();

# syntax
const myFunction = do something;
export { myFunction }
export const var1 = 1;

# import all from file
import * as object from "./file"

# default export
export default function adding(){ return 1 }

# default import
import adding from "./file"
```

### Event JS

```
# addEventListener
element.addEventListener(event_name, function, useCapture);

# removeEventListener
element.removeEventListener(event_name, function, useCapture);
```

### Element node:

- `window.getComputedStyle(element)`
- root node (document)
- root element (html)
- `createElement()`
- `appendChild()`
- `insertBefore()`
- `replaceChild()`
- `removeChild()`

### polifill

### Animation

- `setInterval` | `clearInterval`

```
function myMove() {
  var element = document.getElementById("id");
  var pos = 0;
  var id = setInterval(frame, 10);
  
  function frame() {
    if (pos == 350) {
      clearInterval(id);
    } else {
      pos++;
      element.style.top = pos + 'px';
      element.style.left = pos + 'px';
    }
  }
}
```

### `window` object

- support by all browser
- all element, variable, function global is member of `window` object, even document
ex: `document` global is implied by `window.document`

```
window.innerWidth
window.innerHeight
window.addEventListener(event, handler);
window.open("http://google.com");
```

### popup box js

all is part of window object
```
alert("alert thing")

confirm("confirm") => return boolean

prompt("message", "default text input")
```

### data storage

|  | Cookies | Local Storage | Session Storage |
|--|---------|---------------|-----------------|
| Capacity | 4kb | 10MB | 5 MB|
| Browsers | HTML4 / HTML5 | HTML5 | HTML5 |
| Accessible from | Any window | Any window | Same tab |
| Expires | Manually set | Never | On tab close |
| Storage Location | Browser and server | Browser only | Browser only |
| Sent with requests | Yes | No | No |

```
localStorage.setItem("key", "value");
localStorage.getItem("key")
localStorage.removeItem("key")
localStorage.clear()

sessionStorage.setItem("key", "value");
sessionStorage.getItem("key")

document.cookie = "key=value; expires=; path=/;";
# delete cookie
document.cookie = "key=;"
```
