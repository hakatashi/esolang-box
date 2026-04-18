Require Import Coq.Lists.List.
Require Import Io.All.
Require Import Io.System.All.
Require Import ListString.All.

Import ListNotations.
Import C.Notations.

Definition cat (argv : list LString.t) : C.t System.effect unit :=
  let! line := System.read_line in
  match line with
  | None => ret tt
  | Some line => System.log (line)
  end.

Definition main := Extraction.launch cat.
