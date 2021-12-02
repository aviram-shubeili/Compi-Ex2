%{
/* Definitions section */
#include "source.tab.hpp"
#include "output.hpp"
#include "source.hpp"
%}

%option yylineno
%option noyywrap

relop (==|!=|<|>|<=|>=)
binop (\+|\-|\*|\/)


%%
void                                                       { return VOID;                                  }
int                                                        { return INT;                                   }
byte                                                       { return BYTE;                                  }
b                                                          { return B;                                     }
bool                                                       { return BOOL;                                  }
const                                                      { return CONST;                                 }
and                                                        { return AND;                                   }
or                                                         { return OR;                                    }
not                                                        { return NOT;                                   }
true                                                       { return TRUE;                                  }
false                                                      { return FALSE;                                 }
return                                                     { return RETURN;                                }
if                                                         { return IF;                                    }
else                                                       { return ELSE;                                  }
while                                                      { return WHILE;                                 }
break                                                      { return BREAK;                                 }
continue                                                   { return CONTINUE;                              }
;                                                          { return SC;                                    }
,                                                          { return COMMA;                                 }
\(                                                         { return LPAREN;                                }
\)                                                         { return RPAREN;                                }
\{                                                         { return LBRACE;                                }
\}                                                         { return RBRACE;                                }
=                                                          { return ASSIGN;                                }
{relop}                                                    { yylval = new Relop(yytext); return RELOP;     }
{binop}                                                    { yylval = new Binop(yytext); return BINOP;     }
[a-zA-Z][a-zA-Z0-9]*                                       { yylval = new ID(yytext); return ID;           }
0|[1-9][0-9]*                                              { yylval = new Num(yytext); return NUM;         }
\"([^\n\r\"\\]|\\[rnt\"\\])+\"                             { yylval = new String(yytext); return STRING;   }
 /* Rules section*/
