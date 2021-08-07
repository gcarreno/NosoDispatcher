unit TestNosoCoreMessage;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
//, testutils
, testregistry
, Noso.Core.Message
;

type
{ TTestNosoCoreMessage }
  TTestNosoCoreMessage= class(TTestCase)
  private
    FMessage: TMessage;

    procedure CheckFieldsCreate;
  protected
  public
  published
    procedure TestNosoCoreMessageCreate;
  end;

implementation

{ TTestNosoCoreMessage }

procedure TTestNosoCoreMessage.CheckFieldsCreate;
begin
  AssertEquals('Noso Core Message Originator is empty', EmptyStr, FMessage.Originator);
  AssertEquals('Noso Core Message Destinatary is empty', EmptyStr, FMessage.Destinatary);
  AssertEquals('Noso Core Message Content is empty', EmptyStr, FMessage.Content);
end;

procedure TTestNosoCoreMessage.TestNosoCoreMessageCreate;
begin
  FMessage:= TMessage.Create;
  CheckFieldsCreate;
  FMessage.Free;
end;

initialization
  RegisterTest(TTestNosoCoreMessage);
end.

