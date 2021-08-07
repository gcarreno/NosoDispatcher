unit TestNosoCoreMessages;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
//, testutils
, testregistry
, Noso.Core.Messages
, Noso.Core.Message
;

type

{ TTestNosoCoreMessages }
  TTestNosoCoreMessages= class(TTestCase)
  private
    FMessages: TMessages;
    FMessage: TMessage;

    procedure CheckFieldsCreate;
    procedure CheckFieldsOneMessage;
  protected
  public
  published
    procedure TestNosoCoreMessagesCreate;
    procedure TestNosoCoreMessagesOneMessage;
  end;

implementation

{ TTestNosoCoreMessages }

procedure TTestNosoCoreMessages.CheckFieldsCreate;
begin
  AssertEquals('Noso Core Messages Count is 0', 0, FMessages.Count);
end;

procedure TTestNosoCoreMessages.CheckFieldsOneMessage;
begin
  AssertEquals('Noso Core Messages Count is 1', 1, FMessages.Count);
  AssertSame('Noso Core Message is same', FMessage, FMessages[0]);
end;

procedure TTestNosoCoreMessages.TestNosoCoreMessagesCreate;
begin
  FMessages:= TMessages.Create;
  try
    CheckFieldsCreate;
  finally
    FMessages.Free;
  end;
end;

procedure TTestNosoCoreMessages.TestNosoCoreMessagesOneMessage;
begin
  FMessages:= TMessages.Create;
  try
    FMessage:= TMessage.Create;
    FMessages.Add(FMessage);
    CheckFieldsOneMessage;
  finally
    FMessages.Free;
  end;
end;

initialization
  RegisterTest(TTestNosoCoreMessages);
end.

