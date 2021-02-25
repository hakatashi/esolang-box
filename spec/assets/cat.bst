ENTRY
{
   input
}{}{}

FUNCTION {source}
{
   input write$
   % Caution: newline$ is required, or nothing will be printed (input write$ will be ignored)
   newline$
}

FUNCTION {default.type} { source }

READ

ITERATE {call.type$}
