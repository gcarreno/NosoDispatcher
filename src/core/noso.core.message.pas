unit Noso.Core.Message;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
;

type
{ TMessage }
  TMessage = class(TObject)
  private
    FOriginator: String;
    FDestinatary: String;
    FContent: String;
  protected
  public
    constructor Create;
    destructor Destroy; override;

    property Originator: String
      read FOriginator
      write FOriginator;
    property Destinatary: String
      read FDestinatary
      write FDestinatary;
    property Content: String
      read FContent
      write FContent;
  published
  end;

implementation

{ TMessage }

constructor TMessage.Create;
begin
  FOriginator:= EmptyStr;
  FDestinatary:= EmptyStr;
  FCOntent:= EmptyStr;
end;

destructor TMessage.Destroy;
begin
  //
  inherited Destroy;
end;

end.

