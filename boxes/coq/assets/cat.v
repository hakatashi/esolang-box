From Stdlib Require Import String.
From Stdlib Require Import ExtrOcamlNativeString.

Open Scope string_scope.

Parameter println : string -> unit.
Parameter read_line_opt : unit -> option string.
Extract Constant println => "print_endline".
Extract Constant read_line_opt =>
  "(fun () -> try Some (input_line stdin) with End_of_file -> None)".

Definition main (_ : unit) : unit :=
  match read_line_opt tt with
  | None => tt
  | Some line => println line
  end.

Extraction "main" main.
