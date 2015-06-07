unit Rafiqaz_XItkj2_tugaspd5_unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, ExtCtrls, ZConnection, ZDataset, db;

type

  { TRafiq }

  TRafiq = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    NAMA: TEdit;
    KELAS: TEdit;
    EMAIL: TEdit;
    NIS: TEdit;
    Panel1: TPanel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZQuery2: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Rafiq: TRafiq;

implementation

{$R *.lfm}

{ TRafiq }

procedure TRafiq.Button1Click(Sender: TObject);
begin
  ZQuery2.SQL.Clear;
  try
    ZQuery2.SQL.add('insert into data values("'+NIS.text+'","'+NAMA.text+'","'+KELAS.text+'","'+EMAIL.text+'")');
    ZQuery2.ExecSQL;
    Showmessage('Berhasil');
  except
    showmessage('Gagal');
  end;
  ZQuery1.refresh;
end;

procedure TRafiq.Button2Click(Sender: TObject);
begin
  ZQuery2.SQL.Clear;
  try
    ZQuery2.SQL.add('update data set NIS="'+NIS.text+'",NAMA="'+NAMA.text+'",KELAS="'+KELAS.text+'",EMAIL="'+EMAIL.text+'" WHERE NIS="'+NIS.Text+'"');
    ZQuery2.ExecSQL;
    Showmessage('Berhasil');
  except
    showmessage('Gagal');
  end;
  ZQuery1.refresh;
end;

procedure TRafiq.Button3Click(Sender: TObject);
var
  QueryResult: Boolean;
  UserString: string;
begin
    if InputQuery('Hapus data', 'Masukan NIS', UserString)
  then
  begin  ZQuery2.SQL.Clear;
     try
     ZQuery2.SQL.Add('delete from data where NIS="'+UserString+'"');
     ZQuery2.ExecSQL;
     Showmessage('Berhasil dihapus');
     except
       showmessage('Gagal menghapus data. Periksa kembali!');
     end;
     ZQuery1.Refresh end
  else
  begin
  end
end;

procedure TRafiq.Button4Click(Sender: TObject);
begin
  application.terminate;
end;

end.

