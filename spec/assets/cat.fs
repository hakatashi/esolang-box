open System

[<EntryPoint>]
let main argv =
    let eof h = 
        match h with
        | null -> false
        | _ -> true
    let seqGen _ = Console.ReadLine()
    Seq.initInfinite seqGen
    |> Seq.takeWhile eof
    |> Seq.iter Console.WriteLine
    0

