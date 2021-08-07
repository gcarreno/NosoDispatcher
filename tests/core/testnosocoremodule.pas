unit TestNosoCoreModule;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
//, testutils
, testregistry
, Noso.Core.Module
;

type
{ TTestNosoCoreModule }
  TTestNosoCoreModule= class(TTestCase)
  private
    FModule: TModule;

    procedure CheckFieldsCreate;
  protected
  public
  published
    procedure TestNosoCOreModuleCreate;
  end;

implementation

{ TTestNosoCoreModule }

procedure TTestNosoCoreModule.CheckFieldsCreate;
begin
  AssertEquals('Noso Core Module Name is empty', EmptyStr, FModule.Name);
  //AssertNull('Noso Core Module OnModuleEvent is null', FModule.OnModuleEvent);
end;

procedure TTestNosoCoreModule.TestNosoCOreModuleCreate;
begin
  FModule:= TModule.Create;
  try
    CheckFieldsCreate;
  finally
    FModule.Free;
  end;
end;

initialization
  RegisterTest(TTestNosoCoreModule);
end.

