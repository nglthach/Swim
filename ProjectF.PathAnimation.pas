unit ProjectF.PathAnimation;

interface

uses
  System.Classes,
  System.Math,
  System.Math.Vectors,
  System.Types,
  FMX.Ani,
  FMX.Controls,
  FMX.Graphics,
  FMX.Types;

type
  PPolygon = ^TPolygon;
  // Hack TControl để dùng thuộc tính RotationAngle
  THackControl = class(TControl)
    // Đưa thuộc tính RotationAngle ra ngoài
    property RotationAngle;
  end;

  TPathAnimationFXData = record
    Polygon: PPolygon;
    Spline: TSpline;
  end;

  TPathAnimationFX = class(TAnimation)
  private
    FObj: TControl;
    FStart: TPointF;
    FRotate: Boolean;
    function EnabledStored: Boolean;
  protected
    procedure ProcessAnimation; override;
  public
    // Dùng con trỏ để khỏi khởi tạo lại dữ liệu mỗi khi bắt đầu Animation
    Polygon: PPolygon;
    Spline: TSpline;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Start; override;
    class procedure CreateAnimationData(const APath: TPathData; var APolygon: TPolygon; var ASpline: TSpline); overload;
    class procedure CreateAnimationData(const APath: TPathData; var AData: TPathAnimationFXData); overload;
  published
    property AnimationType default TAnimationType.In;
    property AutoReverse default False;
    property Enabled stored EnabledStored;
    property Delay;
    property Duration nodefault;
    property Interpolation default TInterpolationType.Linear;
    property Inverse default False;
    property Loop default False;
    property OnProcess;
    property OnFinish;
    property Rotate: Boolean read FRotate write FRotate default False;
    property Trigger;
    property TriggerInverse;
  end;

implementation

{ TPathAnimationFX }

constructor TPathAnimationFX.Create(AOwner: TComponent);
begin
  inherited;

  Polygon := nil;
  Spline := nil;
end;

class procedure TPathAnimationFX.CreateAnimationData(const APath: TPathData; var APolygon: TPolygon; var ASpline: TSpline);
var
  I: Integer;
begin
  APath.FlattenToPolygon(APolygon);

  for I := Length(APolygon) - 1 downto 0 do
  begin
    if (APolygon[I].X = PolygonPointBreak.X) and (APolygon[I].Y = PolygonPointBreak.Y) then
    begin
      if I < Length(APolygon) - 1 then
        APolygon[I] := APolygon[I + 1];
      SetLength(APolygon, Length(APolygon) - 1);
    end;
  end;

  ASpline := TSpline.Create(APolygon);
end;

class procedure TPathAnimationFX.CreateAnimationData(const APath: TPathData; var AData: TPathAnimationFXData);
begin
  // Cấp phát bộ nhớ
  New(AData.Polygon);
  // Tạo dữ liệu chuyển động
  CreateAnimationData(APath, AData.Polygon^, AData.Spline);
end;

function TPathAnimationFX.EnabledStored: Boolean;
begin
  if ActionClient then
    Result := True
  else
    Result := Enabled;
end;

procedure TPathAnimationFX.ProcessAnimation;

  function DeltaBetween(const Point1, Point2: TPointF): Single;
  begin
    if Point1.CrossProduct(Point2) < 0 then
      Result := ArcCos(Point1.AngleCosine(Point2))
    else
      Result := - ArcCos(Point1.AngleCosine(Point2));
  end;

var
  OldP, P1, Delta: TPointF;
begin
  if (Length(Polygon^) > 0) and (FObj <> nil) then
  begin
    OldP := FObj.Position.Point;
    Spline.SplineXY(NormalizedTime * High(Polygon^), P1.X, P1.Y);
    FObj.Position.X := FStart.X + P1.X;
    FObj.Position.Y := FStart.Y + P1.Y;
    if FRotate and (NormalizedTime <> 0) and (NormalizedTime <> 1) and ((OldP.X <> FObj.Position.X) and
      (OldP.Y <> FObj.Position.Y)) then
    begin
      Delta := FObj.Position.Point - OldP;

      if Inverse then
        THackControl(FObj).RotationAngle := 180 + RadToDeg(DeltaBetween(Delta, TPointF.Create(0, 1)))
      else
        THackControl(FObj).RotationAngle := RadToDeg(DeltaBetween(Delta, TPointF.Create(0, 1)));
    end;
  end;
end;

procedure TPathAnimationFX.Start;
begin
  if Parent is TControl then
    FObj := TControl(Parent)
  else
    FObj := nil;
  if FObj <> nil then
    FStart := FObj.Position.Point;
  inherited;
end;

end.
