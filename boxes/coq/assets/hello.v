From Stdlib Require Import String.
From Stdlib Require Import ExtrOcamlNativeString.

Open Scope string_scope.

Parameter println : string -> unit.
Extract Constant println => "print_endline".

Definition main (_ : unit) : unit :=
  println "Hello, World!".

Extraction "main" main.
