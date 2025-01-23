with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

package body Assgn is
   use Ada.Text_IO;
   use Ada.Integer_Text_IO;

   -- Random number generator for binary values
   package Random_Binary is new Ada.Numerics.Discrete_Random(BINARY_NUMBER);
   Gen : Random_Binary.Generator;

   procedure Init_Array (Arr: in out BINARY_ARRAY) is
   begin
      Random_Binary.Reset(Gen);
      -- Generate smaller numbers to avoid overflow
      for I in 1..8 loop
         Arr(I) := 0;
      end loop;
      for I in 9..16 loop
         Arr(I) := Random_Binary.Random(Gen);
      end loop;
   end Init_Array;

   procedure Print_Bin_Arr (Arr : in BINARY_ARRAY) is
   begin
      for I in Arr'Range loop
         if I > 1 then
            Put(" ");
         end if;
         Put(BINARY_NUMBER'Image(Arr(I)));
      end loop;
      New_Line;
   end Print_Bin_Arr;

   procedure Reverse_Bin_Arr (Arr : in out BINARY_ARRAY) is
      Temp : BINARY_NUMBER;
   begin
      for I in 1..Arr'Length/2 loop
         Temp := Arr(I);
         Arr(I) := Arr(Arr'Last - I + 1);
         Arr(Arr'Last - I + 1) := Temp;
      end loop;
   end Reverse_Bin_Arr;

   function Int_To_Bin(Num : in INTEGER) return BINARY_ARRAY is
      Result : BINARY_ARRAY := (others => 0);
      Temp : INTEGER := abs(Num);
      Index : Integer := Result'Last;
   begin
      while Temp > 0 and Index >= Result'First loop
         Result(Index) := BINARY_NUMBER(Temp mod 2);
         Temp := Temp / 2;
         Index := Index - 1;
      end loop;
      return Result;
   end Int_To_Bin;

   function Bin_To_Int (Arr : in BINARY_ARRAY) return INTEGER is
      Result : INTEGER := 0;
      Power : INTEGER := 1;
   begin
      for I in reverse Arr'Range loop
         if Arr(I) = 1 then
            Result := Result + Power;
         end if;
         if I > 1 then  -- Prevent overflow on last iteration
            Power := Power * 2;
         end if;
      end loop;
      return Result;
   end Bin_To_Int;

   function "+" (Left, Right : in BINARY_ARRAY) return BINARY_ARRAY is
      Result : BINARY_ARRAY := (others => 0);
      Carry : BINARY_NUMBER := 0;
      Sum : INTEGER;
   begin
      for I in reverse Result'Range loop
         Sum := INTEGER(Left(I)) + INTEGER(Right(I)) + INTEGER(Carry);
         Result(I) := BINARY_NUMBER(Sum mod 2);
         Carry := BINARY_NUMBER(Sum / 2);
      end loop;
      return Result;
   end "+";

   function "+" (Left : in INTEGER;
                 Right : in BINARY_ARRAY) return BINARY_ARRAY is
   begin
      return Int_To_Bin(Left) + Right;
   end "+";

   function "-" (Left, Right : in BINARY_ARRAY) return BINARY_ARRAY is
      Result : BINARY_ARRAY := (others => 0);
      Borrow : BINARY_NUMBER := 0;
      Temp : INTEGER;
   begin
      for I in reverse Result'Range loop
         Temp := INTEGER(Left(I)) - INTEGER(Right(I)) - INTEGER(Borrow);
         if Temp < 0 then
            Temp := Temp + 2;
            Borrow := 1;
         else
            Borrow := 0;
         end if;
         Result(I) := BINARY_NUMBER(Temp);
      end loop;
      return Result;
   end "-";

   function "-" (Left : in INTEGER;
                 Right : in BINARY_ARRAY) return BINARY_ARRAY is
   begin
      return Int_To_Bin(Left) - Right;
   end "-";

begin
   Random_Binary.Reset(Gen);  -- Initialize random generator
end Assgn;