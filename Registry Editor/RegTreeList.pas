unit RegTreeList;

interface

{$WARNINGS OFF}

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Registry;

type TRGProgression = procedure(Event:word) of object; // allows you to manage a progression

const RG_Base     = 0 ;           // We will define actions
      RG_Start    = RG_Base+1;    // startup
      RG_Progress = RG_Base+2;    // a key is completed
      RG_End      = RG_Base+3;    // end of process
      RG_Refresh  = RG_Base+4;    // orders a refresh of the interface

// Reusable variable that gives the maximum depth encountered during the analysis
// It is necessarily less than the MAX_LEVEL variable defined below.
var RG_MaxDepthFound : word;

//Exports... available resources
  procedure EnumRegistryFolders(FileName:string);
  procedure RG_SetProgressor(P:TRGProgression);
  function RG_IsCompleted:boolean;
  function RG_LongestKey:string;

implementation

uses Unit1, Unit3;

const PasTouche   = FALSE;  // DO NOT CHANGE!!
      MAX_LEVEL   = 16;     // Less than 256, because of N:byte;
                            // The larger it is, the more memory it will need. But it will be more accurate.
      CH_TabStyle = '   ';  // Virtual tab in TXT
      RootName    : array[0..6] of string[21] = ('HKEY_CLASSES_ROOT', 'HKEY_CURRENT_USER',
                                                 'HKEY_LOCAL_MACHINE', 'HKEY_USERS',
                                                 'HKEY_PERFORMANCE_DATA', 'HKEY_CURRENT_CONFIG',
                                                 'HKEY_DYN_DATA');
                            // This table shows one of the 7 main virtual keys
      ShortRootName : array[0..6] of string[4] = ('HKCR', 'HKCU', 'HKLM', 'HKU', 'HKPD', 'HKCC', 'HKDD');
                            // This table briefly lists the 7 main virtual keys

var STL         : TStringList;   // Main list of virtual keys
    Tbls        : array[0..MAX_LEVEL] of TStringList; // Table of lists, each corresponding
                                                      // to a predefined depth in the register.
                                                      // "Depth" = "Index in the table".
    RegPath     : array[0..MAX_LEVEL] of string; // At each depth, the corresponding key is noted.
                                                 // Since we are forced to use CloseKey, we must
                                                 // something that allows you to find the address, such as the name of a
                                                 // file in a set of folders.
    Fic         : textfile;  // Our file variable
    Reg         : TRegistry; // Our register in memory
    n           : byte;      // Allows you to initialize the arrays
    Completed   : boolean;   // Indicates whether the limit depth (default=16-1) has been reached.
                             // In this case, not all keys were written to the TXT file.
    KeyMaxDepth : string;    // Give the deepest key in the register
    RG          : TRGProgression;    // Variable linking the unit to an interface

  function GetRefPath(Lvl:cardinal):string;
  {= Returns the address of a deep key =}
  var r : string;
      x : cardinal;
  begin
    r:='';
    if Lvl>0 then
      for x:=0 to Lvl-1 do
        r := r + RegPath[x] + '\';
        GetRefPath:=r;
  end;

  function LevelToTabs(N:cardinal):string;
  {= Provides a tabulation based on the requested depth. =}
  var x : cardinal;
      r : string;
  begin
    r := '';
    for x := 0 to N do
      r:=r+CH_TabStyle;
      LevelToTabs := r;
  end;

  procedure RecurseSubKeys(KeyName: string; var F:textfile; Level, Root:integer);
  {= Performs a recurrence starting from a given depth =}
  var
    x : integer;
  begin
  // MEMORIZE THE DEEPEST KEY
    if Level > RG_MaxDepthFound then
      begin
        RG_MaxDepthFound:=Level;
        KeyMaxDepth:=ShortRootName[Root] + '\'+GetRefPath(Level);
      end;
  // DEPTH LIMIT VERIFICATION
    if Level > MAX_LEVEL-1 then
      begin
        Completed := false;
        Exit;
      end;
  // KEY COLLECTION
    RegPath[Level]:=KeyName;
    Tbls[Level].Clear;
    Reg.OpenKey(GetRefPath(Level)+KeyName, PasTouche);
    Reg.GetKeyNames(Tbls[Level]);
    Reg.CloseKey;
    Tbls[Level].Sort;
  // RECURRENCE
    for x := 0 to Tbls[Level].Count-1 do
      begin
        WriteLn(F, LevelToTabs(Level) + Tbls[Level][x] + '\');
        RecurseSubKeys(Tbls[Level][x], F, Level+1, Root);

        Form3.Label2.Caption := KeyName;
        if Form3.abort = true then Exit;
        Application.ProcessMessages;
      end;
    Tbls[Level].Clear;
  end;

  procedure ProcessMainBranch(Root : integer; var F : textfile);
  {= Enables recurrence on the 6 main keys =}
  var
    x : integer;
  begin
  // OPENING THE MAIN KEYS
    STL.Clear;
    Reg.RootKey := HKEY_CLASSES_ROOT + Root;
    WriteLn(F, '<== MAIN ==>   ::   ' + RootName[Root]);
    Reg.OpenKey('',PasTouche);
    Reg.GetKeyNames(STL);
    Reg.CloseKey;
    STL.Sort;
  // TREE PLANNING
    for x := 0 to STL.Count-1 do
      begin
        WriteLn(F, STL[x] + '\');
        RecurseSubKeys(STL[x], F, 0, Root);
        if Form3.abort = true then Exit;
      end;
    STL.Clear;
    WriteLn(F);
    WriteLn(F);
  end;

procedure GoRegTree(var F:textfile);
var
  x : byte;
begin
  Completed:=true;
  RG_MaxDepthFound:=0;
  KeyMaxDepth:='';
  for x := 0 to 6 do
    begin
      ProcessMainBranch(x,F);
      if Assigned(RG) then RG(RG_Progress);
      if Form3.abort = true then Exit;
    end;
  KeyMaxDepth:=KeyMaxDepth+'...';
  // The first subkeys of the 7 main keys have a depth of 0.
  // Therefore, MaxDepth needs to be incremented to get the actual depth found.
  RG_MaxDepthFound := RG_MaxDepthFound+1;
end;

procedure EnumRegistryFolders(FileName:string);
var
  x : byte;
begin
// CHECK FOR THE EXISTENCE OF THE FILE
  if FileExists(FileName) then
    if MessageDlg('Do you want to replace the file ?',
                    mtConfirmation,[mbYes,mbNo],0)=idNo then
      EXIT;
  if Assigned(RG) then RG(RG_Refresh);
// OPENING THE FILE FOR WRITING
  AssignFile(Fic,FileName);
  try
    Rewrite(Fic);
// OPENING OF THE REGISTER
    Reg := TRegistry.Create;
    try
// RECORDING OF THE REGISTER TREE STRUCTURE
      if Assigned(RG) then RG(RG_Start);
      GoRegTree(Fic);
//VIDE LA MEMOIRE
      for x:=0 to MAX_LEVEL do
        begin
          Tbls[x].Clear;
          RegPath[x]:='';
        end;
// VARIOUS CLOSURES
    finally
      Reg.Free;
    end;
  finally
    CloseFile(Fic);
  end;
  if Assigned(RG) then RG(RG_End);
end;

function RG_IsCompleted:boolean;
{= Indicates whether all keys have been considered =}
begin
  RG_IsCompleted:=Completed
end;

function RG_LongestKey:string;
{= Returns the name of the deepest key =}
begin
  RG_LongestKey:=KeyMaxDepth;
end;

procedure RG_SetProgressor(P:TRGProgression);
{= Initializing progress management =}
begin
  if Assigned(P) then RG:=P;
end;

initialization
  RG:=nil;
  STL:=TStringList.Create;
  for n:=0 to MAX_LEVEL do
    begin
      Tbls[n]:=TStringList.Create;
      RegPath[n]:='';
    end;

finalization
  STL.Free;
  for n:=0 to MAX_LEVEL do
    begin
      Tbls[n].Free;
      RegPath[n]:='';
    end;

end.
