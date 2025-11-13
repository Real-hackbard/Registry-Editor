unit Unit1;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
 System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
 Vcl.ComCtrls, Vcl.Shell.ShellCtrls, System.Win.Registry, Vcl.ExtCtrls,
 ImgList, Menus, IniFiles, System.ImageList, Vcl.StdCtrls,
 ShellApi, StrUtils, RegTreeList, Reg_Helper, ClipBrd;

type
  TForm1 = class(TForm)
    ListView2: TListView;
    ImageList1: TImageList;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ListView1: TListView;
    Panel2: TPanel;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    delete1: TMenuItem;
    rename1: TMenuItem;
    N1: TMenuItem;
    New1: TMenuItem;
    N2: TMenuItem;
    PopupMenu2: TPopupMenu;
    Delete2: TMenuItem;
    N4: TMenuItem;
    Modify1: TMenuItem;
    Renamd1: TMenuItem;
    N5: TMenuItem;
    New2: TMenuItem;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Privilegs1: TMenuItem;
    Options1: TMenuItem;
    Edit2: TMenuItem;
    Key1: TMenuItem;
    Value1: TMenuItem;
    NewKey1: TMenuItem;
    Delete3: TMenuItem;
    Rename2: TMenuItem;
    N3: TMenuItem;
    New3: TMenuItem;
    Modify2: TMenuItem;
    Delete4: TMenuItem;
    Rename3: TMenuItem;
    N6: TMenuItem;
    CreateTokenPrivilege1: TMenuItem;
    AssignPrimaryTokenPrivilege1: TMenuItem;
    LockMemoryPrivilege1: TMenuItem;
    IncreaseQuotaPrivilege1: TMenuItem;
    UnsolicitedInputPrivilege1: TMenuItem;
    MachineAccountPrivilege1: TMenuItem;
    cbPrivilege1: TMenuItem;
    SecurityPrivilege1: TMenuItem;
    akeOwnershipPrivilege1: TMenuItem;
    LoadDriverPrivilege1: TMenuItem;
    SystemProfilePrivilege1: TMenuItem;
    SystemtimePrivilege1: TMenuItem;
    ProfileSingleProcessPrivilege1: TMenuItem;
    IncreaseBasePriorityPrivilege1: TMenuItem;
    CreatePagefilePrivilege1: TMenuItem;
    CreatePermanentPrivilege1: TMenuItem;
    BackupPrivilege1: TMenuItem;
    RestorePrivilege1: TMenuItem;
    ShutdownPrivilege1: TMenuItem;
    DebugPrivilege1: TMenuItem;
    AuditPrivilege1: TMenuItem;
    SystemEnvironmentPrivilege1: TMenuItem;
    ChangeNotifyPrivilege1: TMenuItem;
    RemoteShutdownPrivilege1: TMenuItem;
    UndockPrivilege1: TMenuItem;
    N7: TMenuItem;
    About1: TMenuItem;
    SyncAgentPrivilege1: TMenuItem;
    EnableDelegationPrivilege1: TMenuItem;
    ManageVolumePrivilege1: TMenuItem;
    SaveDialog1: TSaveDialog;
    Export2: TMenuItem;
    Edit3: TEdit;
    SaveKey1: TMenuItem;
    N8: TMenuItem;
    Close1: TMenuItem;
    BackupRegistry1: TMenuItem;
    N9: TMenuItem;
    JumpWinReg1: TMenuItem;
    N10: TMenuItem;
    JumpWinReg2: TMenuItem;
    Grid1: TMenuItem;
    CopyPath1: TMenuItem;
    CopyPath2: TMenuItem;
    SavePath1: TMenuItem;
    procedure GetRegistryKeys(const rootkey:word;key:string);
    procedure GetRegistryData(const rootkey:word;key:string);
    procedure ShowRegistryData(name,ndata,datatyp:string);
    procedure FormCreate(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure ListView1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure delete1Click(Sender: TObject);
    procedure rename1Click(Sender: TObject);
    procedure ListView2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Delete2Click(Sender: TObject);
    procedure Renamd1Click(Sender: TObject);
    procedure Modify1Click(Sender: TObject);
    procedure New2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure RefreshKeys(value:string);
    procedure RefreshData(value:string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NewKey1Click(Sender: TObject);
    procedure Delete3Click(Sender: TObject);
    procedure Rename2Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure New3Click(Sender: TObject);
    procedure Modify2Click(Sender: TObject);
    procedure Delete4Click(Sender: TObject);
    procedure Rename3Click(Sender: TObject);
    procedure CreateTokenPrivilege1Click(Sender: TObject);
    procedure AssignPrimaryTokenPrivilege1Click(Sender: TObject);
    procedure LockMemoryPrivilege1Click(Sender: TObject);
    procedure IncreaseQuotaPrivilege1Click(Sender: TObject);
    procedure UnsolicitedInputPrivilege1Click(Sender: TObject);
    procedure MachineAccountPrivilege1Click(Sender: TObject);
    procedure cbPrivilege1Click(Sender: TObject);
    procedure SecurityPrivilege1Click(Sender: TObject);
    procedure akeOwnershipPrivilege1Click(Sender: TObject);
    procedure LoadDriverPrivilege1Click(Sender: TObject);
    procedure SystemProfilePrivilege1Click(Sender: TObject);
    procedure SystemtimePrivilege1Click(Sender: TObject);
    procedure ProfileSingleProcessPrivilege1Click(Sender: TObject);
    procedure IncreaseBasePriorityPrivilege1Click(Sender: TObject);
    procedure CreatePagefilePrivilege1Click(Sender: TObject);
    procedure CreatePermanentPrivilege1Click(Sender: TObject);
    procedure BackupPrivilege1Click(Sender: TObject);
    procedure RestorePrivilege1Click(Sender: TObject);
    procedure ShutdownPrivilege1Click(Sender: TObject);
    procedure DebugPrivilege1Click(Sender: TObject);
    procedure AuditPrivilege1Click(Sender: TObject);
    procedure SystemEnvironmentPrivilege1Click(Sender: TObject);
    procedure ChangeNotifyPrivilege1Click(Sender: TObject);
    procedure RemoteShutdownPrivilege1Click(Sender: TObject);
    procedure UndockPrivilege1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SyncAgentPrivilege1Click(Sender: TObject);
    procedure EnableDelegationPrivilege1Click(Sender: TObject);
    procedure ManageVolumePrivilege1Click(Sender: TObject);
    procedure Export2Click(Sender: TObject);
    procedure SaveKey1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure BackupRegistry1Click(Sender: TObject);
    procedure JumpWinReg1Click(Sender: TObject);
    procedure JumpWinReg2Click(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grid1Click(Sender: TObject);
    procedure CopyPath1Click(Sender: TObject);
    procedure CopyPath2Click(Sender: TObject);
  private
  { Private declarations }
     selkey, keytodelonren, datatodelonren : string;
     lastkey : array[1..25] of string;
     keycount, datacount : integer;
     RegBinary : string;
     WriteBinary : string;
     procedure JumpToKey(Key: string);
     procedure RegReadBinary;
     procedure RegWriteBinary;
     procedure WriteOptions;
    procedure ReadOptions;
  public
    { Public declarations }
    found : string;
  end;

const root_keys:array [0..4] of dword =
         (HKEY_CLASSES_ROOT,HKEY_CURRENT_USER,HKEY_LOCAL_MACHINE,HKEY_USERS,
            HKEY_CURRENT_CONFIG);

var
  Form1: TForm1;
  defaultpath : string;
  rootkeys : integer;
  TIF : TIniFile;

const
  HKEYNames: array[0..6] of string =
    ('HKEY_CLASSES_ROOT', 'HKEY_CURRENT_USER', 'HKEY_LOCAL_MACHINE', 'HKEY_USERS',
    'HKEY_PERFORMANCE_DATA', 'HKEY_CURRENT_CONFIG', 'HKEY_DYN_DATA');

const
  SE_CREATE_TOKEN_NAME = 'SeCreateTokenPrivilege';
  SE_ASSIGNPRIMARYTOKEN_NAME = 'SeAssignPrimaryTokenPrivilege';
  SE_LOCK_MEMORY_NAME = 'SeLockMemoryPrivilege';
  SE_INCREASE_QUOTA_NAME = 'SeIncreaseQuotaPrivilege';
  SE_UNSOLICITED_INPUT_NAME = 'SeUnsolicitedInputPrivilege';
  SE_MACHINE_ACCOUNT_NAME = 'SeMachineAccountPrivilege';
  SE_TCB_NAME = 'SeTcbPrivilege';
  SE_SECURITY_NAME = 'SeSecurityPrivilege';
  SE_TAKE_OWNERSHIP_NAME = 'SeTakeOwnershipPrivilege';
  SE_LOAD_DRIVER_NAME = 'SeLoadDriverPrivilege';
  SE_SYSTEM_PROFILE_NAME = 'SeSystemProfilePrivilege';
  SE_SYSTEMTIME_NAME = 'SeSystemtimePrivilege';
  SE_PROF_SINGLE_PROCESS_NAME = 'SeProfileSingleProcessPrivilege';
  SE_INC_BASE_PRIORITY_NAME = 'SeIncreaseBasePriorityPrivilege';
  SE_CREATE_PAGEFILE_NAME = 'SeCreatePagefilePrivilege';
  SE_CREATE_PERMANENT_NAME = 'SeCreatePermanentPrivilege';
  SE_BACKUP_NAME = 'SeBackupPrivilege';
  SE_RESTORE_NAME = 'SeRestorePrivilege';
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
  SE_DEBUG_NAME = 'SeDebugPrivilege';
  SE_AUDIT_NAME = 'SeAuditPrivilege';
  SE_SYSTEM_ENVIRONMENT_NAME = 'SeSystemEnvironmentPrivilege';
  SE_CHANGE_NOTIFY_NAME = 'SeChangeNotifyPrivilege';
  SE_REMOTE_SHUTDOWN_NAME = 'SeRemoteShutdownPrivilege';
  SE_UNDOCK_NAME = 'SeUndockPrivilege';
  SE_SYNC_AGENT_NAME = 'SeSyncAgentPrivilege';
  SE_ENABLE_DELEGATION_NAME = 'SeEnableDelegationPrivilege';
  SE_MANAGE_VOLUME_NAME = 'SeManageVolumePrivilege';

implementation

uses Unit2, Unit3;

{$WRITEABLECONST ON}
{$R-}
{$Q-}
{$I-}
{$R *.DFM}
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

function MainDir : string;
begin
  // Extract EXE file path
  Result := ExtractFilePath(ParamStr(0));
end;

procedure TForm1.WriteOptions;    // ################### Options Write
var OPT :string;
begin
   OPT := 'Options';

   if not DirectoryExists(MainDir + 'Data\Options\')
   then ForceDirectories(MainDir + 'Data\Options\');

   TIF := TIniFile.Create(MainDir + 'Data\Options\Options.ini');
   with TIF do
   begin
    WriteBool(OPT,'CreateTokenPrivilege',CreateTokenPrivilege1.Checked);
    WriteBool(OPT,'AssignPrimaryTokenPrivilege',AssignPrimaryTokenPrivilege1.Checked);
    WriteBool(OPT,'LockMemoryPrivilege',LockMemoryPrivilege1.Checked);
    WriteBool(OPT,'IncreaseQuotaPrivilege',IncreaseQuotaPrivilege1.Checked);
    WriteBool(OPT,'UnsolicitedInputPrivilege',UnsolicitedInputPrivilege1.Checked);
    WriteBool(OPT,'MachineAccountPrivilege',MachineAccountPrivilege1.Checked);
    WriteBool(OPT,'cbPrivilege',cbPrivilege1.Checked);
    WriteBool(OPT,'SecurityPrivilege',SecurityPrivilege1.Checked);
    WriteBool(OPT,'akeOwnershipPrivilege',akeOwnershipPrivilege1.Checked);
    WriteBool(OPT,'LoadDriverPrivilege',LoadDriverPrivilege1.Checked);
    WriteBool(OPT,'SystemProfilePrivilege',SystemProfilePrivilege1.Checked);
    WriteBool(OPT,'SystemtimePrivilege',SystemtimePrivilege1.Checked);
    WriteBool(OPT,'ProfileSingleProcessPrivilege',ProfileSingleProcessPrivilege1.Checked);
    WriteBool(OPT,'IncreaseBasePriorityPrivilege',IncreaseBasePriorityPrivilege1.Checked);
    WriteBool(OPT,'CreatePagefilePrivilege',CreatePagefilePrivilege1.Checked);
    WriteBool(OPT,'CreatePermanentPrivilege',CreatePermanentPrivilege1.Checked);
    WriteBool(OPT,'BackupPrivilege',BackupPrivilege1.Checked);
    WriteBool(OPT,'RestorePrivilege',RestorePrivilege1.Checked);
    WriteBool(OPT,'ShutdownPrivilege',ShutdownPrivilege1.Checked);
    WriteBool(OPT,'DebugPrivilege',DebugPrivilege1.Checked);
    WriteBool(OPT,'AuditPrivilege',AuditPrivilege1.Checked);
    WriteBool(OPT,'SystemEnvironmentPrivilege',SystemEnvironmentPrivilege1.Checked);
    WriteBool(OPT,'ChangeNotifyPrivilege',ChangeNotifyPrivilege1.Checked);
    WriteBool(OPT,'RemoteShutdownPrivilege',RemoteShutdownPrivilege1.Checked);
    WriteBool(OPT,'UndockPrivilege',UndockPrivilege1.Checked);
    WriteBool(OPT,'SyncAgentPrivilege',SyncAgentPrivilege1.Checked);
    WriteBool(OPT,'EnableDelegationPrivilege',EnableDelegationPrivilege1.Checked);
    WriteBool(OPT,'ManageVolumePrivilege',ManageVolumePrivilege1.Checked);
    WriteBool(OPT,'Grid',Grid1.Checked);
    WriteBool(OPT,'SavePath',SavePath1.Checked);
   Free;
   end;
end;

procedure TForm1.ReadOptions;    // ################### Options Read
var OPT:string;
begin
  OPT := 'Options';
  if FileExists(MainDir + 'Data\Options\Options.ini') then
  begin
  TIF:=TIniFile.Create(MainDir + 'Data\Options\Options.ini');
  with TIF do
  begin
    CreateTokenPrivilege1.Checked:=ReadBool(OPT,'CreateTokenPrivilege',CreateTokenPrivilege1.Checked);
    AssignPrimaryTokenPrivilege1.Checked:=ReadBool(OPT,'AssignPrimaryTokenPrivilege',AssignPrimaryTokenPrivilege1.Checked);
    LockMemoryPrivilege1.Checked:=ReadBool(OPT,'LockMemoryPrivilege',LockMemoryPrivilege1.Checked);
    IncreaseQuotaPrivilege1.Checked:=ReadBool(OPT,'IncreaseQuotaPrivilege',IncreaseQuotaPrivilege1.Checked);
    UnsolicitedInputPrivilege1.Checked:=ReadBool(OPT,'UnsolicitedInputPrivilege',UnsolicitedInputPrivilege1.Checked);
    MachineAccountPrivilege1.Checked:=ReadBool(OPT,'MachineAccountPrivilege',MachineAccountPrivilege1.Checked);
    cbPrivilege1.Checked:=ReadBool(OPT,'cbPrivilege',cbPrivilege1.Checked);
    SecurityPrivilege1.Checked:=ReadBool(OPT,'SecurityPrivilege',SecurityPrivilege1.Checked);
    akeOwnershipPrivilege1.Checked:=ReadBool(OPT,'akeOwnershipPrivilege',akeOwnershipPrivilege1.Checked);
    LoadDriverPrivilege1.Checked:=ReadBool(OPT,'LoadDriverPrivilege',LoadDriverPrivilege1.Checked);
    SystemProfilePrivilege1.Checked:=ReadBool(OPT,'SystemProfilePrivilege',SystemProfilePrivilege1.Checked);
    SystemtimePrivilege1.Checked:=ReadBool(OPT,'SystemtimePrivilege',SystemtimePrivilege1.Checked);
    ProfileSingleProcessPrivilege1.Checked:=ReadBool(OPT,'ProfileSingleProcessPrivilege',ProfileSingleProcessPrivilege1.Checked);
    IncreaseBasePriorityPrivilege1.Checked:=ReadBool(OPT,'IncreaseBasePriorityPrivilege',IncreaseBasePriorityPrivilege1.Checked);
    CreatePagefilePrivilege1.Checked:=ReadBool(OPT,'CreatePagefilePrivilege',CreatePagefilePrivilege1.Checked);
    CreatePermanentPrivilege1.Checked:=ReadBool(OPT,'CreatePermanentPrivilege',CreatePermanentPrivilege1.Checked);
    BackupPrivilege1.Checked:=ReadBool(OPT,'BackupPrivilege',BackupPrivilege1.Checked);
    RestorePrivilege1.Checked:=ReadBool(OPT,'RestorePrivilege',RestorePrivilege1.Checked);
    ShutdownPrivilege1.Checked:=ReadBool(OPT,'ShutdownPrivilege',ShutdownPrivilege1.Checked);
    DebugPrivilege1.Checked:=ReadBool(OPT,'DebugPrivilege',DebugPrivilege1.Checked);
    AuditPrivilege1.Checked:=ReadBool(OPT,'AuditPrivilege',AuditPrivilege1.Checked);
    SystemEnvironmentPrivilege1.Checked:=ReadBool(OPT,'SystemEnvironmentPrivilege',SystemEnvironmentPrivilege1.Checked);
    ChangeNotifyPrivilege1.Checked:=ReadBool(OPT,'ChangeNotifyPrivilege',ChangeNotifyPrivilege1.Checked);
    RemoteShutdownPrivilege1.Checked:=ReadBool(OPT,'RemoteShutdownPrivilege',RemoteShutdownPrivilege1.Checked);
    UndockPrivilege1.Checked:=ReadBool(OPT,'UndockPrivilege',UndockPrivilege1.Checked);
    SyncAgentPrivilege1.Checked:=ReadBool(OPT,'SyncAgentPrivilege',SyncAgentPrivilege1.Checked);
    EnableDelegationPrivilege1.Checked:=ReadBool(OPT,'EnableDelegationPrivilege',EnableDelegationPrivilege1.Checked);
    ManageVolumePrivilege1.Checked:=ReadBool(OPT,'ManageVolumePrivilege',ManageVolumePrivilege1.Checked);
    Grid1.Checked:=ReadBool(OPT,'Grid',Grid1.Checked);
    SavePath1.Checked:=ReadBool(OPT,'SavePath',SavePath1.Checked);
  Free;
  end;
  end;
end;

procedure TForm1.RegWriteBinary;
var
  Reg: TRegistry;
  Res: Integer;
  str : string;
begin
  (* "Binary registry info" can refer to two things: binary data stored
     in the Windows registry or binary registers used in computer hardware.
     In the Windows registry, REG_BINARY is a data type for raw binary data,
     displayed in hexadecimal format, and can be managed using tools like
     regedit or PowerShell. In computer architecture, a binary register is a
     hardware component that uses flip-flops to store bits of data.*)
  str := Form2.Memo1.Lines.Text+#13;
  Reg := TRegistry.Create;
  try
    case Form1.ComboBox1.ItemIndex of
    0 : Reg.RootKey := HKEY_CLASSES_ROOT;
    1 : Reg.RootKey := HKEY_CURRENT_USER;
    2 : Reg.RootKey := HKEY_LOCAL_MACHINE;
    3 : Reg.RootKey := HKEY_USERS;
    4 : Reg.RootKey := HKEY_CURRENT_CONFIG;
    end;

    if not Reg.OpenKey(Edit1.Text, true) then
      raise Exception.Create('Can''t open key');
    Res := RegSetValueEx(
      Reg.CurrentKey,     // handle of key to set value for
      PWideChar(found),   // address of value to set
      0,                  // reserved
      REG_BINARY,         // flag for value type
      PWideChar(str),     // address of value data
      Length(Str)+1);     // size of value data

    if Res <> ERROR_SUCCESS then
      RaiseWin32Error(Res);
  finally
    Form2.Memo1.Text := str;
    Reg.Free;
  end;
end;

procedure TForm1.RegReadBinary;
var
  Reg: TRegistry;
  DataType: Cardinal;
  DataSize: Cardinal;
  Res: Integer;
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

    // Directly reading binary values ​​from the registry.
    if not Reg.OpenKeyReadOnly(Edit1.Text) then
      raise Exception.Create('Can''t open key');
    DataSize := 0;
    Res := RegQueryValueEx(
      Reg.CurrentKey,     // handle of key to query
      PWideChar(found),   // address of name of value to query
      nil,                // reserved
      @DataType,          // address of buffer for value type
      nil,                // address of data buffer
      @DataSize);         // address of data buffer size
    if Res <> ERROR_SUCCESS then
      RaiseWin32Error(Res);

    if DataType <> REG_BINARY then
      raise Exception.Create('Wrong data type');

    SetLength(RegBinary, DataSize - 1);
    if DataSize > 1 then begin
      Res := RegQueryValueEx(
        Reg.CurrentKey,     // handle of key to query
        PWideChar(found),   // address of name of value to query
        nil,                // reserved
        @DataType,          // address of buffer for value type
        PByte(RegBinary),   // address of data buffer
        @DataSize);         // address of data buffer size
      if Res <> ERROR_SUCCESS then
        RaiseWin32Error(Res);
    end;

    for i := Length(RegBinary) downto 1 do
      if RegBinary[i] = #0 then
        RegBinary
        [i] := #13;

    //ShowMessage(Str); // string output when you want
  finally
    Reg.Free;
  end;
end;

procedure TForm1.JumpToKey(Key: string);
var
  i, n: Integer;
  hWin: HWND;
  ExecInfo: ShellExecuteInfoA;
begin
  // search registry window
  hWin := FindWindowA(PAnsiChar('RegEdit_RegEdit'), nil);
  if hWin = 0 then
  {if Regedit doesn't run then we launch it}
  begin
    FillChar(ExecInfo, 60, #0);
    with ExecInfo do
    begin
      cbSize := 60;
      fMask  := SEE_MASK_NOCLOSEPROCESS;
      lpVerb := PAnsiChar('open');
      lpFile := PAnsiChar('regedit.exe');
      nShow  := 1;
    end;
    // execute registry windows editor
    ShellExecuteExA(@ExecInfo);
    WaitForInputIdle(ExecInfo.hProcess, 200);
    hWin := FindWindowA(PAnsiChar('RegEdit_RegEdit'), nil);
  end;
  ShowWindow(hWin, SW_SHOWNORMAL);
  hWin := FindWindowExA(hWin, 0, PAnsiChar('SysTreeView32'), nil);
  SetForegroundWindow(hWin);
  i := 30;
  repeat
    SendMessageA(hWin, WM_KEYDOWN, VK_LEFT, 0);
    Dec(i);
  until i = 0;
  Sleep(100);
  SendMessageA(hWin, WM_KEYDOWN, VK_RIGHT, 0);
  Sleep(100);
  i := 1;
  n := Length(Key);
  repeat
    if Key[i] = '\' then
    begin
      SendMessageA(hWin, WM_KEYDOWN, VK_RIGHT, 0);
      Sleep(100);
    end
    else
      SendMessageA(hWin, WM_CHAR, Integer(Key[i]), 0);
    i := i + 1;
  until i = n;
end;

procedure TForm1.JumpWinReg1Click(Sender: TObject);
begin
  JumpToKey(StatusBar1.Panels[0].Text);
end;

procedure TForm1.JumpWinReg2Click(Sender: TObject);
begin
  JumpToKey(StatusBar1.Panels[0].Text);
end;

function HKEYToStr(const Key: HKEY): string;
begin
  if (key < HKEY_CLASSES_ROOT) or (key > HKEY_CLASSES_ROOT+6) then
    Result := ''
  else
    Result := HKEYNames[key - HKEY_CLASSES_ROOT];
end;

function StrToHKEY(const KEY: string): HKEY;
var
  i: Byte;
begin
  (* Constants are difficult to change within procedures, and since
     hotkeys can only be defined as constants, this function
     helps to redefine them.*)
  Result := $0;
  for i := Low(HKEYNames) to High(HKEYNames) do
  begin
    if SameText(HKEYNames[i], KEY) then
      Result := HKEY_CLASSES_ROOT + i;
  end;
end;

function SetTokenPrivilege(const APrivilege: string; const AEnable: Boolean): Boolean;
var
  LToken: THandle;
  LTokenPriv: TOKEN_PRIVILEGES;
  LPrevTokenPriv: TOKEN_PRIVILEGES;
  LLength: Cardinal;
  LErrval: Cardinal;
begin
  (* In the context of computer security, especially under Windows operating
     systems, "Token Privilege" refers to the permissions or rights assigned
     to a user account or group within an access token.*)
  Result := False;
  if OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, LToken) then
  try
    // Get the locally unique identifier (LUID) .
    if LookupPrivilegeValue(nil, PChar(APrivilege), LTokenPriv.Privileges[0].Luid) then
    begin
      LTokenPriv.PrivilegeCount := 1; // one privilege to set
      case AEnable of
        True: LTokenPriv.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
        False: LTokenPriv.Privileges[0].Attributes := 0;
      end;
      LPrevTokenPriv := LTokenPriv;
      // Enable or disable the privilege
      Result := AdjustTokenPrivileges(LToken, False, LTokenPriv,
                                SizeOf(LPrevTokenPriv), LPrevTokenPriv, LLength);
    end;
  finally
    CloseHandle(LToken);
  end;
end;

function SetPrivilege(Privilege: PChar; EnablePrivilege: Boolean;
                      out PreviousState: Boolean): DWORD;
// The specific setting of individual privileges
var
  Token: THandle;
  NewState: TTokenPrivileges;
  Luid: TLargeInteger;
  PrevState: TTokenPrivileges;
  Return: DWORD;
begin
  PreviousState := True;
  if (GetVersion() > $80000000) then
    // Winx
    Result := ERROR_SUCCESS
  else
  begin
    // WinNT
    if not OpenProcessToken(GetCurrentProcess(), MAXIMUM_ALLOWED, Token) then
      Result := GetLastError()
    else
      try
        if not LookupPrivilegeValue(nil, Privilege, Luid) then
          Result := GetLastError()
        else
        begin
          NewState.PrivilegeCount := 1;
          NewState.Privileges[0].Luid := Luid;
          if EnablePrivilege then
            NewState.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
          else
            NewState.Privileges[0].Attributes := 0;
          if not AdjustTokenPrivileges(Token, False, NewState, SizeOf(TTokenPrivileges), PrevState, Return) then
            Result := GetLastError()
          else
          begin
            Result := ERROR_SUCCESS;
            PreviousState := (PrevState.Privileges[0].Attributes and SE_PRIVILEGE_ENABLED <> 0);
          end;
        end;
      finally
        CloseHandle(Token);
      end;
  end;
end;

function RegSaveKeyToFile(Key: HKEY; const SubKey, FileName: string): DWORD;
(* This function requires the Backup privilege if the Windows user
    account does not have it.*)
const
  SE_BACKUP_NAME = 'SeBackupPrivilege';
var
  PreviousState: Boolean;
  KeyHandle: HKEY;
begin
  // Saving registry keys
  Result := SetPrivilege(SE_BACKUP_NAME, True, PreviousState);
  if (Result = ERROR_SUCCESS) then
    try
      KeyHandle := 0;
      Result := RegOpenKeyEx(Key, PChar(SubKey), 0, MAXIMUM_ALLOWED, KeyHandle);
      if (Result = ERROR_SUCCESS) then
        try
          // FIXME: Short Filename on WinNT!
          Result := RegSaveKey(KeyHandle, PChar(FileName), nil);
        finally
          RegCloseKey(KeyHandle);
        end;
    finally
      if (not PreviousState) then
        SetPrivilege(SE_BACKUP_NAME, PreviousState, PreviousState);
    end;
end;

function RegLoadKeyFromFile(Key: HKEY; const SubKey, FileName: string): DWORD;
(* This function requires the backup privilege and the privilege to modify
   the key if the Windows user account does not have them.*)
const
  SE_BACKUP_NAME = 'SeBackupPrivilege';
  SE_RESTORE_NAME = 'SeRestorePrivilege';
var
  PrevBackup: Boolean;
  PrevRestore: Boolean;
  KeyHandle: HKEY;
  ShortName: array [0 .. MAX_PATH] of Char;
begin
  // set the privile for process
  Result := SetPrivilege(SE_BACKUP_NAME, True, PrevBackup);
  if (Result = ERROR_SUCCESS) then
    try
      Result := SetPrivilege(SE_RESTORE_NAME, True, PrevRestore);
      if (Result = ERROR_SUCCESS) then
        try
          if (GetVersion() > $80000000) then
          begin
            if (GetShortPathName(PChar(FileName), ShortName, MAX_PATH) = 0) then
              Result := GetLastError()
            else
              Result := RegLoadKey(Key, PChar(SubKey), ShortName);
          end
          else
          begin
            KeyHandle := 0;
            Result := RegOpenKeyEx(Key, PChar(SubKey), 0, MAXIMUM_ALLOWED, KeyHandle);
            if (Result = ERROR_SUCCESS) then
              try
                Result := RegRestoreKey(KeyHandle, PChar(FileName), 0);
              finally
                RegCloseKey(KeyHandle);
              end;
          end;
        finally
          if (not PrevRestore) then
            SetPrivilege(SE_RESTORE_NAME, PrevRestore, PrevRestore);
        end;
    finally
      if (not PrevBackup) then
        SetPrivilege(SE_BACKUP_NAME, PrevBackup, PrevBackup);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
const
  SE_CREATE_TOKEN_NAME = 'SeCreateTokenPrivilege';

var PreviousState:TIniFile;
    i,k:integer;
begin
   Form1.DoubleBuffered := true;
   SetTokenPrivilege(SE_CREATE_TOKEN_NAME, true);
   ListView1.Columns.Items[0].width := ListView1.width-4;
   ComboBox1.Width := ListView1.Width;
   if not FileExists(ExtractFilePath(Application.ExeName)+'Data\root\regedit.ini') then
    begin
      selkey:='';
      rootkeys:=2;
      keycount:=0;
      ComboBox1.text:='Select the rootkey';
      StatusBar1.Panels.Items[0].text:='Computer\';
      Defaultpath:='Computer\';
    end else begin
        PreviousState:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Data\root\regedit.ini');
        ComboBox1.text:=PreviousState.ReadString('Start','Root','Select the rootkey');
        Edit1.text:=PreviousState.ReadString('Start','Path','');
        keycount:=PreviousState.ReadInteger('Start','KeyCount',0);
      for i:=0 to keycount do
       lastkey[i]:=PreviousState.ReadString('Start','Count'+IntToStr(i),'');
      PreviousState.Free;

     if ComboBox1.Text='Select the rootkey' then exit;
     if ComboBox1.text='HKEY_CLASSES_ROOT' then  rootkeys:=0
     else
      if ComboBox1.text='HKEY_CURRENT_USER' then rootkeys:=1
        else
          if ComboBox1.text='HKEY_LOCAL_MACHINE' then rootkeys:=2
            else
              if ComboBox1.text='HKEY_USERS' then rootkeys:=3
                else
                  if ComboBox1.text='HKEY_CURRENT_CONFIG' then rootkeys:=4;

     ComboBox1.Cursor := crHourglass;
     ListView1.Cursor := crHourglass;
     ListView2.Cursor := crHourglass;
     ListView1.Items.BeginUpdate;
     ListView1.Items.Clear;
     ListView1.Items.EndUpdate;
     ListView2.items.BeginUpdate;
     ListView2.items.clear;
     ListView2.Items.EndUpdate;
     GetRegistrykeys(rootkeys,Edit1.text);
     GetRegistryData(rootkeys,Edit1.text);
     ComboBox1.Cursor := crdefault;
     ListView1.Cursor := crdefault;
     ListView2.Cursor := crdefault;
     Defaultpath := 'Computer\' + ComboBox1.text;
     StatusBar1.Panels.Items[0].text := Defaultpath + Edit1.text;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  PreviousState:TIniFile;
  i : integer;
begin
   if SavePath1.Checked = true then begin
   PreviousState:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Data\root\regedit.ini');
   PreviousState.WriteString('Start','Root', Form1.ComboBox1.Text);
   PreviousState.WriteString('Start','Path', Form1.Edit1.text);
   PreviousState.WriteInteger('Start','KeyCount', KeyCount);
   Form1.WriteOptions;

   for i:=0 to keycount do
    PreviousState.WriteString('Start','Count'+IntToStr(i),lastkey[i]);
    PreviousState.Free;
   end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
   ListView1.Columns.Items[0].width:=ListView1.width-22;
   ComboBox1.Width:=ListView1.Width
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ReadOptions;
  Grid1.OnClick(sender);
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  ShellAboutA(Handle,'Registry Editor',
              'Registry Editor'+#13+'Copyright (c) 2025 by hackbard | github.com Release',
              Application.Icon.Handle);
end;

procedure TForm1.akeOwnershipPrivilege1Click(Sender: TObject);
(* SeTakeOwnershipPrivilege: This is a Windows privilege identifier that
   determines whether a user has the right to take ownership of an object.*)
const
  SE_TAKE_OWNERSHIP_NAME = 'SeTakeOwnershipPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_TAKE_OWNERSHIP_NAME, true);
  end;
end;

procedure TForm1.AssignPrimaryTokenPrivilege1Click(Sender: TObject);
(* The `SeAssignPrimaryTokenPrivilege` function in Delphi allows you to
   assign a new primary token to a process, which can change the process's
   privileges. It is a privilege normally reserved for administrators and
   must be managed using functions like `AdjustTokenPrivileges`
   or `OpenProcessToken`.*)
const
  SE_ASSIGNPRIMARYTOKEN_NAME = 'SeAssignPrimaryTokenPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_ASSIGNPRIMARYTOKEN_NAME, true);
  end;
end;

procedure TForm1.AuditPrivilege1Click(Sender: TObject);
(* The SeAuditPrivilege (also known as the user right "Generate security audits"
   in the Windows security policies) is an important Windows permission that
   allows a process to write entries to the security event log.*)
const
  SE_AUDIT_NAME = 'SeAuditPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_AUDIT_NAME, true);
  end;
end;

procedure TForm1.BackupPrivilege1Click(Sender: TObject);
(* The SeBackupPrivilege (user right: "Back up files and directories") is an
   important security right in Windows that allows a user or service to
   bypass file system and registry permissions to perform backup operations.*)
const
  SE_BACKUP_NAME = 'SeBackupPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_BACKUP_NAME, true);
  end;
end;

procedure TForm1.BackupRegistry1Click(Sender: TObject);
begin
  Beep;
  if MessageBox(Handle,'This creates a complete backup of the Windows Registry root keys.'+#13+
                       'The file can be up to 25 MB in size.' +#13+
                       'This may take 1-2 minutes, would you like to continue?','Confirm',MB_YESNO) = IDYES then
    BEGIN
      try
        Form3 := TForm3.Create(self);
        Form3.ShowModal;
      finally
      end;
    END;
end;

procedure TForm1.cbPrivilege1Click(Sender: TObject);
(* SeTcbPrivilege is a highly privileged permission in Windows that allows
   an account to act as part of the operating system. It is extremely powerful,
   as it enables almost all system-level operations. The permission is
   assigned via Group Policy under gpedit.msc in
   "User Rights Assignments" -> "Act as part of the operating system," and
   its use should be very restricted.*)
const
  SE_TCB_NAME = 'SeTcbPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_TCB_NAME, true);
  end;
end;

procedure TForm1.ChangeNotifyPrivilege1Click(Sender: TObject);
(* The SeChangeNotifyPrivilege (also known by the policy name "Bypass
   traverse checking") is a Windows permission that allows a user or
   process to bypass folder-level security checks when navigating
   through directory structures in order to access files or subfolders
   for which the user has the appropriate permissions.*)
const
  SE_CHANGE_NOTIFY_NAME = 'SeChangeNotifyPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_CHANGE_NOTIFY_NAME, true);
  end;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var
  i : integer;
begin
  Edit1.text:='';
  selkey:='';
  ComboBox1.Cursor:=crHourglass;
  ListView1.Cursor:=crHourglass;
  ListView2.Cursor:=crHourglass;
  ListView1.Items.BeginUpdate;
  ListView1.Items.Clear;
  ListView1.Items.EndUpdate;
  ListView2.items.BeginUpdate;
  ListView2.items.clear;
  ListView2.Items.EndUpdate;
  GetRegistryData(ComboBox1.ItemIndex,selkey);
  GetRegistrykeys(ComboBox1.ItemIndex,selkey);
  ComboBox1.Cursor:=crdefault;
  ListView1.Cursor:=crdefault;
  ListView2.Cursor:=crdefault;

  // Set Hotkey root path
  if ComboBox1.ItemIndex = 0 then
  begin
    StatusBar1.Panels.Items[0].text := 'Computer\HKEY_CLASSES_ROOT';
    rootkeys := 0
  end else
  if ComboBox1.ItemIndex = 1 then
  begin
    StatusBar1.Panels.Items[0].text := 'Computer\HKEY_CURRENT_USER';
    rootkeys:=1
  end else
  if ComboBox1.ItemIndex = 2 then
  begin
    StatusBar1.Panels.Items[0].text:='Computer\HKEY_LOCAL_MACHINE';
    rootkeys:=2
  end else
  if ComboBox1.ItemIndex=3 then
  begin
    StatusBar1.Panels.Items[0].text := 'Computer\HKEY_USERS';
    rootkeys := 3
  end else
  if ComboBox1.ItemIndex = 4 then
  begin
  StatusBar1.Panels.Items[0].text:='Computer\HKEY_CURRENT_CONFIG';
  rootkeys:=4 end;
  Defaultpath := StatusBar1.Panels.Items[0].text;
     for i:=0 to keycount do
     lastkey[i]:='';
     keycount:=0;
     if ListView1.Items.count <> 0 then
     begin
       ListView1.Items.Item[0].Selected:=true;
       ListView1.Items.Item[0].Focused:=true;
     end;
   ListView1.SetFocus;
end;

procedure TForm1.CopyPath1Click(Sender: TObject);
begin
  Clipboard.AsText := StatusBar1.Panels[0].Text;
end;

procedure TForm1.CopyPath2Click(Sender: TObject);
begin
  Clipboard.AsText := StatusBar1.Panels[0].Text + '\' + ListView2.Selected.Caption;
end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
begin
  modify1.Enabled:=ListView2.SelCount<>0;
  delete2.Enabled:=ListView2.SelCount<>0;
  renamd1.Enabled:=ListView2.SelCount<>0;
end;

procedure TForm1.ProfileSingleProcessPrivilege1Click(Sender: TObject);
(* The Windows privilege SeProfileSingleProcessPrivilege (user right:
   "Profile of a single process" or "Sample the performance of an
   application process") is required to collect performance information
   for a specific non-native process.*)
const
  SE_PROF_SINGLE_PROCESS_NAME = 'SeProfileSingleProcessPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_PROF_SINGLE_PROCESS_NAME, true);
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
   new1.Enabled:=ComboBox1.Text<>'Select the rootkey';
   delete1.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
   rename1.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
   Export2.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
end;

procedure TForm1.SaveKey1Click(Sender: TObject);
begin
  Export2.Click;
end;

procedure TForm1.SecurityPrivilege1Click(Sender: TObject);
(* SeSecurityPrivilege is a Windows permission required for certain actions
   on CIFS servers that are not assigned by default. For example, this
   permission enables the installation of SQL Server, which requires a
   specific level of privileges.*)
const
  SE_SECURITY_NAME = 'SeSecurityPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_SECURITY_NAME, true);
  end;
end;

procedure TForm1.ShowRegistryData(name,ndata,datatyp:string);
var
  p : integer;
begin
  // Locate which values are in the registry key.
   with ListView2.items.Add do begin
      Caption:=name;
      if datatyp='REG_SZ' then
      begin
        ImageIndex := 2;
        subitems.Add('REG_SZ')
      end else
      if datatyp = 'DWORD' then
      begin
        ImageIndex := 3;
        subitems.Add('DWORD')
      end else
      if datatyp = 'Unknow' then
      begin
        ImageIndex := 4;
        subitems.Add('Unknow')
      end else
      if datatyp = 'REG_BINARY' then
      begin
        ImageIndex := 3;
        subitems.Add('REG_BINARY')
      end else
      if datatyp = 'ExpString' then
      begin
        ImageIndex := 2;
        subitems.Add('ExpString')
      end;
      if ndata = '' then ndata:='(Value not set)'
      else subitems.Add(ndata);
    end
end;

procedure TForm1.ShutdownPrivilege1Click(Sender: TObject);
(* The SeShutdownPrivilege (also known as the "Shut down system" user
   right in Windows security settings) is a Windows permission that
   allows a user or process to shut down, restart,
   or hibernate the local system.*)
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_SHUTDOWN_NAME, true);
  end;
end;

procedure TForm1.GetRegistryData(const rootkey:word;key:string);
var
  Reg : TRegistry;
  datatype : TRegDataType;
  valuenames : TStringList;
  name, data, datatyp : string;
  i : integer;
  buffersize, buffer : integer;
begin
  // Determine the data for the various registry values and list them.
   reg:=TRegistry.Create;
   try
      reg.RootKey := root_keys[rootkey];
      reg.OpenKeyReadOnly(key);
      try
        valuenames := TStringList.Create;
        reg.GetValueNames(valuenames);
        ListView2.items.BeginUpdate;
        ListView2.items.clear;
        ListView2.Items.EndUpdate;
        for i:=0 to valuenames.Count -1 do
        begin
           name := valuenames.Strings[i];
           datatype := reg.GetDataType(name);

           if datatype = rdString then
           begin
              data:=reg.ReadString(name);
              datatyp:='REG_SZ';
           end else

           if datatype = rdInteger then
           begin
              data:=inttostr(reg.ReadInteger(name));
              datatyp:='DWORD';
           end else

           if datatype = rdExpandString then
           begin
                data := reg.ReadString(name);
                datatyp:='ExpString';
           end else

           if datatype = rdBinary then
           begin
              try
                found := name;
                RegReadBinary;
                data := RegBinary;
                datatyp:= 'REG_BINARY';
              except
              end;
           end;

           if datatype = rdUnknown then
           begin
              data:='Unknow';
              datatyp:='Unknow'
           end;
           ShowRegistryData(name, data, datatyp);
        end;
        reg.CloseKey;
        valuenames.Free;
      finally
         reg.free
      end
   except
      reg.free;
      exit;
   end;
end;

procedure TForm1.GetRegistryKeys(const RootKey:word;Key:string);
var
  Reg : TRegistry;
  KeyNames : TStringList;
  i : integer;
begin
  // Identify the keys that are located in a path and list them.
    Reg := TRegistry.Create;
    try
      Reg.RootKey := Root_Keys[rootkey];
      reg.OpenKeyReadOnly(key);
      try
        KeyNames:=TStringList.Create;
        reg.GetKeyNames(KeyNames);
        if Edit1.text<>'' then
         with ListView1.Items.Add do
         begin
             caption:='<..>';
             imageindex:=1
         end;
        ListView1.items.BeginUpdate;
        for i:=0 to keynames.count-1 do
           if keyNames.Strings[i]<>'' then
            with ListView1.Items.Add do
            begin
                 caption:=keyNames.Strings[i];
                 if caption<>'..' then ImageIndex:=0
                 else
                 ImageIndex := 1;
            end;
        ListView1.items.EndUpdate;
        reg.CloseKey;
        KeyNames.Free;
      finally
        reg.free
      end
    except
       reg.free;
    end
end;

procedure TForm1.Grid1Click(Sender: TObject);
begin
  ListView2.GridLines := Grid1.Checked;
end;

procedure TForm1.IncreaseBasePriorityPrivilege1Click(Sender: TObject);
(* The Windows privilege SeIncreaseBasePriorityPrivilege (also known as
   "Increase Scheduling Priority" in security policies) determines which
   user accounts can increase the base priority class of a process.*)
const
  SE_INC_BASE_PRIORITY_NAME = 'SeIncreaseBasePriorityPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_INC_BASE_PRIORITY_NAME, true);
  end;
end;

procedure TForm1.IncreaseQuotaPrivilege1Click(Sender: TObject);
(* SeIncreaseQuotaPrivilege is a Windows security privilege that allows a
   user to manage the quota system, i.e., to limit disk storage usage for
   users or groups. This privilege is intended for administrators and other
   users who need to set up and manage storage quotas on the system.*)
const
  SE_INCREASE_QUOTA_NAME = 'SeIncreaseQuotaPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_INCREASE_QUOTA_NAME, true);
  end;
end;

procedure TForm1.Splitter1Moved(Sender: TObject);
begin
   ListView1.Columns.Items[0].width:=ListView1.width-22;
   ComboBox1.Width:=ListView1.Width;
end;

procedure TForm1.SyncAgentPrivilege1Click(Sender: TObject);
(* Sync Agent privileges vary depending on the specific product, but
   typically require a service account with log on as a service permissions,
   and roles like db_owner for SQL data sync agents, or Azure File Sync
   Administrator for Azure File Sync. For installation, administrative
   privileges are often needed, and for cloud sync, MFA should be enabled
   for privileged users to protect against unauthorized access.*)
const
  SE_SYNC_AGENT_NAME = 'SeSyncAgentPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_SYNC_AGENT_NAME, true);
  end;
end;

procedure TForm1.SystemEnvironmentPrivilege1Click(Sender: TObject);
(* The SeSystemEnvironmentPrivilege (also known as "Modify firmware
   environment values") is a security permission in Windows that allows a
   user account or process to change the system's non-volatile RAM (NVRAM)
   settings or firmware environment variables.*)
const
  SE_SYSTEM_ENVIRONMENT_NAME = 'SeSystemEnvironmentPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_SYSTEM_ENVIRONMENT_NAME, true);
  end;
end;

procedure TForm1.SystemProfilePrivilege1Click(Sender: TObject);
(* The SeSystemProfilePrivilege (also known as "System Performance Profiles"
   in Windows security settings) is a Windows permission that allows a user
   or process to collect information about the performance of the
   entire system.*)
const
  SE_SYSTEM_PROFILE_NAME = 'SeSystemProfilePrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_SYSTEM_PROFILE_NAME, true);
  end;
end;

procedure TForm1.SystemtimePrivilege1Click(Sender: TObject);
(* The SeSystemtimePrivilege (also known as the "Change System Time" right)
   is a Windows privilege that allows a user or process to change the current
   system date and system time of the computer.*)
const
  SE_SYSTEMTIME_NAME = 'SeSystemtimePrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_SYSTEMTIME_NAME, true);
  end;
end;

procedure TForm1.UndockPrivilege1Click(Sender: TObject);
(* SeUndockPrivilege refers to the Windows user right ID that allows a user
   or process to assume the identity of another user within the same session.
   This user right, also known as "Impersonate other users," is configured
   in Windows security settings and is part of the assigned user rights.
   Its use can trigger security events.*)
const
  SE_UNDOCK_NAME = 'SeUndockPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_UNDOCK_NAME, true);
  end;
end;

procedure TForm1.UnsolicitedInputPrivilege1Click(Sender: TObject);
(* The request likely refers to the management of Windows privileges (e.g.,
   SeDebugPrivilege), handling of unsolicited data in network communication,
   or managing User Account Control (UAC) prompts and execution
   privileges for an application.*)
const
  SE_UNSOLICITED_INPUT_NAME = 'SeUnsolicitedInputPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_UNSOLICITED_INPUT_NAME, true);
  end;
end;

procedure TForm1.Panel1Resize(Sender: TObject);
begin
   ListView1.Columns.Items[0].width:=ListView1.width-22;
   ComboBox1.Width:=ListView1.Width
end;

procedure TForm1.RefreshKeys(value:string);
var
  i, k : integer;
  T : TPoint;
begin
  // Update the determination of the key and value list.
  ComboBox1.Cursor:=crHourglass;
  ListView1.Cursor:=crHourglass;
  ListView2.Cursor:=crHourglass;
  ListView1.Items.BeginUpdate;
  ListView1.Items.Clear;
  ListView1.Items.EndUpdate;
  GetRegistrykeys(rootkeys,Edit1.text);
  ComboBox1.Cursor:=crdefault;
  ListView1.Cursor:=crdefault;
  ListView2.Cursor:=crdefault;
    for i:=0 to ListView1.Items.Count-1 do
       if UpperCase(ListView1.Items.Item[i].Caption)=UpperCase(value) then
       begin
          ListView1.Items.Item[i].Selected:=true;
          ListView1.Items.Item[i].focused:=true;
          k:=i;
          break;
       end;
   T := ListView1.Items.Item[k].getposition;
   ListView1.Scroll(t.x-100,t.y-100);
end;

procedure TForm1.RemoteShutdownPrivilege1Click(Sender: TObject);
(* SeRemoteShutdownPrivilege is a user right in Windows that allows a
   user or group to shut down a system from another computer on the network.
   This right is known as "Force shutdown from remote system" and is
   logged in the Windows Security log when used. It is necessary for a
   process or user to perform a remote shutdown.*)
const
  SE_REMOTE_SHUTDOWN_NAME = 'SeRemoteShutdownPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_REMOTE_SHUTDOWN_NAME, true);
  end;
end;

procedure TForm1.RefreshData(value:string);
var
  i, k : integer;
  T : TPoint;
begin
  // Update the data in the values.
  ComboBox1.Cursor := crHourglass;
  ListView1.Cursor := crHourglass;
  ListView2.Cursor := crHourglass;
  ListView2.items.BeginUpdate;
  ListView2.items.clear;
  ListView2.Items.EndUpdate;
  GetRegistryData(rootkeys, Edit1.text + '\');
  ComboBox1.Cursor := crdefault;
  ListView1.Cursor := crdefault;
  ListView2.Cursor := crdefault;
    for i:=0 to ListView2.Items.Count-1 do
       if UpperCase(ListView2.Items.Item[i].Caption)=UpperCase(value) then
       begin
          ListView2.Items.Item[i].Selected:=true;
          ListView2.Items.Item[i].focused:=true;
          k:=i;
          break;
       end;
   T := ListView2.Items.Item[k].getposition;
   ListView2.Scroll(t.x-100, t.y-100);
end;

procedure TForm1.ListView1Click(Sender: TObject);
begin
  Delete3.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
  Rename2.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
  Modify2.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
  Delete4.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
  Rename3.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
  SaveKey1.Enabled := (ListView1.SelCount<>0) and (ListView1.Selected.Caption<>'<..>');
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
var
  sel : TListItem;
  p, i, k : integer;
  s : string;
  T : TPoint;
begin
  // Browsing within the hotkeys
  if ListView1.Items.count = 0 then exit;
  Sel := ListView1.selected;
  if sel = nil then exit;
  selkey := sel.caption;
  if selkey <> '<..>' then
  begin
    Inc(keycount);
    lastkey[keycount] := selkey;
    Edit1.text := Edit1.text + '\' + selkey;
    ComboBox1.Cursor:=crHourglass;
    ListView1.Cursor:=crHourglass;
    ListView2.Cursor:=crHourglass;
    ListView1.Items.BeginUpdate;
    ListView1.Items.Clear;
    ListView1.Items.EndUpdate;
    ListView2.items.BeginUpdate;
    ListView2.items.clear;
    ListView2.Items.EndUpdate;
    GetRegistrykeys(rootkeys,Edit1.text);
    GetRegistryData(rootkeys,Edit1.text);
    ComboBox1.Cursor:=crdefault;
    ListView1.Cursor:=crdefault;
    ListView2.Cursor:=crdefault;
    StatusBar1.Panels.Items[0].text:=defaultpath+Edit1.text;
    ListView1.Items.Item[0].Selected:=true;
    ListView1.Items.Item[0].Focused:=true;
  end else
  begin
    s := Edit1.text;
    p := lastdelimiter('\',s);
    Delete(s,p,length(s));
    Edit1.text := s;
    ComboBox1.Cursor:=crHourglass;
    ListView1.Cursor:=crHourglass;
    ListView2.Cursor:=crHourglass;
    ListView1.Items.BeginUpdate;
    ListView1.Items.Clear;
    ListView1.Items.EndUpdate;
    ListView2.items.BeginUpdate;
    ListView2.items.clear;
    ListView2.Items.EndUpdate;
    GetRegistrykeys(rootkeys,Edit1.text);
    GetRegistryData(rootkeys,Edit1.text);
    ComboBox1.Cursor:=crdefault;
    ListView1.Cursor:=crdefault;
    ListView2.Cursor:=crdefault;
    StatusBar1.Panels.Items[0].text := defaultpath + Edit1.text;

    if ListView1.Items.Count<>0 then
      for i:=0 to ListView1.Items.Count-1 do
        if UpperCase(ListView1.Items.item[i].caption)=UpperCase(lastkey[keycount]) then
          begin
              ListView1.Items.Item[i].Selected:=true;
              ListView1.Items.Item[i].Focused:=true;
              k:=i;
          end;
    T:=ListView1.Items.Item[k].getposition;
    ListView1.Scroll(t.x-100,t.y-100);
    Dec(keycount);
  end;
end;

procedure TForm1.ListView1KeyPress(Sender: TObject; var Key: Char);
var
  i : integer;
  s : string;
begin
   if key = #13 then ListView1dblclick(nil)
end;

procedure TForm1.New1Click(Sender: TObject);
var
  value : string;
  input : boolean;
  Reg : TRegistry;
begin
  value := 'New key';
  input := inputquery('Create key','Name:',value);
  if input then
  begin
    // Creating a new key.
    try
      Reg:=TRegistry.Create;
      Reg.RootKey := Root_Keys[rootkeys];
      reg.OpenKey(Edit1.text + '\', false);
      if reg.KeyExists(value) then begin
        Messagedlg('The specified key already exists!',mtInformation,[mbOk],0);
        exit;
      end;
      reg.CreateKey(value);
      reg.CloseKey;
      reg.free;
      RefreshKeys(value);
    except
       Messagedlg('Cannot create registry key!',mterror,[mbOk],0);
       reg.free;
    end;
  end
end;

procedure TForm1.CreatePagefilePrivilege1Click(Sender: TObject);
(* The user right SeCreatePagefilePrivilege (also known as "Create a pagefile"
   in the security settings) determines which users can manage the size or
   existence of a pagefile (pagefile.sys) in the Windows operating system.*)
const
  SE_CREATE_PAGEFILE_NAME = 'SeCreatePagefilePrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_CREATE_PAGEFILE_NAME, true);
  end;
end;

procedure TForm1.CreatePermanentPrivilege1Click(Sender: TObject);
(* The Windows security privilege SeCreatePermanentPrivilege (also known
   as the "Create permanent shared objects" user right) determines which
   user accounts can be used by processes to create a directory object using
   the object manager. These directory objects include permanent shared
   objects such as devices, semaphores, and mutexes.*)
const
  SE_CREATE_PERMANENT_NAME = 'SeCreatePermanentPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_CREATE_PERMANENT_NAME, true);
  end;
end;

procedure TForm1.CreateTokenPrivilege1Click(Sender: TObject);
(* SeCreateTokenPrivilege allows a user to create a token object, which
   is necessary for tasks like creating a new user token or impersonating
   a different user for local resource access. This is a powerful privilege
   used in specific scenarios, such as launching a process as a different
   user or creating symbolic links, and it should only be granted with caution.*)
const
  SE_CREATE_TOKEN_NAME = 'SeCreateTokenPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_CREATE_TOKEN_NAME, true);
  end;
end;

procedure TForm1.DebugPrivilege1Click(Sender: TObject);
(* The SeDebugPrivilege is a special Windows permission that allows a process
   to debug other processes and access their memory, regardless of the normal
   security descriptions (Access Control Lists, ACLs) of those processes.*)
const
  SE_DEBUG_NAME = 'SeDebugPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_DEBUG_NAME, true);
  end;
end;

procedure TForm1.delete1Click(Sender: TObject);
var
  Reg : TRegistry;
  s : string;
begin
  // Deleting a key
   if ListView1.selected.Caption='<..>' then exit;
    s:=ListView1.Selected.Caption;
    if MessageDlg('Are you sure you want to delete the key "'+s+'" and all of its subkeys?',
        mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := Root_Keys[rootkeys];
      reg.DeleteKey(Edit1.text+'\'+s);
      ComboBox1.Cursor:=crHourglass;
      ListView1.Cursor:=crHourglass;
      ListView2.Cursor:=crHourglass;
      ListView1.Items.BeginUpdate;
      ListView1.Items.Clear;
      ListView1.Items.EndUpdate;
      ListView2.items.BeginUpdate;
      ListView2.items.clear;
      ListView2.Items.EndUpdate;
      GetRegistrykeys(rootkeys,Edit1.text);
      GetRegistryData(rootkeys,Edit1.text);
      ComboBox1.Cursor:=crdefault;
      ListView1.Cursor:=crdefault;
      ListView2.Cursor:=crdefault;
      ListView1.Items.Item[0].Selected:=true;
      ListView1.Items.Item[0].Focused:=true;
      Reg.Free;
    except
       Messagedlg('Cannot delete Registry key',mterror,[mbOk],0);
       Reg.Free;
    end;
end;

procedure TForm1.rename1Click(Sender: TObject);
var
  value, newvalue : string;
  input : boolean;
  Reg : TRegistry;
begin
  // Renaming a key
   if ListView1.selected.Caption='<..>' then exit;
    value:=ListView1.Selected.Caption;
    input := inputquery('Rename key','New name:',newvalue);
    if input then
    begin
      try
        if UpperCase(newvalue)=UpperCase(value) then exit;
        Reg:=TRegistry.Create;
        Reg.RootKey:=Root_Keys[rootkeys];
        reg.OpenKey(Edit1.text+'\',false);
        if reg.KeyExists(newvalue) then
        begin
          Messagedlg('The specified key already exists!',mtInformation,[mbOk],0);
          exit;
        end;
        reg.DeleteKey(value);
        reg.CreateKey(newvalue);
        reg.CloseKey;
        reg.free;
        RefreshKeys(newvalue);
      except
         Messagedlg('Cannot rename registry key!',mterror,[mbOk],0);
         reg.free;
      end;
    end
end;

procedure TForm1.Rename2Click(Sender: TObject);
begin
  rename1.Click;
end;

procedure TForm1.Rename3Click(Sender: TObject);
begin
  Renamd1.Click;
end;

procedure TForm1.RestorePrivilege1Click(Sender: TObject);
(* The SeRestorePrivilege permission, also known as the "Restore files
   and directories" permission (or Restore files and directories privilege),
   is a security permission in the Windows operating system.*)
const
  SE_RESTORE_NAME = 'SeRestorePrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_RESTORE_NAME, true);
  end;
end;

procedure TForm1.ListView2DblClick(Sender: TObject);
begin
  Modify1.Click;
end;

procedure TForm1.ListView1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  T : TPoint;
  click : TListView;
begin
   {
   if (button=mbRight) and (ComboBox1.Text<>'Select the rootkey') then
     begin
        GetCursorPos(T);
        PopupMenu1.popup(T.x,T.y);
     end;
   }
end;

procedure TForm1.ListView2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  T : TPoint;
begin
   {
   try
      if (button=mbRight) and (ComboBox1.Text <> 'Select the rootkey') then
      begin
          GetCursorPos(T);
          PopupMenu1.popup(T.x,T.y);
      end
    except
      exit
    end;
    }
end;

procedure TForm1.LoadDriverPrivilege1Click(Sender: TObject);
(* The SeLoadDriverPrivilege (user right "Load and unload device drivers")
   is a security permission in the Windows operating system that allows a
   user account or group to dynamically load and unload device drivers.*)
const
  SE_LOAD_DRIVER_NAME = 'SeLoadDriverPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_LOAD_DRIVER_NAME, true);
  end;
end;

procedure TForm1.LockMemoryPrivilege1Click(Sender: TObject);
(* SeLockMemoryPrivilege (also known as "Lock pages in memory") is a user
   privilege in Windows that allows a user account to physically lock
   virtual memory pages in RAM to prevent paging to virtual memory.*)
const
  SE_LOCK_MEMORY_NAME = 'SeLockMemoryPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_LOCK_MEMORY_NAME, true);
  end;
end;

procedure TForm1.New2Click(Sender: TObject);
var
  Reg : TRegistry;
begin
   changedvalue := false;
   with Form2 do
   begin
       Caption := 'Create value';
       Edit1.Text := '';
       Edit2.text := '';
       Edit1.Enabled:=true;
       Edit2.Enabled:=true;
       ComboBox1.Enabled := true;
       ShowModal;
       // Creating a new value within a key
       if changedvalue = true then
       begin
         try
             Reg:=TRegistry.Create;
             Reg.RootKey := Root_Keys[rootkeys];
             reg.OpenKey(Form1.Edit1.Text,false);

             // Standard entry with symbols for true & false
             if ComboBox1.Text = 'String' then
                reg.WriteString(Edit1.Text,Edit2.text)
             else
             // Extended entry with symbols for true & false
             if ComboBox1.Text='Expandable string' then
                reg.WriteExpandString(Edit1.Text,Edit2.text)
             else
             // Dword entry for numerical values (32 bits)
             if (ComboBox1.Text='Integer') or (ComboBox1.Text='DWORD-Value (32-Bit)') then
                reg.WriteInteger(Edit1.Text,StrToIntDef(Edit2.text,0))
             else
             // Binary entry for all characters
             if ComboBox1.Text = 'REG_BINARY' then
                ;

             reg.CloseKey;
             reg.free;
             RefreshData(Edit1.text);
         except
             Messagedlg('Cannot create registry value!',mtError,[mbOk],0);
             reg.free;
         end;
       end;
   end;
end;

procedure TForm1.New3Click(Sender: TObject);
begin
  New2.Click;
end;

procedure TForm1.NewKey1Click(Sender: TObject);
begin
  New1.Click;
end;

procedure TForm1.Delete2Click(Sender: TObject);
var
  Reg : TRegistry;
  selkey, seldata : string;
begin
    // Deleting a value within a key
    selData := ListView2.Selected.Caption;
    if MessageDlg('Are you sure you want to delete the value "'+seldata+'"?',
        mtConfirmation,[mbYes,mbNo],0)=mrNo then exit;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := Root_Keys[rootkeys];
      reg.OpenKey(Form1.Edit1.text,false);
      Reg.DeleteValue(seldata);
      reg.CloseKey;
      reg.free;
    except
       Messagedlg('Cannot delete registry value',mterror,[mbOk],0);
       reg.free;
    end;
   ComboBox1.Cursor:=crHourglass;
   ListView1.Cursor:=crHourglass;
   ListView2.Cursor:=crHourglass;
   GetRegistryData(rootkeys,Edit1.text + '\' + selkey);
   ComboBox1.Cursor:=crdefault;
   ListView1.Cursor:=crdefault;
   ListView2.Cursor:=crdefault;
end;

procedure TForm1.Delete3Click(Sender: TObject);
begin
  delete1.Click;
end;

procedure TForm1.Delete4Click(Sender: TObject);
begin
  Delete2.Click;
end;

procedure TForm1.EnableDelegationPrivilege1Click(Sender: TObject);
(* SeEnableDelegationPrivilege is a Windows permission that allows a user
   to assume the identity of another user within the same session. It is
   often associated with the "Assume the identity of other users" permission
   and is typically linked to services running on a Windows domain network.*)
const
  SE_ENABLE_DELEGATION_NAME = 'SeEnableDelegationPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_ENABLE_DELEGATION_NAME, true);
  end;
end;

procedure TForm1.Export2Click(Sender: TObject);
{$J+}
{$WRITEABLECONST ON}
var
  FileName: string;
  ErrorCode: DWORD;
  s : string;
begin
  // saving a key
  SetLength(FileName, MAX_PATH + 1);
  SetLength(FileName, GetTempPath(MAX_PATH, PChar(FileName)));

  (* The SeBackupPrivilege (also known as the "Back up files and directories"
     right) is an important user right in Windows operating systems that is
     required for backup operations.*)
  if not SetTokenPrivilege('SeBackupPrivilege', True) then
    Exit;

  SaveDialog1.FileName := ListView1.Selected.Caption;

  if SaveDialog1.Execute then
  begin
    FileName := SaveDialog1.FileName + '.reg';

    // Cut off a character on the left side of the path
    s := Edit1.Text;
    Edit3.Text := RightStr(s, Length(s)- 1);

    // Transmitting the string to a constant as a hotkey
    ErrorCode := RegSaveKeyToFile(StrToHKEY(ComboBox1.Text),
                                  Edit3.Text,
                                  FileName);

    if (ErrorCode <> ERROR_SUCCESS) then
      ShowMessage('Save Error : ' + SysErrorMessage(ErrorCode))
    else
    begin
      ErrorCode := RegLoadKeyFromFile(StrToHKEY(ComboBox1.Text),
                            Edit3.Text, FileName);
      if (ErrorCode <> ERROR_SUCCESS) then
        ShowMessage('Load Error : ' + SysErrorMessage(ErrorCode))
      else
        ShowMessage(IntToStr(42));
    end;

  end;
  {$WRITEABLECONST OFF}
end;

procedure TForm1.Renamd1Click(Sender: TObject);
var
  Reg : TRegistry;
  i : integer;
  oldname : string;
begin
   changedvalue := false;
   with Form2 do
   begin
       // Renaming a value within a key
       Caption:='Rename value';
       // Rename Key Values
       oldname := ListView2.Selected.Caption;
       // Rename Binary  Key Value
       RegOldname := oldname;

       try
         Edit1.Text := ListView2.selected.Caption;
         Edit2.Text := ListView2.selected.SubItems.Strings[1];
       except

       end;
       // Determine value format
       if UpperCase(ListView2.selected.SubItems.Strings[0])='STRING' then
          ComboBox1.ItemIndex := 0
       else if UpperCase(ListView2.selected.SubItems.Strings[0])='EXPANDABLE STRING' then
          ComboBox1.ItemIndex := 1
       else if UpperCase(ListView2.selected.SubItems.Strings[0])='INTEGER' then
          ComboBox1.ItemIndex := 2
       else if UpperCase(ListView2.selected.SubItems.Strings[0])='DWORD' then
          ComboBox1.ItemIndex := 3
       else if UpperCase(ListView2.selected.SubItems.Strings[0])='REG_BINARY' then
          ComboBox1.ItemIndex := 4
          ;

       Edit1.Enabled:=true;
       Edit2.Enabled:=false;
       ComboBox1.enabled:=false;
       Edit1.SelectAll;
       ShowModal;

       if changedvalue then
       begin
         try
             // oldname is the value that is to be renamed.
             if oldname = Edit1.Text then exit;
             Reg := TRegistry.Create;
             Reg.RootKey := Root_Keys[rootkeys];
             reg.OpenKey(Form1.Edit1.text,false);
             Reg.RenameValue(oldname,Edit1.text);

             reg.CloseKey;
             reg.free;
             RefreshData(Edit1.text);
          except
             Messagedlg('Cannot rename registry value!',mterror,[mbOk],0);
             reg.free;
          end;
       end;
   end;
end;

procedure TForm1.MachineAccountPrivilege1Click(Sender: TObject);
(* The Windows privilege SeMachineAccountPrivilege (also known as the user
   right "Add workstations to the domain") determines which users or groups
   are authorized to create a computer object in an Active Directory domain
   and join the corresponding computer to the domain.*)
const
  SE_MACHINE_ACCOUNT_NAME = 'SeMachineAccountPrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_MACHINE_ACCOUNT_NAME, true);
  end;
end;

procedure TForm1.ManageVolumePrivilege1Click(Sender: TObject);
(* The SeManageVolumePrivilege, also known as the user right "Perform
   volume maintenance tasks" in Group Policy Management, allows a user
   account to perform specific administrative operations at the volume level.*)
const
  SE_MANAGE_VOLUME_NAME = 'SeManageVolumePrivilege';
begin
  if CreateTokenPrivilege1.Checked = true then begin
    SetTokenPrivilege(SE_MANAGE_VOLUME_NAME, true);
  end;
end;

procedure TForm1.Modify1Click(Sender: TObject);
var
  Reg : TRegistry;
begin
   // Modifying a value within a key
   changedvalue := false;
   with Form2 do
   begin
       Caption := 'Modify Value';

       if Form1.ListView2.Selected.SubItems.Strings[0] ='REG_BINARY'  then
       begin
          ComboBox1.ItemIndex := 4;
          Edit1.Text := Form1.ListView2.selected.Caption;
          found := Form1.ListView2.Selected.Caption;
          Memo1.Enabled := true;
          Form1.RegReadBinary;
          Memo1.Lines.Text := Form1.RegBinary;
          ShowModal;
          Exit;
       end;

       try
         Edit1.Text := Form1.ListView2.selected.Caption;
         Edit2.Text := Form1.ListView2.selected.SubItems.Strings[1];
       except
       end;

       // Determining the format
       if UpperCase(Form1.ListView2.selected.SubItems.Strings[0])='REG_SZ' then
          ComboBox1.ItemIndex := 0
       else if UpperCase(Form1.ListView2.selected.SubItems.Strings[0])='EXPANDABLE STRING' then
          ComboBox1.ItemIndex := 1
       else if UpperCase(Form1.ListView2.selected.SubItems.Strings[0])='INTEGER' then
          ComboBox1.ItemIndex := 2
       else if UpperCase(Form1.ListView2.selected.SubItems.Strings[0])='DWORD' then
          ComboBox1.ItemIndex := 3;

       Memo1.Clear;
       Edit1.Enabled := false;
       Edit2.Enabled := true;
       ComboBox1.Enabled:=false;
       Edit2.SelectAll;

       ShowModal;

       if changedvalue then
       begin
         try
             Reg := TRegistry.Create;
             Reg.RootKey := Root_Keys[rootkeys];
             reg.OpenKey(Form1.Edit1.text,false);
             if ComboBox1.Text='String' then
                reg.WriteString(Edit1.Text,Edit2.text)
             else if ComboBox1.Text='Expandable string' then
                reg.WriteExpandString(Edit1.Text,Edit2.text)
             else if (ComboBox1.Text='Integer') or (ComboBox1.Text='DWORD-Value (32-Bit)') then
                reg.WriteInteger(Edit1.Text,StrToIntDef(Edit2.text,0))
                ;

             reg.CloseKey;
             reg.free;
             RefreshData(Edit1.text);
          except
             Messagedlg('Cannot modify registry value!',mterror,[mbOk],0);
             reg.free;
          end;
       end;
   end;
end;

procedure TForm1.Modify2Click(Sender: TObject);
begin
  Modify1.Click;
end;


end.




