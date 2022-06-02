unit ProjectF.GameUtils.Clipper.PathData;

interface

uses
  ProjectF.Types,
  ProjectF.GameUtils.Clipper;

var
  ClipperClip: TPaths = nil; // Cá phụ
  ClipperSubject: TPaths = nil; // Cá chính
  ClipperSolution: TPaths = nil;

implementation

{$HINTS OFF}
{$WARNINGS OFF}

function IntPoint(const X, Y: Single): TIntPoint;
begin
  Result.X := Round(X);
  Result.Y := Round(Y);
end;

function FlipPath(const APath: TPath; const AWidth: Integer): TPath;
var
  i: Integer;
begin
  SetLength(Result, Length(APath));
  for i := Low(APath) to High(APath) do
  begin
    Result[i].X := AWidth - APath[i].X;
    Result[i].Y := APath[i].Y;
  end;
end;

procedure Init;
var
  i: Integer;
  r1, r2: Single; // Ratio1, Ratio2
  LPath: TPath;
begin
  SetLength(ClipperSubject, GAME_LEVEL_MAX * 2);

  for i := 0 to GAME_LEVEL_MAX - 1 do
  begin
    case i of
      0: begin r1 := 1; r2 := 1;           end;
      1: begin r1 := 64/45;  r2 := 61/46;  end;
      2: begin r1 := 85/45;  r2 := 82/46;  end;
      3: begin r1 := 103/45; r2 := 98/46;  end;
      4: begin r1 := 121/45; r2 := 115/46; end;
      5: begin r1 := 146/45; r2 := 135/46; end;
      6: begin r1 := 165/45; r2 := 155/46; end;
    end;

    SetLength(LPath, 10 );
    LPath[0] := IntPoint(0  * r1, 21 * r1);
    LPath[1] := IntPoint(21 * r1, 36 * r1);
    LPath[2] := IntPoint(18 * r1, 29 * r1);
    LPath[3] := IntPoint(28 * r1, 28 * r1);
    LPath[4] := IntPoint(32 * r1, 20 * r1);
    LPath[5] := IntPoint(30 * r1, 15 * r1);
    LPath[6] := IntPoint(19 * r1, 9  * r1);
    LPath[7] := IntPoint(46 * r1, 1  * r1);
    LPath[8] := IntPoint(29 * r1, 0  * r1);
    LPath[9] := IntPoint(7  * r1, 7  * r1);
    ClipperSubject[i] := LPath;

    SetLength(LPath, 9 );
    LPath[0] := IntPoint(0  * r2, 18 * r2);
    LPath[1] := IntPoint(4  * r2, 15 * r2);
    LPath[2] := IntPoint(8  * r2, 6  * r2);
    LPath[3] := IntPoint(22 * r2, 0  * r2);
    LPath[4] := IntPoint(45 * r2, 1  * r2);
    LPath[5] := IntPoint(21 * r2, 4  * r2);
    LPath[6] := IntPoint(37 * r2, 15 * r2);
    LPath[7] := IntPoint(31 * r2, 27 * r2);
    LPath[8] := IntPoint(12 * r2, 27 * r2);
    ClipperSubject[GAME_LEVEL_MAX + i] := LPath;
  end;

  SetLength(ClipperClip, GAME_FISH_KIND_COUNT * 2);
  // Cá nhỏ + Cá phụ 0
  SetLength(LPath, 10 );
  LPath[0] := IntPoint(28, 14);
  LPath[1] := IntPoint(23, 6);
  LPath[2] := IntPoint(16, 1);
  LPath[3] := IntPoint(7, 1);
  LPath[4] := IntPoint(7, 7);
  LPath[5] := IntPoint(2, 6);
  LPath[6] := IntPoint(1, 14);
  LPath[7] := IntPoint(7, 15);
  LPath[8] := IntPoint(7, 19);
  LPath[9] := IntPoint(20, 19);
  ClipperClip[0] := LPath;
  ClipperClip[1] := FlipPath(LPath, 29);

  // Cá phụ 1
  SetLength(LPath, 15 );
  LPath[0] := IntPoint(53, 17);
  LPath[1] := IntPoint(48, 14);
  LPath[2] := IntPoint(42, 4);
  LPath[3] := IntPoint(33, 1);
  LPath[4] := IntPoint(18, 0);
  LPath[5] := IntPoint(12, 6);
  LPath[6] := IntPoint(11, 13);
  LPath[7] := IntPoint(3, 9);
  LPath[8] := IntPoint(0, 16);
  LPath[9] := IntPoint(3, 23);
  LPath[10] := IntPoint(11, 19);
  LPath[11] := IntPoint(11, 25);
  LPath[12] := IntPoint(18, 29);
  LPath[13] := IntPoint(27, 29);
  LPath[14] := IntPoint(42, 24);
  ClipperClip[2] := LPath;
  ClipperClip[3] := FlipPath(LPath, 54);

  // Cá phụ 2
  SetLength(LPath, 15 );
  LPath[0] := IntPoint(77, 25);
  LPath[1] := IntPoint(76, 13);
  LPath[2] := IntPoint(72, 8);
  LPath[3] := IntPoint(65, 5);
  LPath[4] := IntPoint(54, 1);
  LPath[5] := IntPoint(42, 1);
  LPath[6] := IntPoint(17, 12);
  LPath[7] := IntPoint(0, 10);
  LPath[8] := IntPoint(5, 20);
  LPath[9] := IntPoint(1, 29);
  LPath[10] := IntPoint(17, 23);
  LPath[11] := IntPoint(20, 29);
  LPath[12] := IntPoint(36, 37);
  LPath[13] := IntPoint(62, 37);
  LPath[14] := IntPoint(72, 31);
  ClipperClip[4] := LPath;
  ClipperClip[5] := FlipPath(LPath, 78);

  // Cá phụ 3
  SetLength(LPath, 9 );
  LPath[0] := IntPoint(64, 32);
  LPath[1] := IntPoint(56, 15);
  LPath[2] := IntPoint(44, 4);
  LPath[3] := IntPoint(29, 0);
  LPath[4] := IntPoint(12, 4);
  LPath[5] := IntPoint(0, 20);
  LPath[6] := IntPoint(0, 43);
  LPath[7] := IntPoint(13, 54);
  LPath[8] := IntPoint(49, 47);
  ClipperClip[6] := LPath;
  ClipperClip[7] := FlipPath(LPath, 66);

  // Cá phụ 4
  SetLength(LPath, 14 );
  LPath[0] := IntPoint(96, 38);
  LPath[1] := IntPoint(80, 13);
  LPath[2] := IntPoint(53, 1);
  LPath[3] := IntPoint(27, 1);
  LPath[4] := IntPoint(13, 10);
  LPath[5] := IntPoint(18, 26);
  LPath[6] := IntPoint(1, 23);
  LPath[7] := IntPoint(0, 38);
  LPath[8] := IntPoint(9, 47);
  LPath[9] := IntPoint(31, 60);
  LPath[10] := IntPoint(53, 54);
  LPath[11] := IntPoint(53, 74);
  LPath[12] := IntPoint(73, 53);
  LPath[13] := IntPoint(87, 48);
  ClipperClip[8] := LPath;
  ClipperClip[9] := FlipPath(LPath, 97);

  // Cá phụ 5
  SetLength(LPath, 15 );
  LPath[0] := IntPoint(120, 42);
  LPath[1] := IntPoint(112, 40);
  LPath[2] := IntPoint(102, 22);
  LPath[3] := IntPoint(77, 14);
  LPath[4] := IntPoint(55, 1);
  LPath[5] := IntPoint(33, 23);
  LPath[6] := IntPoint(0, 12);
  LPath[7] := IntPoint(9, 36);
  LPath[8] := IntPoint(1, 59);
  LPath[9] := IntPoint(25, 50);
  LPath[10] := IntPoint(37, 68);
  LPath[11] := IntPoint(38, 83);
  LPath[12] := IntPoint(53, 76);
  LPath[13] := IntPoint(97, 73);
  LPath[14] := IntPoint(121, 51);
  ClipperClip[10] := LPath;
  ClipperClip[11] := FlipPath(LPath, 122);

  //Cá phụ 6
  SetLength(LPath, 26 );
  LPath[0] := IntPoint(162, 80);
  LPath[1] := IntPoint(163, 15);
  LPath[2] := IntPoint(151, 0);
  LPath[3] := IntPoint(126, 1);
  LPath[4] := IntPoint(108, 19);
  LPath[5] := IntPoint(91, 5);
  LPath[6] := IntPoint(67, 5);
  LPath[7] := IntPoint(47, 20);
  LPath[8] := IntPoint(43, 42);
  LPath[9] := IntPoint(31, 22);
  LPath[10] := IntPoint(2, 14);
  LPath[11] := IntPoint(3, 84);
  LPath[12] := IntPoint(31, 78);
  LPath[13] := IntPoint(39, 64);
  LPath[14] := IntPoint(76, 92);
  LPath[15] := IntPoint(55, 92);
  LPath[16] := IntPoint(40, 87);
  LPath[17] := IntPoint(39, 93);
  LPath[18] := IntPoint(81, 98);
  LPath[19] := IntPoint(93, 106);
  LPath[20] := IntPoint(64, 113);
  LPath[21] := IntPoint(63, 118);
  LPath[22] := IntPoint(83, 119);
  LPath[23] := IntPoint(105, 106);
  LPath[24] := IntPoint(133, 103);
  LPath[25] := IntPoint(147, 92);
  ClipperClip[12] := LPath;
  ClipperClip[13] := FlipPath(LPath, 164);

  // Cá mập
  SetLength(LPath, 17 );
  LPath[0] := IntPoint(250, 42);
  LPath[1] := IntPoint(236, 31);
  LPath[2] := IntPoint(149, 21);
  LPath[3] := IntPoint(129, 0);
  LPath[4] := IntPoint(121, 1);
  LPath[5] := IntPoint(114, 27);
  LPath[6] := IntPoint(37, 43);
  LPath[7] := IntPoint(0, 16);
  LPath[8] := IntPoint(23, 68);
  LPath[9] := IntPoint(14, 83);
  LPath[10] := IntPoint(75, 63);
  LPath[11] := IntPoint(129, 68);
  LPath[12] := IntPoint(120, 79);
  LPath[13] := IntPoint(155, 67);
  LPath[14] := IntPoint(173, 84);
  LPath[15] := IntPoint(188, 63);
  LPath[16] := IntPoint(227, 53);
  ClipperClip[14] := LPath;
  ClipperClip[15] := FlipPath(LPath, SHARK_NORMAL_WIDTH);

  // Con sò
  SetLength(LPath, 8 );
  LPath[0] := IntPoint(45, 59);
  LPath[1] := IntPoint(49, 54);
  LPath[2] := IntPoint(50, 46);
  LPath[3] := IntPoint(46, 41);
  LPath[4] := IntPoint(38, 39);
  LPath[5] := IntPoint(32, 44);
  LPath[6] := IntPoint(31, 54);
  LPath[7] := IntPoint(36, 58);
  ClipperClip[16] := LPath;
  ClipperClip[17] := FlipPath(LPath, 80);

  // Con mực
  SetLength(LPath, 8 );
  LPath[0] := IntPoint(44, 33);
  LPath[1] := IntPoint(53, 32);
  LPath[2] := IntPoint(45, 11);
  LPath[3] := IntPoint(35, 10);
  LPath[4] := IntPoint(17, 17);
  LPath[5] := IntPoint(7, 31);
  LPath[6] := IntPoint(22, 36);
  LPath[7] := IntPoint(38, 29);
  ClipperClip[18] := LPath;
  ClipperClip[19] := FlipPath(LPath, 65);

  // Con sứa
  SetLength(LPath, 6 );
  LPath[0] := IntPoint(3, 32);
  LPath[1] := IntPoint(19, 6);
  LPath[2] := IntPoint(44, 7);
  LPath[3] := IntPoint(56, 33);
  LPath[4] := IntPoint(45, 48);
  LPath[5] := IntPoint(13, 49);
  ClipperClip[20] := LPath;
  ClipperClip[21] := FlipPath(LPath, 60);

end;

initialization

  Init;

end.


{
Cá nhỏ 0:
SetLength(LPath, 10 );
LPath[0] := IntPoint(28, 14);
LPath[1] := IntPoint(23, 6);
LPath[2] := IntPoint(16, 1);
LPath[3] := IntPoint(7, 1);
LPath[4] := IntPoint(7, 7);
LPath[5] := IntPoint(2, 6);
LPath[6] := IntPoint(1, 14);
LPath[7] := IntPoint(7, 15);
LPath[8] := IntPoint(7, 19);
LPath[9] := IntPoint(20, 19);

Cá phụ 1:
SetLength(LPath, 15 );
LPath[0] := IntPoint(53, 17);
LPath[1] := IntPoint(48, 14);
LPath[2] := IntPoint(42, 4);
LPath[3] := IntPoint(33, 1);
LPath[4] := IntPoint(18, 0);
LPath[5] := IntPoint(12, 6);
LPath[6] := IntPoint(11, 13);
LPath[7] := IntPoint(3, 9);
LPath[8] := IntPoint(0, 16);
LPath[9] := IntPoint(3, 23);
LPath[10] := IntPoint(11, 19);
LPath[11] := IntPoint(11, 25);
LPath[12] := IntPoint(18, 29);
LPath[13] := IntPoint(27, 29);
LPath[14] := IntPoint(42, 24);

Cá phụ 2:
SetLength(LPath, 15 );
LPath[0] := IntPoint(77, 25);
LPath[1] := IntPoint(76, 13);
LPath[2] := IntPoint(72, 8);
LPath[3] := IntPoint(65, 5);
LPath[4] := IntPoint(54, 1);
LPath[5] := IntPoint(42, 1);
LPath[6] := IntPoint(17, 12);
LPath[7] := IntPoint(0, 10);
LPath[8] := IntPoint(5, 20);
LPath[9] := IntPoint(1, 29);
LPath[10] := IntPoint(17, 23);
LPath[11] := IntPoint(20, 29);
LPath[12] := IntPoint(36, 37);
LPath[13] := IntPoint(62, 37);
LPath[14] := IntPoint(72, 31);

Cá phụ 3:
SetLength(LPath, 9 );
LPath[0] := IntPoint(64, 32);
LPath[1] := IntPoint(56, 15);
LPath[2] := IntPoint(44, 4);
LPath[3] := IntPoint(29, 0);
LPath[4] := IntPoint(12, 4);
LPath[5] := IntPoint(0, 20);
LPath[6] := IntPoint(0, 43);
LPath[7] := IntPoint(13, 54);
LPath[8] := IntPoint(49, 47);

Cá phụ 4:
SetLength(LPath, 14 );
LPath[0] := IntPoint(96, 38);
LPath[1] := IntPoint(80, 13);
LPath[2] := IntPoint(53, 1);
LPath[3] := IntPoint(27, 1);
LPath[4] := IntPoint(13, 10);
LPath[5] := IntPoint(18, 26);
LPath[6] := IntPoint(1, 23);
LPath[7] := IntPoint(0, 38);
LPath[8] := IntPoint(9, 47);
LPath[9] := IntPoint(31, 60);
LPath[10] := IntPoint(53, 54);
LPath[11] := IntPoint(53, 74);
LPath[12] := IntPoint(73, 53);
LPath[13] := IntPoint(87, 48);

Cá phụ 5:
SetLength(LPath, 21 );
LPath[0] := IntPoint(119, 49);
LPath[1] := IntPoint(112, 26);
LPath[2] := IntPoint(91, 11);
LPath[3] := IntPoint(82, 1);
LPath[4] := IntPoint(59, 4);
LPath[5] := IntPoint(64, 12);
LPath[6] := IntPoint(38, 22);
LPath[7] := IntPoint(1, 10);
LPath[8] := IntPoint(1, 36);
LPath[9] := IntPoint(6, 49);
LPath[10] := IntPoint(23, 37);
LPath[11] := IntPoint(34, 35);
LPath[12] := IntPoint(41, 41);
LPath[13] := IntPoint(38, 44);
LPath[14] := IntPoint(36, 57);
LPath[15] := IntPoint(47, 58);
LPath[16] := IntPoint(53, 68);
LPath[17] := IntPoint(74, 76);
LPath[18] := IntPoint(79, 84);
LPath[19] := IntPoint(87, 73);
LPath[20] := IntPoint(100, 72);

Cá phụ 6:

SetLength(LPath, 26 );
LPath[0] := IntPoint(162, 80);
LPath[1] := IntPoint(163, 15);
LPath[2] := IntPoint(151, 0);
LPath[3] := IntPoint(126, 1);
LPath[4] := IntPoint(108, 19);
LPath[5] := IntPoint(91, 5);
LPath[6] := IntPoint(67, 5);
LPath[7] := IntPoint(47, 20);
LPath[8] := IntPoint(43, 42);
LPath[9] := IntPoint(31, 22);
LPath[10] := IntPoint(2, 14);
LPath[11] := IntPoint(3, 84);
LPath[12] := IntPoint(31, 78);
LPath[13] := IntPoint(39, 64);
LPath[14] := IntPoint(76, 92);
LPath[15] := IntPoint(55, 92);
LPath[16] := IntPoint(40, 87);
LPath[17] := IntPoint(39, 93);
LPath[18] := IntPoint(81, 98);
LPath[19] := IntPoint(93, 106);
LPath[20] := IntPoint(64, 113);
LPath[21] := IntPoint(63, 118);
LPath[22] := IntPoint(83, 119);
LPath[23] := IntPoint(105, 106);
LPath[24] := IntPoint(133, 103);
LPath[25] := IntPoint(147, 92);

Con sứa:

SetLength(LPath, 6 );
LPath[0] := IntPoint(3, 32);
LPath[1] := IntPoint(19, 6);
LPath[2] := IntPoint(44, 7);
LPath[3] := IntPoint(56, 33);
LPath[4] := IntPoint(45, 48);
LPath[5] := IntPoint(13, 49);

Con mực:

SetLength(LPath, 8 );
LPath[0] := IntPoint(44, 33);
LPath[1] := IntPoint(53, 32);
LPath[2] := IntPoint(45, 11);
LPath[3] := IntPoint(35, 10);
LPath[4] := IntPoint(17, 17);
LPath[5] := IntPoint(7, 31);
LPath[6] := IntPoint(22, 36);
LPath[7] := IntPoint(38, 29);

Cá mập:

SetLength(LPath, 17 );
LPath[0] := IntPoint(250, 42);
LPath[1] := IntPoint(236, 31);
LPath[2] := IntPoint(149, 21);
LPath[3] := IntPoint(129, 0);
LPath[4] := IntPoint(121, 1);
LPath[5] := IntPoint(114, 27);
LPath[6] := IntPoint(37, 43);
LPath[7] := IntPoint(0, 16);
LPath[8] := IntPoint(23, 68);
LPath[9] := IntPoint(14, 83);
LPath[10] := IntPoint(75, 63);
LPath[11] := IntPoint(129, 68);
LPath[12] := IntPoint(120, 79);
LPath[13] := IntPoint(155, 67);
LPath[14] := IntPoint(173, 84);
LPath[15] := IntPoint(188, 63);
LPath[16] := IntPoint(227, 53);

Con sò:

SetLength(LPath, 8 );
LPath[0] := IntPoint(45, 59);
LPath[1] := IntPoint(49, 54);
LPath[2] := IntPoint(50, 46);
LPath[3] := IntPoint(46, 41);
LPath[4] := IntPoint(38, 39);
LPath[5] := IntPoint(32, 44);
LPath[6] := IntPoint(31, 54);
LPath[7] := IntPoint(36, 58);

Cá chính: 0, 1
SetLength(LPath, 10 );
LPath[0] := IntPoint(0, 21);
LPath[1] := IntPoint(21, 36);
LPath[2] := IntPoint(18, 29);
LPath[3] := IntPoint(28, 28);
LPath[4] := IntPoint(32, 20);
LPath[5] := IntPoint(30, 15);
LPath[6] := IntPoint(19, 9);
LPath[7] := IntPoint(46, 1);
LPath[8] := IntPoint(29, 0);
LPath[9] := IntPoint(7, 7);

Cá chính 1:

SetLength(LPath, 9 );
LPath[0] := IntPoint(0, 18);
LPath[1] := IntPoint(4, 15);
LPath[2] := IntPoint(8, 6);
LPath[3] := IntPoint(22, 0);
LPath[4] := IntPoint(45, 1);
LPath[5] := IntPoint(21, 4);
LPath[6] := IntPoint(37, 15);
LPath[7] := IntPoint(31, 27);
LPath[8] := IntPoint(12, 27);

}
