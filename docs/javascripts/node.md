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

