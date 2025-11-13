unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, RegTreeList, Vcl.Samples.Gauges, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    Label5: TLabel;
    Button2: TButton;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure Progress(Event:word); // forced to depend on the main class
                                    // otherwise, a compatibility error
  public
    { Public-Deklarationen }
    abort : boolean;
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.dfm}
function Get_File_Size4(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  FH := FindFirstFile(PChar(S), FD);
  if FH = INVALID_HANDLE_VALUE then Result := 0
  else
    try
      Result := FD.nFileSizeHigh;
      Result := Result shl 32;
      Result := Result + FD.nFileSizeLow;
    finally
      //CloseHandle(FH);
    end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  abort := true;
  Form3.CloseQuery;
  Button2.Enabled := true;
  Label1.Caption := 'The writing process was aborted.';
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Close();
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  RG_SetProgressor(Progress);
  EnumRegistryFolders(Edit1.Text);
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Panel1.DoubleBuffered := true;
  Form3.ProgressBar1.Style := pbstMarquee;
end;

procedure TForm3.Progress(Event:Word);
var
  r : string;
begin
  case Event of
    RG_Base: {Nothing} ;
    RG_Start:    begin
                  Form3.ProgressBar1.Position := 0;
                  Form3.ProgressBar1.Max := 7;
                 end;
    RG_Progress: begin
                   Form3.ProgressBar1.Position := Form3.ProgressBar1.Position + 1;
                   Sleep(300);  // just to see the progress gauge
                 end;
    RG_End:      begin
                  Beep;
                  Form3.ProgressBar1.Style := pbstNormal;
                  Form3.ProgressBar1.Position := 0;
                  r := 'Process completed.'+#13#10;
                  r := r + #13#10 + 'The maximum depth found is '+IntToStr(RG_MaxDepthFound)+'.';
                  r := r + #13#10 + 'for the key "'+RG_LongestKey+'".';

                  Form3.Label6.Caption := IntToStr(Get_File_Size4(PChar(Form3.Edit1.Text)) div 1000) + ' Kb';
                  Form3.Label1.Caption := 'Progress finish.';
                  if not RG_IsCompleted then
                    r:=r+#13#10#13#10+'However, some keys have not been written down.';
                  Beep;
                  MessageDlg(r,mtConfirmation,[mbOk],0);
                 end;
    // allows you to break the unsightly box requesting a file replacement
    RG_Refresh : Form3.Refresh;
    else { it's impossible } ;
  end;
end;

end.
