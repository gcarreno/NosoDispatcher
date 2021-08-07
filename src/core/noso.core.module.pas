unit Noso.Core.Module;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
;

type
{ TModuleEvent }
  TModuleEvent = procedure(const AMessage: String) of object;
{ TModule }
  TModule = class(TObject)
  private
    FName: String;
    FOnModuleEvent: TModuleEvent;
  protected
  public
    constructor Create;
    destructor Destroy; override;

    property Name: String
      read FName
      write FName;
    property OnModuleEvent: TModuleEvent
      read FOnModuleEvent
      write FOnModuleEvent;
  published
  end;

implementation

{ TModule }

constructor TModule.Create;
begin
  FName:= EmptyStr;
  FOnModuleEvent:= nil;
end;

destructor TModule.Destroy;
begin
  inherited Destroy;
end;

end.

