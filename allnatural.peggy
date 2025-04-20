

main
  = whitespace? uses:use* code:(  assignVar / definePrompt / functionCall  / sentence / whitespace)+ whitespace? 
  { 
    return uses.join('\n')+'function main() {\n' + code.join('\n') + '} main();' ; 
  }


use
    = whitespace? 'use' whitespace? modulePath:path whitespace? 'module'  whitespace? 'as'  whitespace? moduleName:word whitespace?  
    { 
      return 'const ' + moduleName.val + ' = require("'+modulePath.val+'");' 
    } 

definePrompt
  = whitespace? 'describe' whitespace header:sentence whitespace 'start:' whitespace? body:(assignVar / functionCall / sentence / whitespace)+ whitespace? 'end:' whitespace?
  { 
    header = 'function ' + header.replace(';','');
    return header + '{\n' + body.join('\n') + '}';
  }

assignVar
  = whitespace? 'assign' whitespace varName:word whitespace 'to' whitespace value:(functionCall / sentence )
  {return 'let ' + varName.val + ' = ' + value  }

sentence
  =  whitespace? contextName:('from' whitespace word)? whitespace? words:(word / param / whitespace)+ whitespace? '.'  
  { 
    var funcName = words.filter(w=>w.type=='word').map(w=>w.val).join('');
    var params = words.filter(w=>w.type=='param').map(w=>w.val).join(',');

    if (contextName) {
      funcName = contextName[2].val + '.' + funcName;
    }

    return funcName + '(' + params + ');' 
  }


functionCall
  = whitespace? contextName:('from' whitespace word)? whitespace? 'call' whitespace ('function' whitespace)? functionName:word whitespace* params:( param whitespace?)* whitespace? '.'
  { 
    if (contextName) {
      functionName = contextName[2].val + '.' + functionName.val;
    }else{
      functionName = functionName.val;
    }
    return  functionName + '(' + params.map(pr=>pr[0].val).join(',') + ');' 
}

path
  = word:[a-zA-Z_0-9/\\.]+
  { return {type:'word', val:word.join('')}; }
  
word
  = word:[a-zA-Z_0-9]+
  { return {type:'word', val:word.join('')}; }

param
 = '{' whitespace? param:([a-zA-Z_0-9'"./\\ ]+) whitespace? '}'
  { return {type:'param', val:param.join('')}; }

whitespace
  = whitespace:[ \t\n\r]+ {
    return '';
  }

