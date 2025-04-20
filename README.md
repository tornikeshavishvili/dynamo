# DynamoLang

DynamoLang is a domain-specific language that allows you to write code in a more natural language syntax. It transforms this natural language-like code into executable JavaScript.

## Philosophy & Goal

DynamoLang is designed with a declarative programming approach, focusing on **what** should be accomplished rather than **how** it should be done. The primary goal is to enable developers to express their intent in a more natural way, describing desired outcomes without getting bogged down in implementation details.

By abstracting away the "how" and focusing on the "what," DynamoLang aims to:
- Make programming more accessible to domain experts
- Reduce cognitive load by eliminating boilerplate code
- Allow developers to focus on business logic rather than syntax
- Bridge the gap between natural language requirements and code implementation

## Features

- **Natural Language Syntax**: Write code that reads closer to English prose
- **Module Imports**: Import JavaScript modules using simple syntax
- **Function Definitions**: Define functions with descriptive names and parameters
- **Variable Assignment**: Assign values to variables using intuitive syntax
- **Function Calls**: Call functions in a more readable way

## Project Structure

- `allnatural.peggy`: Grammar rules for parsing DynamoLang
- `grammar.js`: Compiled grammar from allnatural.peggy
- `index.js`: Main entry point that processes DynamoLang files
- `parsedResult.js`: Output JavaScript file from the parsed DynamoLang
- `context.js`: Common utility functions used by DynamoLang programs
- `sample.dynamo`: Example DynamoLang code

## Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/dynamolang.git
cd dynamolang
```

2. Install dependencies:

```bash
npm install
```

## Usage

1. Write your DynamoLang code in a `.dynamo` file (see `sample.dynamo` for example)

2. Run the parser:

```bash
npm start
```

This will:
- Compile the grammar (from `allnatural.peggy` to `grammar.js`)
- Parse your DynamoLang code (from `sample.dynamo` to JavaScript)
- Execute the resulting JavaScript

To run a specific DynamoLang file, modify the `index.js` to read from your file.

## Syntax Examples

### Importing Modules

```
use ./path/to/module module as moduleName
```

### Defining Functions

```
describe function name {param1} {param2}. start:
    // function body here
end:
```

### Assigning Variables

```
assign variableName to call functionName {param1}.
```

### Calling Functions

```
call functionName {param1} {param2}.
```

Or in sentence style:

```
function name with {param1} and {param2}.
```

## Development

- Modify `allnatural.peggy` to change the grammar rules
- Use `npm run compile-grammar` to compile the grammar file
- Run `npm test` to test changes

## Contributing

DynamoLang is an open project welcoming contributions from the community. We're looking for contributors who are passionate about making programming more intuitive and accessible.

Ways to contribute:
- Enhance the grammar to support more natural language constructs
- Add new features and functionality to the language
- Improve documentation and provide more examples
- Report bugs and suggest improvements
- Write tests to ensure language stability
- Share use cases and feedback from real-world applications

To contribute:
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Join us in shaping the future of more intuitive programming!

## License

ISC

## Author

[Your Name]
