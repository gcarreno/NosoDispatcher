unit Noso.Core.Modules;

{$mode ObjFPC}{$H+}

interface

uses
  Classes
, SysUtils
, Contnrs
, Noso.Core.Module
;

type
{ TModules }
  TModules = class(TObject)
  private
    FModules: TFPObjectList;
    function GetCount: Integer;
    function GetModule(AIndex: Integer): TModule;
    procedure SetModule(AIndex: Integer; AValue: TModule);
  protected
  public
    constructor Create;
    destructor Destroy; override;

    { #todo 100 -ogcarreno : Implement GetEnumerator }

    function Add(const AModule: TModule): Integer;
    procedure Delete(const AIndex: Integer); overload;
    procedure Delete(const AModule: TModule); overload;

    property Count: Integer
      read GetCount;
    property Items[Index: Integer]: TModule
      read GetModule
      write SetModule; default;
  published
  end;

  { #todo 100 -ogcarreno : Implement TModulesEnumerator }

implementation

{ TModules }

function TModules.GetCount: Integer;
begin
  Result:= FModules.Count;
end;

function TModules.GetModule(AIndex: Integer): TModule;
begin
  Result:= FModules.Items[AIndex] as TModule;
end;

procedure TModules.SetModule(AIndex: Integer; AValue: TModule);
begin
  if FModules.Items[AIndex] = AValue then exit;
  FModules.Items[AIndex]:= AValue;
end;

function TModules.Add(const AModule: TModule): Integer;
begin
  Result:= FModules.Add(AModule);
end;

procedure TModules.Delete(const AIndex: Integer);
begin
  FModules.Delete(AIndex);
end;

procedure TModules.Delete(const AModule: TModule);
begin
  FModules.Delete(FModules.IndexOf(AModule));
end;

constructor TModules.Create;
begin
  FModules:= TFPObjectList.Create(True);
end;

destructor TModules.Destroy;
begin
  FModules.Free;
  inherited Destroy;
end;

end.

