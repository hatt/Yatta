program YMC;

uses
  FastMM4,
  Forms,
  Main in 'Main.pas' {MainForm},
  FrameGet in 'frameget.pas',
  progress in 'progress.pas' {ProgressForm},
  YMCPlugin in 'YMCPlugin.pas',
  YMCInternalPlugins in 'YMCInternalPlugins.pas',
  telecide in 'telecide.pas' {TelecideForm},
  crop in 'crop.pas' {CropForm},
  Asif in '..\Asif.pas',
  AsifAdditions in '..\AsifAdditions.pas',
  tfm in 'tfm.pas' {TFMForm},
  YMCTask in 'YMCTask.pas',
  FunctionHooking in 'FunctionHooking.pas',
  yshared in '..\yshared.pas',
  scxvid in 'scxvid.pas' {SCXvidForm},
  cutter in 'cutter.pas' {CutterForm},
  resize in 'resize.pas' {ResizeForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Yatta Metrics Collector';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

