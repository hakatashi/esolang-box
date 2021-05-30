with Ada.Text_IO; use Ada.Text_IO;

procedure Cat is
begin
   loop
      declare
      S : String := Get_Line;
      begin
      exit when S = "";
      Put_Line (S);
   end;
   end loop;
end;
