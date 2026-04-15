with Ada.Text_IO; use Ada.Text_IO;
with Ada.IO_Exceptions;

procedure Program is
begin
   loop
      declare
         S : String := Get_Line;
      begin
         Put_Line (S);
      exception
         when Ada.IO_Exceptions.End_Error => exit;
      end;
   end loop;
end Program;
