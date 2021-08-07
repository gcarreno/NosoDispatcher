unit Noso.Core.Messages;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
, Contnrs
, Noso.Core.Message
;

type
{ TMessages }
  TMessages = class(TObject)
  private
    FMessages: TFPObjectList;

    function GetCount: Integer;
    function GetMessage(AIndex: Integer): TMessage;
    procedure SetMessage(AIndex: Integer; AValue: TMessage);
  protected
  public
    constructor Create;
    destructor Destroy; override;

    { #todo 100 -ogcarreno : Implement GetEnumerator }

    function Add(const AMessage: TMessage): Integer;
    procedure Delete(const AIndex: Integer);
    procedure Delete(const AMessage: TMessage);

    property Count: Integer
      read GetCount;
    property Items[Index: Integer]: TMessage
      read GetMessage
      write SetMessage; default;
  published
  end;

  { #todo 100 -ogcarreno : Implement TMessagesEnumerator }

implementation

{ TMessages }

function TMessages.GetCount: Integer;
begin
  Result:= FMessages.Count;
end;

function TMessages.GetMessage(AIndex: Integer): TMessage;
begin
  Result:= FMessages.Items[AIndex] as TMessage;
end;

procedure TMessages.SetMessage(AIndex: Integer; AValue: TMessage);
begin
  if FMessages.Items[AIndex] = AValue then exit;
  FMessages.Items[AIndex]:= AValue;
end;

function TMessages.Add(const AMessage: TMessage): Integer;
begin
  Result:= FMessages.Add(AMessage);
end;

procedure TMessages.Delete(const AIndex: Integer);
begin
  FMessages.Delete(AIndex);
end;

procedure TMessages.Delete(const AMessage: TMessage);
begin
  FMessages.Delete(FMessages.IndexOf(AMessage));
end;

constructor TMessages.Create;
begin
  FMessages:= TFPObjectList.Create(True);
end;

destructor TMessages.Destroy;
begin
  FMessages.Free;
  inherited Destroy;
end;

end.

