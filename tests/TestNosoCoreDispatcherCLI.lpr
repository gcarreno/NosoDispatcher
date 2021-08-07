program TestNosoCoreDispatcherCLI;

{$mode objfpc}{$H+}

uses
  Classes
, consoletestrunner
, TestNosoCoreDispatcher
, TestNosoCoreMessages
, TestNosoCoreMessage
, TestNosoCoreModules
, TestNosoCoreModule
;

type

  { TMyTestRunner }

  TMyTestRunner = class(TTestRunner)
  protected
  // override the protected methods of TTestRunner to customize its behavior
  end;

var
  Application: TMyTestRunner;

begin
  Application := TMyTestRunner.Create(nil);
  Application.Initialize;
  Application.Title:='TestNosoCoreDispatcherCLI';
  Application.Run;
  Application.Free;
end.
