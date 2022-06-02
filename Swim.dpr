program Swim;

// Swim - Bơi đi

{$R *.res}
{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Types,
  Skia.FMX,
  ProjectF.GameForm in 'ProjectF.GameForm.pas' {GameForm},
  ProjectF.PathAnimation in 'ProjectF.PathAnimation.pas',
  ProjectF.Types in 'ProjectF.Types.pas',
  ProjectF.GameUtils.Clipper.PathData in 'ProjectF.GameUtils.Clipper.PathData.pas';

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Landscape];
  Application.CreateForm(TGameForm, GameForm);
  Application.Run;
end.

