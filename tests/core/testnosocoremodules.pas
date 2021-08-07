unit TestNosoCoreModules;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
//, testutils
, testregistry
, Noso.Core.Modules
;

type
{ TTestNosoCoreModules }
  TTestNosoCoreModules= class(TTestCase)
  private
    FModules: TModules;

    procedure CheckFieldsCreate;
  protected
  public
  published
    procedure TestNosoCoreModulesCreate;
  end;

implementation

{ TTestNosoCoreModules }

procedure TTestNosoCoreModules.CheckFieldsCreate;
begin
  AssertEquals('Noso Core Modules Count is 0', 0, FModules.Count);
end;

procedure TTestNosoCoreModules.TestNosoCoreModulesCreate;
begin
  FModules:= TModules.Create;
  try
    CheckFieldsCreate;
  finally
    FModules.Free;
  end;
end;

initialization
  RegisterTest(TTestNosoCoreModules);
end.

