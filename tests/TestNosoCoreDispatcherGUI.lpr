program TestNosoCoreDispatcherGUI;

{$mode objfpc}{$H+}

uses
  Interfaces
, Forms
, GuiTestRunner
, TestNosoCoreDispatcher
, TestNosoCoreMessages
, TestNosoCoreMessage
, TestNosoCoreModules
, TestNosoCoreModule
;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.

