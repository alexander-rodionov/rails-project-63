



// 1. Undeclared global variable (no-var, no-undef)
myGlobal = 'I am global pollution';

// 2. Using var instead of const/let (no-var)
var x = 10;
var y = 20;



// 3. Reassigning const (no-const-assign)
const PI = 3.14;
PI = 3.14159;  // Oops!

// 4. Unused variable (no-unused-vars)
const unusedVar = 'Why am I here?';

// 5. Missing semicolons (semi)
function add(a, b) {
  return a + b
}

// 6. == instead of === (eqeqeq)
if (x == '10') {
  console.log('Loose equality! Bad!')
}

// 7. Block-scoped function (no-inner-declarations)
if (true) {
  function innerFunc() {
    console.log('I should not exist here!')
  }
}

// 8. Inconsistent quotes (quotes)
const badQuotes = "Double quotes are fine, but project uses single quotes";

// 9. Trailing spaces (no-trailing-spaces)
const trailingSpace = 'Look at me!    ';  

// 10. console.log left in code (no-console)
console.log('Debugging leftover');

// 11. Unreachable code (no-unreachable)
function unreachableExample() {
  return 'I am done';
  console.log('I will never run!');
}

// 12. Comma dangle (comma-dangle)
const terribleArray = [
  1,
  2,
  3,  // Extra comma (forbidden in some styles)
];

// 13. Inconsistent indentation (indent)
function messyIndent() {
console.log('2 spaces? 4 spaces? Who cares!');
  console.log('This line is indented differently');
}

// 14. Arrow function with confusing body (implicit-arrow-linebreak)
const messyArrow = () => 
  'This arrow function has weird line breaks';

// 15. Duplicate keys in object (no-dupe-keys)
const badObject = {
  key: 1,
  key: 2,  // Duplicate key!
};

// 16. Missing default in switch (default-case)
switch (x) {
  case 10:
    console.log('No default case!');
}

// 17. Unary operators misuse (no-plusplus)
for (let i = 0; i < 10; i++) {
  x += i;
}

// 18. Nested ternary (no-nested-ternary)
const nestedTernary = x > 5 ? y < 15 ? 'A' : 'B' : 'C';

// 19. Shadowing variable (no-shadow)
let shadowed = 1;
function shadowExample() {
  let shadowed = 2;  // Shadows outer variable
}

// 20. eval (no-eval)
eval('console.log("Dangerous eval!")');

