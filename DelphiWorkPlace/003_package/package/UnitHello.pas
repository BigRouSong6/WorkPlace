UNIT UnitHello;

INTERFACE

USES
  Vcl.Dialogs;


//package过程案例

PROCEDURE HelloWorld(StrContent: STRING);
//package函数案例

FUNCTION GetHelloWorld(StrContent: STRING): STRING;
//package类案例

TYPE
  Tuse = CLASS
  PUBLIC
    FUNCTION Add(num1, num2: Integer): Integer;
  END;

IMPLEMENTATION

PROCEDURE HelloWorld(StrContent: STRING);
BEGIN
  ShowMessage(StrContent);
END;

FUNCTION GetHelloWorld(StrContent: STRING): STRING;
BEGIN
  Result := StrContent;
END;

{ Tuse }

FUNCTION Tuse.Add(num1, num2: Integer): Integer;
BEGIN
  Result := num1 + num2;
END;

END.

