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
                sourceQuery : TFdQuery;
                memTable : tfdmemtable;
                tbl開始日,tbl最終日 : TDate;
                開始日,終了日 : TDate;       // 分析期間
                WhereToken_タスク : string;
                WhereToken_種類 : string;
                WhereToken_優先 : string;
                条件 : string;
                debug : Boolean;
                constructor create(conn: TFDConnection; query,query_source: TFDQuery; memTbl : TFDMemTable);
                destructor Destroy; override;
                procedure setDBPath;
                function doSQL(sql文: string): boolean;
                procedure createMemTable4Graph;
                procedure 日付セット(開始日, 終了日: TDateTime);
                procedure 曜日セット;
                procedure 発生件数計算(fldNm: String);
                procedure 完了件数計算(fldNm: String);
                procedure 条件での発生件数計算(条件,日付FldNm,書き込みFldNm:String);
                procedure 条件での完了件数計算(条件,fldNm: String);
                function createWhereToken_タスク(eGov, eLaws, performance,
                  reasonkakugiinfraother: boolean): String;
                function createWhereToken_種類(bug, kadai, qa, moushiokurimemo : boolean): string;
                function createWhereToken_優先(SS, A, B, B1, B2B3C: boolean): string;
                function sqlWhere条件作成FromUI : string;
                procedure getTbl開始最終日;
                procedure setInitialdata2Table;
                procedure 件数蓄積計算(対象FldNm, 蓄積FldNm: string);
                procedure 件数計算(条件sql, 書き込みFldNm: string);
                procedure 完了期間計算;
                procedure 条件合致レコードで指定Field値の合計日々まとめ(条件,日付FldNm,指定Fldnm,書き込みFldNm:String);
                procedure UI上の条件変更に基づくテーブルデータ設定;
                procedure フィルターフラグによる期間設定(開始日,終了日: TDate) ;
                procedure ソーステーブル更新;
              end;

implementation

uses Main;

procedure log(s:string);
begin
  MainForm.log(s);
end;

function get曜日(mon_start:Boolean; youbi_no:Integer):String;
var
    youbi_array: array[1..8] of String;
begin
    youbi_array[1] := '日';
    youbi_array[2] := '月';
    youbi_array[3] := '火';
    youbi_array[4] := '水';
    youbi_array[5] := '木';
    youbi_array[6] := '金';
    youbi_array[7] := '土';
    youbi_array[8] := '日'; //月曜始まり専用
    if mon_start then begin
        youbi_no := youbi_no +1;
    end;
    Result := youbi_array[youbi_no];
end;

function TissueAnalizerBz.sqlWhere条件作成FromUI : string;
　 function strip括弧(s : string) : string;
   begin
     result := trim(StringReplace(s,'()','',[]));
   end;
var
  条件,句 : string;
begin
   log('=D=> SQLWhere条件作成');
   条件 := '';
   句 :=  self.WhereToken_タスク;
   if strip括弧(句) <> '' then begin
      if 条件 = '' then
        条件 :=  句 else
        条件 :=  条件+ ' and '+句;
   end;
   句 :=  self.WhereToken_種類;
   if strip括弧(句) <> '' then begin
      if 条件 = '' then
        条件 :=  句 else
        条件 :=  条件+ ' and '+句;
   end;
   句 :=  self.WhereToken_優先;
   if strip括弧(句) <> '' then begin
      if 条件 = '' then
        条件 :=  句 else
        条件 :=  条件+ ' and '+句;
   end;
   result := 条件;
end;

function TissueAnalizerBz.doSQL(sql文: string) : boolean;
var
  ccV : integer;
  recs : integer;
begin
  result := true;
  try
  　query.Close;
    query.SQL.Clear;
    query.SQL.Add(sql文);
    query.Open;
    query.FetchAll;
    query.First;
    if Pos('as cc',sql文) > 0 then begin
       ccV := 0;
       if not query.FieldByName('cc').isNull then
          ccV := query.FieldByName('cc').AsInteger;
    end;
    recs := query.RecordCount;
    log('=D=> SQL実行OK:'+sql文+#9+'行数='+recs.ToString+'件'+#9+'cc値='+ccv.ToString);
  except
    on e:Exception do begin
      log('=E=> SQL失敗　'+sql文+#13#10+e.Message);
      result := False;
    end;
  end;
end;

constructor TissueAnalizerBz.Create(conn: TFDConnection; query,query_source: TFDQuery; memTbl : TFDMemTable);
begin
        inherited Create;
        self.conn := conn;
        self.query := query;
        self.sourceQuery := query_source;
        //self.memTable := memtbl;
        // 初期値
        self.debug := False;
        dbPath :='c:\temp\backlogbug.db';　
        var iniFn := ExtractFilePath(ParamStr(0))+'app.ini';
        if FileExists(iniFn) then begin
          ini := TIniFile.Create(iniFn);
          dbPath := ini.ReadString('main','dbpath','c:\temp\backlogbug.db');
          var d := ini.ReadString('main','debug','False');
          if d = 'False' then self.debug := False else self.debug := True;
        end;
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
  memTable := TFdMemTable.Create(nil);
  with memTable do begin
    fieldDefs.Add('id',ftInteger,0,True);
    fieldDefs.Add('noDisplayFlg',ftBoolean,0,false);
    fieldDefs.Add('date',TFieldType.ftDate,0,False);
    fieldDefs.Add('weekday',ftString,16,false);
    fieldDefs.Add('createdCountofTable',ftInteger,0,false);                // テーブル全体での発生・完了数 ・日々
    fieldDefs.Add('completedCountofTable',ftInteger,0,false);
    fieldDefs.Add('sumofcreatedCountOnDay',ftInteger,0,false);             // テーブル全体での発生・完了数 ・累積
    fieldDefs.Add('sumofcompletedCountonDay',ftInteger,0,false);
    fieldDefs.Add('sumUncompletedCountonTheDay',ftInteger,0,false);

    fieldDefs.Add('createdCountonCondition',ftInteger,0,false);           // 条件での発生・完了数・日々
    fieldDefs.Add('completedCountOnCondition',ftInteger,0,false);
    fieldDefs.Add('sumOfCreated_ConditionByD',ftInteger,0,false);
    fieldDefs.Add('sumOfCompleted_ConditionByD',ftInteger,0,false);        // 条件での発生・完了数・累積
    fieldDefs.Add('sumUncompletedOnConditionTheDay',ftInteger,0,false);

    fieldDefs.Add('completedPeriodonCondition',ftInteger,0,false);          // 所要期間・日々での平均
    fieldDefs.Add('completedPeriodonUntilTheDay',ftInteger,0,false);        // 所要期間・その日までの平均

    fieldDefs.Add('value_1',ftInteger,0,false);                          // work
    fieldDefs.Add('value_2',ftInteger,0,false);
    fieldDefs.Add('value_3',ftInteger,0,false);
    fieldDefs.Add('value_4',ftInteger,0,false);
    fieldDefs.Add('value_5',ftInteger,0,false);
    fieldDefs.Add('value_6',ftInteger,0,false);
  end;
end;

procedure TissueAnalizerBz.日付セット(開始日,終了日: TDateTime);
var
  i,days : integer;
begin
  log('=D=> 日付セット');
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

procedure TIssueAnalizerBz.曜日セット;
var
  day : TDateTime;
  曜日 : string;
begin
  log('=D=> 曜日セット');
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     曜日 := get曜日(False,DayOfWeek(day));
     memTable.Edit;
     memTable.FieldByName('weekday').AsString := 曜日;
     memTable.Post;
     memTable.Next;
  end;
end;

procedure TIssueAnalizerBz.件数計算(条件sql,書き込みFldNm:string);
var
  発生件数 : integer;
begin
     doSQL(条件SQL);
     if query.FieldByName('cc').IsNull then
       発生件数 := 0
     else
       発生件数 := query.FieldByName('cc').AsInteger;
     memTable.edit;
     memTable.FieldByName(書き込みFldNm).AsInteger := 発生件数;
     memTable.post;
end;

procedure TissueAnalizerBz.発生件数計算(fldNm:String);
var
  day : TDateTime;
  day_ : String;
  sql : string;
begin
  log('=D=> 発生件数計算');
  if fldNm = ''  then fldNm := 'value_1';
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day); day_ := copy(day_,1,10)+'%';
     sql := 'select count(*) as cc from issueTbl where created like "'+day_+'";';
     件数計算(sql,fldNm);
     memTable.Next;
  end;
end;

procedure TissueAnalizerBz.完了件数計算(fldNm:String);
var
  day : TDateTime;
  day_ : String;
  sql : string;
begin
  log('=D=> 完了件数計算');
  if fldNm = '' then fldNm := 'value_2';

  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day); day_ := copy(day_,1,10)+'%';
     sql := 'select count(*) as cc from issueTbl where completed like "'+day_+'";';
     件数計算(sql,fldNm);
     memTable.Next;
  end;
end;

procedure TissueAnalizerBz.条件での発生件数計算(条件,日付FldNm,書き込みFldNm:String);
var
  day : TDateTime;
  day_ : String;
  sql : string;
begin
  log('=D=> 条件での発生件数計算');
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day); day_ := copy(day_,1,10)+'%';
     if 条件 <> '' then
         sql := 'select count(*) as cc from issueTbl where '+日付FldNm+' like "'+day_+'" and ('+条件+');'
     else
         sql := 'select count(*) as cc from issueTbl where '+日付FldNm+' like "'+day_+'";';
     件数計算(sql,書き込みfldNm);
     memTable.Next;
  end;
end;

procedure TissueAnalizerBz.条件合致レコードで指定Field値の合計日々まとめ(条件,日付FldNm,指定Fldnm,書き込みFldNm:String);
var
  day : TDateTime;
  day_ : String;
  sql : string;
begin
  log('=D=> 条件合致レコードで指定Field値の合計日々まとめ');
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day); day_ := copy(day_,1,10)+'%';
     if 条件 <> '' then
       sql := 'select sum('+指定Fldnm+') as cc from issueTbl where '+日付FldNm+' like "'+day_+'" and ('+条件+');'
     else
       sql := 'select sum('+指定Fldnm+') as cc from issueTbl where '+日付FldNm+' like "'+day_+'";';
     件数計算(sql,書き込みfldNm);
     memTable.Next;
  end;
end;

procedure TissueAnalizerBz.条件での完了件数計算(条件,fldNm:String);
var
  day : TDateTime;
  day_ : String;
  sql : string;
begin
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day); day_ := copy(day_,1,10)+'%';
     if 条件 <> '' then
       sql := 'select count(*) as cc from issueTbl where completed like "'+day_+'" and ('+条件+');'
     else
       sql := 'select count(*) as cc from issueTbl where completed like "'+day_+'";';
     件数計算(sql,fldNm);
     memTable.Next;
  end;
end;

function TissueAnalizerBz.createWhereToken_タスク(eGov,eLaws,performance,reasonkakugiinfraother: boolean): String;
var
  isAll : boolean;
  token : string;
begin
 result := '';
 WhereToken_タスク := '';
 isAll := eGOv and eLaws and performance and reasonkakugiinfraother;
 if isAll then exit;  // where token不要

 if eGov then begin
   token := '((taskKind = "01.e-Gov/e-LAWS") or (taskKind = "02.e-Gov"))';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if eLaws then begin
   token := '((taskKind = "01.e-Gov/e-LAWS") or (taskKind = "03.e-LAWS"))';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if performance then begin
   token := '(taskKind = "04.性能")';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if reasonkakugiinfraother then begin
   token := '((taskKind = "05.理由") or (taskKind = "06.閣議") or (taskKind = "07.環境") or (taskKind = "99.その他") or (taskKind = ""))';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 WhereToken_タスク := result;
end;

function TissueAnalizerBz.createWhereToken_種類(bug,kadai,qa,moushiokurimemo:boolean): string;
var
  isAll : boolean;
  token : string;
begin
 result := '';
 WhereToken_種類 := '';
 isAll := bug and kadai and qa and moushiokurimemo;
 if isAll then exit;  // where token不要

 if bug then begin
   token := '(issueType = "バグ")';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if kadai then begin
   token := '(issueType = "課題")';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if qa then begin
   token := '(issueType = "質問")';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if moushiokurimemo then begin
   token := '((issueType = "申し送り") or (issueType = "メモ") or (issueType = ""))';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 WhereToken_種類 := result;
end;

function TissueAnalizerBz.createWhereToken_優先(SS,A,B,B1,B2B3C: boolean): string;
var
  isAll : boolean;
  token : string;
begin
 result := '';
 WhereToken_優先 := '';
 isAll := SS and A and B and B1 and B2B3C;
 if isAll then exit;  // where token不要

 if SS then begin
   token := '(prioS = "SS")';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if A then begin
   token := '(prioS = "A")';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if B then begin
   token := '(prioS = "B")';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
  if B1 then begin
   token := '(prioS = "B1")';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 if B2B3C then begin
   token := '((prioS = "B2") or (prioS = "B3") or (prioS = "C") or (prioS = ""))';
   if result = '' then
      result := token else
      result := result + ' OR '+ token;
 end;
 result := '('+result+')';
 WhereToken_優先 := result;
end;

procedure TissueAnalizerBz.getTbl開始最終日;
var
  sql : string;
begin
  log('=D=> getTbl開始最終日');
  sql := 'select min(created) as dd from issueTbl';
  doSQL(sql);
  self.tbl開始日 := query.FieldByName('dd').AsDateTime;
  sql := 'select max(updated) as dd from issueTbl';
  doSQL(sql);
  self.tbl最終日 := query.FieldByName('dd').AsDateTime;
end;

procedure TissueAnalizerBz.件数蓄積計算(対象FldNm, 蓄積FldNm: string);
var
  発生件数,蓄積件数 : integer;
begin
  log('=D=> 件数蓄積計算');
  蓄積件数:= 0;
  memTable.First;
  while not memTable.eof do begin
     発生件数 := memTable.FieldByName(対象FldNm).AsInteger;
     蓄積件数 := 蓄積件数+発生件数;
     memTable.edit;
     memTable.FieldByName(蓄積FldNm).AsInteger := 蓄積件数;
     memTable.post;
     memTable.Next;
  end;
end;

procedure TIssueAnalizerBz.完了期間計算;
var
  条件 : string;
begin
  log('=D=> 完了期間計算');
  // 各日完了タスクの完了期間日数合計(条件付き)セット  (value_3)
  // 日々の完了した条件付きタスクの期間日数合計
  条件 := sqlWhere条件作成FromUI;
  条件合致レコードで指定Field値の合計日々まとめ(条件,'completed','wholePeriod','value_3');
  // 各日完了タスクの件数(条件付き)セット   (value_4)
  // 日々の完了した条件付きタスク件数
  条件での発生件数計算(条件,'completed','value_4');
  // 各日の完了タスクの平均完了期間日数(条件付き)セット  (completedPeriodCondition)
  log('=D=> 各日の完了タスクの平均完了期間日数(条件付き)セット');
  memTable.First;
  while not memTable.eof do begin
     var 総期間 := memTable.FieldByName('valUe_3').AsInteger;
     var 発生件数 := memTable.FieldByName('value_4').AsInteger;
     var 平均完了期間 := 0;
     if 発生件数 > 0 then
        平均完了期間 := round(総期間 / 発生件数);
     memTable.edit;
     memTable.FieldByName('completedPeriodOnCondition').AsInteger := 平均完了期間;
     memTable.post;
     memTable.Next;
  end;

  // 日々まで完了タスクの蓄積・完了期間日数(条件付き) セット (value_5)
  件数蓄積計算('value_3','value_5');
  // 日々までの完了タスクの蓄積・完了件数(条件付き)セット(value_6)
  件数蓄積計算('value_4','value_6');

  // 日々まで完了タスクの平均完了期間日数(条件付き) セット (completedPeriodonUntilTheDay)
  log('=D=> 日々まで完了タスクの平均完了期間日数(条件付き) セット');
  memTable.First;
  while not memTable.eof do begin
     var 蓄積総期間 := memTable.FieldByName('valUe_5').AsInteger;
     var 蓄積発生件数 := memTable.FieldByName('value_6').AsInteger;
     var 平均完了期間 := 0;
     if 蓄積発生件数 > 0 then
        平均完了期間 := round(蓄積総期間 / 蓄積発生件数);
     memTable.edit;
     memTable.FieldByName('completedPeriodonUntilTheDay').AsInteger := 平均完了期間;
     memTable.post;
     memTable.Next;
  end;
end;

procedure TIssueAnalizerBz.ソーステーブル更新;
var
 sql : string;
begin
  if 条件 = '' then
     sql := 'select * from issueTbl'
  else
     sql := 'select * from issueTbl where '+条件;
  SourceQuery.Close;
  SourceQuery.SQL.Clear;
  SourceQuery.SQL.Add(sql);
  SourceQuery.Open;
  SourceQuery.FetchAll;
  SourceQuery.First;
end;

procedure TIssueAnalizerBz.UI上の条件変更に基づくテーブルデータ設定;
begin
 log('=D=> UI上の条件変更に基づくテーブルデータ設定');
 // 条件付き発生日
 条件 := sqlWhere条件作成FromUI;
 条件での発生件数計算(条件,'created','createdCountOnCondition');
 // 　　　蓄積
 件数蓄積計算('createdCountOnCondition','sumOfCreated_ConditionByD');
 // 条件付き完了日
 条件での発生件数計算(条件,'completed','completedCountOnCondition');
 //       蓄積
 件数蓄積計算('completedCountOnCondition','sumOfCompleted_ConditionByD');
 log('=D=> 条件課題の未完了件数計算');
  memTable.First;
  while not memTable.eof do begin
     var 発生件数蓄積 := memTable.FieldByName('sumOfCreated_ConditionByD').AsInteger;
     var 完了件数蓄積 := memTable.FieldByName('sumOfCompleted_ConditionByD').AsInteger;
     memTable.edit;
     memTable.FieldByName('sumUncompletedOnConditionTheDay').AsInteger :=  発生件数蓄積-完了件数蓄積;
     memTable.post;
     memTable.Next;
  end;
 // タスク平均日数計算
 完了期間計算;
end;

procedure TissueAnalizerBz.フィルターフラグによる期間設定(開始日,終了日: TDate) ;
var
  日付 : TDate;
  noDisplayflg : boolean;
begin
  memTable.Filtered := False;
  memTable.First;
  while not memTable.eof do begin
     日付 := memTable.FieldByName('date').AsDateTime;
     noDisplayflg := True;
     if dateinRange(日付,開始日,終了日) then begin
       noDisplayFlg := False;
     end;
     memTable.edit;
     memTable.FieldByName('noDisplayFlg').AsBoolean :=  noDisplayflg;
     memTable.post;
     memTable.Next;
  end;
  memTable.Filter := 'noDisplayFlg = False';
  memTable.Filtered := True;
end;

procedure TissueAnalizerBz.setInitialdata2Table;
begin
// テーブルを空にする。
 if assigned(memTable) then begin
 　log('=D=> free memtable');
   memTable.Active := False;
   freeandnil(memTable);
 end;
 log('=D=> create memtable');
 memTable := TFDMemTable.Create(nil);
 createMemTable4Graph;
 memTable.Active := True;
 //memTable.Active := False;
 //memTable.Active := True;
 //memTable.EmptyDataSet;

 getTbl開始最終日;
 日付セット(tbl開始日,tbl最終日);  // 日付のセット
 曜日セット;
 発生件数計算('createdCountofTable');                                  // 発生件数: 発生日
 完了件数計算('completedCountofTable');                                //            報告日
 件数蓄積計算('createdCountOfTable','sumOfCreatedCountOnDay');         // 蓄積件数: 発生日
 件数蓄積計算('completedCountOfTable','sumOfCompletedCountOnDay');     //            報告日
 // 未完了件数計算 (完了蓄積件数 - 発生件数蓄積)
 log('=D=> 未完了件数計算');
  memTable.First;
  while not memTable.eof do begin
     var 発生件数蓄積 := memTable.FieldByName('sumOfCreatedCountOnDay').AsInteger;
     var 完了件数蓄積 := memTable.FieldByName('sumOfCompletedCountOnDay').AsInteger;
     memTable.edit;
     memTable.FieldByName('sumUncompletedCountOnTheDay').AsInteger :=  発生件数蓄積-完了件数蓄積;
     memTable.post;
     memTable.Next;
  end;
  UI上の条件変更に基づくテーブルデータ設定;
  log('=D=> setInitialdata2Table完了');
end;

end.
