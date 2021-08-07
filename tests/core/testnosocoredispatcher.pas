unit TestNosoCoreDispatcher;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
//, testutils
, testregistry
, Noso.Core.Dispatcher
;

type

  { TTestNosoCoreDispatcher }

  TTestNosoCoreDispatcher= class(TTestCase)
  private
    FDispatcher: TDispatcher;

    procedure CheckFieldsCreate;
  protected
  public
  published
    procedure TestNosoCoreDispatcherCreate;
  end;

implementation

procedure TTestNosoCoreDispatcher.CheckFieldsCreate;
begin
  //
end;

procedure TTestNosoCoreDispatcher.TestNosoCoreDispatcherCreate;
begin
  FDispatcher:= TDispatcher.Create;
  CheckFieldsCreate;
  FDispatcher.Free;
end;



initialization
  RegisterTest(TTestNosoCoreDispatcher);
end.

