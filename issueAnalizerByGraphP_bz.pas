﻿unit issueAnalizerByGraphP_bz;

interface

uses
FireDAC.Stan.Intf, IniFiles, System.SysUtils, system.DateUtils,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, uniGUIBaseClasses, uniEdit,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf;

type
        TissueAnalizerBz = class
        public
                dbpath : string;
                ini : TIniFile;
                conn : tfdconnection;
                query : tfdquery;
                memTable : tfdmemtable;
                開始日,終了日 : TDate;
                constructor create(conn: TFDConnection; query: TFDQuery; memTbl : TFDMemTable);
                destructor Destroy; override;
                procedure setDBPath;
                function doSQL(sql文: string): boolean;
                procedure createMemTable4Graph;
                procedure 日付セット(開始日, 終了日: TDateTime);
                procedure 発生件数計算;
                procedure 完了件数計算;
              end;

implementation

uses Main;

procedure log(s:string);
begin
  MainForm.log(s);
end;

function TissueAnalizerBz.doSQL(sql文: string) : boolean;
begin
  result := true;
  try
  　query.Close;
    query.SQL.Clear;
    query.SQL.Add(sql文);
    query.IndexFieldNames := '';
    query.Open;
    query.FetchAll;
    query.First;
    log('=I=> SQL実行OK:'+sql文);
  except
    on e:Exception do begin
      log('=E=> SQL失敗　'+sql文+#13#10+e.Message);
      result := False;
    end;
  end;
end;

constructor TissueAnalizerBz.Create(conn: TFDConnection; query: TFDQuery; memTbl : TFDMemTable);
begin
        inherited Create;
        self.conn := conn;
        self.query := query;
        self.memTable := memtbl;
        ini := TIniFile.Create('app.ini');
        dbPath := ini.ReadString('main','dbpath','c:\temp\backlogbug.db');
end;

destructor TissueAnalizerBz.Destroy;
begin
        inherited Destroy;
        ini.Free;
end;

procedure TissueAnalizerBz.setDBPath;
begin
  conn.Connected :=False;
  conn.Params.values['Database'] := dbPath;
  conn.Connected := True;
  doSQL('select * from issueTbl');
end;

procedure TissueAnalizerBz.createMemTable4Graph;
begin
  with memTable do begin
    fieldDefs.Add('id',ftInteger,0,True);
    fieldDefs.Add('date',TFieldType.ftDate,0,False);
    fieldDefs.Add('value_1',ftInteger,0,false);
    fieldDefs.Add('value_2',ftInteger,0,false);
    fieldDefs.Add('value_3',ftInteger,0,false);
    fieldDefs.Add('value_4',ftInteger,0,false);
    fieldDefs.Add('value_5',ftInteger,0,false);
  end;
end;

procedure TissueAnalizerBz.日付セット(開始日,終了日: TDateTime);
var
  i,days : integer;
begin
  self.開始日 := 開始日;
  self.終了日 := 終了日;
  days := daysbetween(終了日,開始日);
  memTable.Open;
  memTable.EmptyDataSet;
  for i := 0 to days do begin
    memTable.Append;
    memTable.FieldByName('id').AsInteger := i+1;
    memTable.fieldbyName('date').AsDateTime := 開始日+i;
    memTable.post;
  end;
end;

procedure TissueAnalizerBz.発生件数計算;
var
  day : TDateTime;
  day_ : String;
  sql : string;
  発生件数 : integer;
begin
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day);
     day_ := copy(day_,1,10)+'%';
     sql := 'select count(*) as cc from issueTbl where created like "'+day_+'";';
     doSQL(sql);
     発生件数 := query.FieldByName('cc').AsInteger;
     memTable.edit;
     memTable.FieldByName('value_1').AsInteger := 発生件数;
     memTable.post;
     memTable.Next;
  end;
end;

procedure TissueAnalizerBz.完了件数計算;
var
  day : TDateTime;
  day_ : String;
  sql : string;
  発生件数 : integer;
begin
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day);
     day_ := copy(day_,1,10)+'%';
     sql := 'select count(*) as cc from issueTbl where completed like "'+day_+'";';
     doSQL(sql);
     発生件数 := query.FieldByName('cc').AsInteger;
     memTable.edit;
     memTable.FieldByName('value_2').AsInteger := 発生件数;
     memTable.post;
     memTable.Next;
  end;
end;

end.
