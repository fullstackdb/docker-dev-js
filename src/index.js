//HERE
/*
it's just a template for speed-up the boilerplate code
in the ifElse we should write three similiar blocks:
leftFunction.apply(null, arguments)
rightFunction.apply(null, arguments)
predicateFunction.apply(null, arguments)

so I decided to use anonymous function with short name "ap"
*/

// so "f" stands for function, "r" for result?? to understand..... "null" - error...? I assume.... ehhh
// yea it's like call() but works with arrays and multiple values, but I haven't used it in practice...
//, Do you know what's the apply?

//sure
// Now, you will use it)))) It's an example where we can use it and how
//

// OHH now I start understanding a bit.... big time.... what's null though?
// Be patient my friend,
// The first argument in the apply used for setting the context for the function.
// We don't need any context in the functions, so just put 'null'
// You MUST never use the keyword `this` in the functions.

//so lets move our code together
//got it

/*
ifElse consume 3 parameters, these parameters are functions,
we use only functions.
first function is a predicate function which should return a boolean value
the second argument is a "left" function
it's a common name for the functions which process the errors, bad cases, etc.
the third argument is a "right" function
This function will be called when the predicate returns "true".
BUT? Maybe, u want ask me. WHY WE SHOULD USE FUNCTIONS?
aaa, got,

// Firstly, I don't understand the purpose of const ap
//
*/
const ap = (f, args) => f.apply(null, args)
const ifElse => (predicate, left, right) => (...args) => ap(predicate, args) ? ap(right, args) : ap(left, args);
// let's continue
// The main idea to functional way of programming is
// to make code more versatile and readeable against speed(((
// just see my rewriting and try to read code as article in the magazine
// ?

// ok, so ifElse function is the main one, so to speak, right? - Yes

const greaterThanThree = (value) => value > 3
const writeGoodMessage = (value) => console.log(`this is a good message with a ${value}`)
const writeBadMessage = (value) => console.log(`this is a bad message with a ${value}`)
const evaluator = ifElse(
    greaterThanThree,
    writeGoodMessage,
    writeBadMessage,
)
// AND REUSABILITY, see
// you can requse greaterThanThree everywhere,
// you can reuse writeBadMessage, writeGoodMessage as well, This
// functions also pass the arguments,
// evaluator function also reusable.
//I start understanding it. The readability thing. Got it. I'm gonna copy this code

// the const evaluator - this style of formatting - in the new lines - this is how it's normally done? breaking into 3
// lines instead of all in one? {
//    asdf,
//    asdf,
//    asdf,
//    }
// ??? cause I noticed this tendency in React app development. just curious

// In the react apps we pass the object as one argument,
// and use destruction in the function.
// If we pass the object we won't be able to do carrying) easily.
// React it's React. Fuck the React)
// got it. this is cool stuff.

evaluator(0) // Otherwise this will be printed: ${value} is a shit
evaluator(3) // Otherwise this will be printed: ${value} is a shit
evaluator(4) // This will be printed when value greater than 3
//@HERE ARE YOU HERE?
// yes. but I don't understand much to be honest....


//I'll put a lot of comments
var http = require('http');

const PORT = 8080; // Non-standard HTTP port
// const PORT 80; // Standard HTTP port

function handleRequest(request, response) {
  console.log(request.headers);
  response.end('It Works!! Path Hit: ' + request.url);
}

var server = http.createServer(handleRequest);
server.listen(PORT, function() {
  console.log("Server listening on: http://localhost:%s", PORT);
});
