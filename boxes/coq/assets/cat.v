Definition main (_ : unit) : unit :=
  match read_line_opt tt with
  | None => tt
  | Some line => println line
  end.
