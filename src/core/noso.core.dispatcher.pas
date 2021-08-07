unit Noso.Core.Dispatcher;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, syncobjs
, Noso.Core.Messages
//, Noso.Core.Message
, Noso.Core.Modules
, Noso.Core.Module
;

type
{ TDispatcher }
  TDispatcher = class(TObject)
  private
    FCriticalSection: TCriticalSection;
    FMessages: TMessages;
    FModules: TModules;
  protected
  public
    constructor Create;
    destructor Destroy; override;

    procedure RegisterModule(
      const AName:String;
      const AModuleEvent: TModuleEvent
    );
    { #todo 100 -ogcarreno : Implement addition of messages }
  published
  end;

implementation

{ TDispatcher }

procedure TDispatcher.RegisterModule(
  const AName: String;
  const AModuleEvent: TModuleEvent
);
var
  module: TModule;
begin
  FCriticalSection.Enter;
  try
    { #todo 90 -ogcarreno : Maybe make sure to not register twice? }
    module:= TModule.Create;
    module.Name:= AName;
    module.OnModuleEvent:= AModuleEvent;
    FModules.Add(module);
  finally
    FCriticalSection.Leave;
  end;
end;

constructor TDispatcher.Create;
begin
  FCriticalSection:= TCriticalSection.Create;
  FMessages:= TMessages.Create;
  FModules:= TModules.Create;
end;

destructor TDispatcher.Destroy;
begin
  FModules.Free;
  FMessages.Free;
  FCriticalSection.Free;
  inherited Destroy;
end;

end.

