ENTRY
{
   input
}{}{}

FUNCTION {source}
{
   "Hello, World!" write$
   newline$
}

FUNCTION {default.type} { source }

READ

ITERATE {call.type$}
