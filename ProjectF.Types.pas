unit ProjectF.Types;

interface

uses
  FMX.Types,
  FMX.Objects,
  System.Generics.Collections,
  System.Classes;

var
  // Chiều rộng của game form
  GAME_FORM_WIDTH : Integer        = 640;
  GAME_FORM_HEIGHT: Integer        = 360;

const
  GAME_DATA_FILE          = 'app.data';
  GAME_LEVEL_MAX          = 6;
  GAME_DEFAULT_LEVEL      = 1;
  GAME_SCREEN_ANI_DELTA   = 320;
  // Các nút bấm
  GAME_BUTTON_BACK        = 0;
  GAME_BUTTON_MENU_BUTTON = 1;
  GAME_BUTTON_TOGGLE      = 2;
  ///////////////////////////
  GAME_COIN_HIDDEN        = 0;
  GAME_COIN_VISIBLE       = 1;
  //
  GAME_BUTTON_TRANISTION  = 125;
  // Tọa độ ban đầu của Backdrop
  BACKDROP_START_POSITION = -640;
  // Số lượng đồng xu tối đa trên màn hình
  COIN_COUNT              = 9;
  COIN_IMAGE_COUNT        = 6;
  COIN_DISPLAY_COUNT_MIN  = 3;
  COIN_IMAGE_WIDTH        = 50;
  // Hướng di chuyển
  DIRECTION_LEFT          = 0;
  DIRECTION_RIGHT         = 1;
  // Kích thước cá mập
  SHARK_SMALL_WIDTH       = 90;
  SHARK_SMALL_HEIGHT      = 33;
  SHARK_NORMAL_WIDTH      = 250;
  SHARK_NORMAL_HEIGHT     = 85;

  SHARK_IMAGE_WIDTH       = 500;
  SHARK_IMAGE_HEIGHT      = 169;
  // Con trai
  CLAM_WITH_PEARL         = 0;
  CLAM_WITHOUT_PEARL      = 1;
  CLAM_CLOSED_CLIP        = 2;
  // Vị trí hình ảnh của cá nhỏ trong ImageList
  SMALL_FISH              = 0;
  // Vị trí hình ảnh của cá mập trong ImageList
  SHARK_SMALL_LEFT        = 0;
  SHARK_SMALL_RIGHT       = 1;
  SHARK_NORMAL_LEFT       = 2;
  SHARK_NORMAL_RIGHT      = 3;
  SHARK_OPEN_MOUTH_LEFT   = 4;
  SHARK_OPEN_MOUTH_RIGHT  = 5;
  ///////////////////////////
  GAME_MAIN_FISH_KIND_MAX = 2;
  GAME_FISH_KIND          = 7;
  // Loại cá
  GAME_FISH_KIND_COUNT    = 11;
  GAME_FISH_KIND_FISH0    = 0;
  GAME_FISH_KIND_FISH1    = 1;
  GAME_FISH_KIND_FISH2    = 2;
  GAME_FISH_KIND_FISH3    = 3;
  GAME_FISH_KIND_FISH4    = 4;
  GAME_FISH_KIND_FISH5    = 5;
  GAME_FISH_KIND_FISH6    = 6;
  GAME_FISH_KIND_SHARK    = 7;
  GAME_FISH_KIND_CLAM_SHELL    = 8;
  GAME_FISH_KIND_CUTTLE_FISH   = 9;
  GAME_FISH_KIND_JELLEY_FISH   = 10;
type
  TGameState = (Stopped, Stopping, Running, Paused);
  TGameLanguage = (None, English, Vietnamese);
  TGameSound = (Click, Bomb, Eating, Reel, Coin, Die, LevelUp, Magic, PowerUp, Shark, Cuttle);

  // Record chứa thông tin chơi game
  TGameData = record
    BestScore: Integer;
    Fish: Integer;
    Coin: Integer;
    Pearl: Integer;
    Shark: Integer;
    SeaHorse: Integer;
    CuttleFish: Integer;
    FishingShip: Integer;
    NavyShip: Integer;
    Music: Integer;
    Sound: Integer;
    Character: Integer; // Loại cá mà người chơi chọn
  end;

  TTimerHelper = class helper for TTimer
    procedure SetInterval(const AInterval: Integer);
  end;

function AddThousandSeparator(S: string; Chr: Char = ','): string;


implementation

function AddThousandSeparator(S: string; Chr: Char = ','): string;
var
  I: Integer;
begin
  Result := S;
  I := Length(S) - 2;
  while I > 1 do
  begin
    Insert(Chr, Result, I);
    I := I - 3;
  end;
end;

{ TTimerHelper }

procedure TTimerHelper.SetInterval(const AInterval: Integer);
begin
  Self.Enabled := False;
  Self.Interval := AInterval;
  Self.Enabled := True;
end;

end.
