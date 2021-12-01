%{
/* Definitions section */
#include "source.tab.hpp"
#include "output.hpp"
#include "source.hpp"
%}

%option yylineno
%option noyywrap

positiveDigit   ([1-9])
digit           ([0-9])
hexdigit        ([0-9A-F])
letter          ([a-zA-Z])
whitespace      ([\t\n\r ])
printable       ([\x20-\x7E]|whitespace)
escapeSequence  ((\[\"nrt0])|(\xdigitdigit))
savedWord (void|int|byte|b|bool|and|or|not|true|false|return|if|else|while|break|continue)
savedOperator (;|,|\(|\)|\{|\}|=)
relop (==|!=|<|>|<=|>=)
binop (\+|\-|\*|\/)


%%
void
int
byte
b
bool
const
and
or
not
true
false
return
if
else
while
break
continue
;
,
\(
\)
\{
\}
=
{relop}
{binop}
[a-zA-Z][a-zA-Z0-9]*
0|[1-9][0-9]*
\"([^\n\r\"\\]|\\[rnt\"\\])+\"
 /* Rules section*/
