unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Registry;

type
  TForm2 = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TBitBtn;
    Memo1: TMemo;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    procedure RegWriteBinary;
    procedure RegReadBinary;
  public
    { Public declarations }
    RegOldname : string;
  end;

var
  Form2: TForm2;
  changedvalue : boolean;

implementation

{$R *.DFM}

uses Unit1;
procedure RaiseWin32Error(Code: Cardinal);
var
  Error: EWin32Error;
begin
{$IFDEF MSWINDOWS}
  Error := EWin32Error.CreateResFmt(@Error, [Code, SysErrorMessage(Code)]);
{$ENDIF}
  Error.ErrorCode := Code;
  raise Error;
end;

procedure TForm2.RegReadBinary;
var
  Reg: TRegistry;
  DataType: Cardinal;
  DataSize: Cardinal;
  Res: Integer;
  Str: String;
  i: Integer;
begin
  Reg := TRegistry.Create;
  try
    case Form1.ComboBox1.ItemIndex of
    0 : Reg.RootKey := HKEY_CLASSES_ROOT;
    1 : Reg.RootKey := HKEY_CURRENT_USER;
    2 : Reg.RootKey := HKEY_LOCAL_MACHINE;
    3 : Reg.RootKey := HKEY_USERS;
    4 : Reg.RootKey := HKEY_CURRENT_CONFIG;
    end;

    if not Reg.OpenKeyReadOnly('\Software\Test\RegMultiSzTest') then
      raise Exception.Create('Can not open key');
    DataSize := 0;
    Res := RegQueryValueEx(
      Reg.CurrentKey,          // handle of key to query
      PWideChar(Form1.found),  // address of name of value to query
      nil,                     // reserved
      @DataType,               // address of buffer for value type
      nil,                     // address of data buffer
      @DataSize);              // address of data buffer size
    if Res <> ERROR_SUCCESS then
      RaiseWin32Error(Res);
    if DataType <> REG_BINARY then
      raise Exception.Create('Wrong data type');
    SetLength(Str, DataSize - 1);
    if DataSize > 1 then begin
      Res := RegQueryValueEx(
        Reg.CurrentKey,         // handle of key to query
        PWideChar(Form1.found), // address of name of value to query
        nil,                    // reserved
        @DataType,              // address of buffer for value type
        PByte(Str),             // address of data buffer
        @DataSize);             // address of data buffer size
      if Res <> ERROR_SUCCESS then
        RaiseWin32Error(Res);
    end;

    for i := Length(Str) downto 1 do
      if Str[i] = #0 then
        Str[i] := #13;
    ShowMessage(Str);
  finally
    Reg.Free;
  end;
end;

procedure TForm2.RegWriteBinary;
var
  Reg: TRegistry;
  Res: Integer;
  str : string;
begin
  str := Memo1.Lines.Text+#13;
  Reg := TRegistry.Create;
  try

    case Form1.ComboBox1.ItemIndex of
    0 : Reg.RootKey := HKEY_CLASSES_ROOT;
    1 : Reg.RootKey := HKEY_CURRENT_USER;
    2 : Reg.RootKey := HKEY_LOCAL_MACHINE;
    3 : Reg.RootKey := HKEY_USERS;
    4 : Reg.RootKey := HKEY_CURRENT_CONFIG;
    end;

    if not Reg.OpenKey(Form1.Edit1.Text, true) then
      raise Exception.Create('Can not open key');

    if Caption = 'Rename value' then begin
      Reg.RenameValue(RegOldname, Edit1.Text);
    end else begin

    Res := RegSetValueEx(
      Reg.CurrentKey,        // handle of key to set value for
      PWideChar(Edit1.Text), // address of value to set
      0,                     // reserved
      REG_BINARY,            // flag for value type
      PWideChar(str),        // address of value data
      Length(Str)+1);        // size of value data

    end;

    if Res <> ERROR_SUCCESS then
      RaiseWin32Error(Res);
  finally
    Reg.Free;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
   ComboBox1.ItemIndex := 0;
end;

procedure TForm2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ComboBox1.Enabled:=true;
end;

procedure TForm2.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
   key := #0;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex = 4 then begin
    Memo1.Enabled := true;
    Label4.Enabled := true;
    Edit2.Enabled := false;
    Label3.Enabled := false;
  end else begin
    Memo1.Enabled := false;
    Label4.Enabled := false;
    Edit2.Enabled := true;
    Label3.Enabled := true;
  end;
end;

procedure TForm2.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   key:=0;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  intnull, intvalue : integer;
begin
   if ComboBox1.ItemIndex = 4 then
   begin
    try
      Edit2.Text := '0';
      RegWriteBinary;
    except
    end;
    Form2.Close;
   end;

   if Edit1.Text='' then begin
      MessageDlg('Please enter the value name!',mtInformation,[mbOk],0);
      Edit1.SetFocus;
      exit;
   end;
   if (ComboBox1.text='Integer') or (ComboBox1.text='DWORD-Value (32-Bit)') then begin
        val(Edit2.text,intnull,intvalue);
        if intvalue <> 0 then begin
           Messagedlg('"'+Edit2.text+'" is not a valid integer value!',mtError,[mbOk],0);
           Edit2.clear;
           Edit2.setfocus;
           exit;
        end
   end;
   changedvalue := true;
   Form2.Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if (ComboBox1.text='Integer') or (ComboBox1.text='DWORD-Value (32-Bit)') then begin
      if key  in ['0'..'9',#8] then
      else key:=#0;
   end
end;

procedure TForm2.Edit2Change(Sender: TObject);
var
  i : integer;
begin
   if (ComboBox1.text='Integer') or (ComboBox1.text='DWORD-Value (32-Bit)') then begin
       for i:=1 to length(Edit2.text) do
         if Edit2.text[i] in ['0'..'9',#8] then
         else begin
         Edit2.text:='';
         break end;
   end
end;

end.
