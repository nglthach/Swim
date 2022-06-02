  {$IF Defined(ANDROID)}
  FMX.FontGlyphs.Android in 'FMX\FMX.FontGlyphs.Android.pas',
  {$ELSEIF Define(MSWINDOWS)}
  FMX.Switch.Win in 'FMX\FMX.Switch.Win.pas',
  {$ENDIF }