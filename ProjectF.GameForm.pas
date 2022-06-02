unit ProjectF.GameForm;

interface

uses
  System.Classes,
  System.DateUtils,
  System.Devices,
  System.Generics.Collections,
  System.ImageList,
  System.Notification,
  System.SysUtils,
  System.IOUtils,
  System.Types,
  System.UITypes,
  System.Variants,
  FMX.Ani,
  FMX.Controls,
  FMX.Controls.Presentation,
  FMX.Dialogs,
  FMX.Effects,
  FMX.Filter.Effects,
  FMX.Forms,
  FMX.Graphics,
  FMX.ImgList,
  FMX.Layouts,
  FMX.Media,
  FMX.Objects,
  FMX.Platform,
  FMX.StdCtrls,
  FMX.Types,
  ProjectF.GameUtils.Clipper,
  ProjectF.GameUtils.Clipper.PathData,
  ProjectF.Types,
  ProjectF.PathAnimation,
  Skia,
  Skia.FMX;

type

  TRectangle = class(FMX.Objects.TRectangle)
  public
    AnimationStep        : Single;
    Data                 : Integer;
    Direction            : Integer;
    ImageIndex           : Integer;
    Kind                 : Integer;
    ImageCount           : Integer;
    Speed                : Single;
    ClipperPathDataIndex : Integer;
    ImageList            : TCustomImageList;
  public
    procedure FillImage;
    procedure NextImage; virtual;
  end;

  TEatingEffectRectangle = class(TRectangle)
  public
    procedure NextImage; override;
  end;

  TGameObjectList = TList<TRectangle>;

  TGameForm = class(TForm)
    AniAlert                       : TFloatAnimation;
    AniAngryProgress               : TColorAnimation;
    AniBomb                        : TFloatAnimation;
    AniEffectAngry                 : TFloatAnimation;
    AniFishingLineStep1            : TFloatAnimation;
    AniFishingLineStep2            : TFloatAnimation;
    AniShieldProgress              : TColorAnimation;
    AniTorpedo                     : TFloatAnimation;
    Background1                    : TRectangle;
    Background2                    : TRectangle;
    Background3                    : TRectangle;
    Banner                         : TRectangle;
    BannerContainer                : TRectangle;
    BombEffect                     : TRippleEffect;
    BtnBages                       : TRectangle;
    BtnExit                        : TRectangle;
    BtnGameCompleteFacebook        : TRectangle;
    BtnGameCompleteHome            : TRectangle;
    BtnGameCompleteReplay          : TRectangle;
    BtnGameCompleteTwitter         : TRectangle;
    BtnGameLeave                   : TRectangle;
    BtnGameLeaveImage              : TRectangle;
    BtnGamePausedExit              : TRectangle;
    BtnGamePausedResume            : TRectangle;
    BtnGameSettingBack             : TRectangle;
    BtnGameSettingForward          : TRectangle;
    BtnGameStatsReturn             : TRectangle;
    BtnPlay                        : TRectangle;
    BtnPopupLeaveNo                : TRectangle;
    BtnPopupLeaveYes               : TRectangle;
    BtnSetting                     : TRectangle;
    BtnSettingReturn               : TRectangle;
    Bubble                         : TRectangle;
    CircleAlert                    : TCircle;
    CircleAngryProgress            : TCircle;
    CircleShieldProgress           : TCircle;
    ClamShell                      : TRectangle;
    DarkPigment                    : TRectangle;
    DarkPigment1                   : TRectangle;
    DarkPigment2                   : TRectangle;
    DarkPigment3                   : TRectangle;
    DarkPigmentContainer           : TRectangle;
    EffectAngry                    : TGlowEffect;
    FishingHook                    : TRectangle;
    FishingLine                    : TLine;
    FloatAnimation1                : TFloatAnimation;
    FloatAnimation2                : TFloatAnimation;
    FloatAnimation3                : TFloatAnimation;
    FloatAnimation4                : TFloatAnimation;
    FloatAnimation5                : TFloatAnimation;
    FloatAnimation6                : TFloatAnimation;
    AniShieldAlert: TFloatAnimation;
    AniBestScore: TFloatAnimation;
    GameComplete                   : TRectangle;
    GameMenu                       : TRectangle;
    GamePopupLeave                 : TRectangle;
    GamePopupPaused                : TRoundRect;
    GameSetting                    : TRectangle;
    GameSettingFishPlaceHolder     : TRectangle;
    GameStats                      : TRectangle;
    GlowEffect1                    : TGlowEffect;
    GlowEffect2                    : TGlowEffect;
    GlowEffect3                    : TGlowEffect;
    GlowEffect4                    : TGlowEffect;
    IlButtonActive                 : TImageList;
    IlButtonNormal                 : TImageList;
    IlClamShell                    : TImageList;
    IlCoin                         : TImageList;
    IlCuttle                       : TImageList;
    IlEatingEffect                 : TImageList;
    IlFish                         : TImageList;
    IlFishRight                    : TImageList;
    IlJellyFish                    : TImageList;
    IlMainFish                     : TImageList;
    IlShark                        : TImageList;
    Layout                         : TRectangle;
    LblCoinCount                   : TSkLabel;
    LblExclamation                 : TSkLabel;
    LblExit                        : TSkLabel;
    LblFishCount                   : TSkLabel;
    LblGameCompleteCoin            : TSkLabel;
    LblGameCompleteFishCount       : TSkLabel;
    LblGameCompleteIcon1           : TRectangle;
    LblGameCompleteIcon2           : TRectangle;
    LblGameCompleteIcon3           : TRectangle;
    LblGameCompletelTitle          : TSkLabel;
    LblGameCompleteScore           : TSkLabel;
    LblGameCompleteTime            : TSkLabel;
    LblGameMenuTitle               : TSkLabel;
    LblGameScore                   : TSkLabel;
    LblGameScoreSuper              : TSkLabel;
    LblGameSettingBtnReturn        : TSkLabel;
    LblGameSettingMusic            : TSkLabel;
    LblGameSettingSound            : TSkLabel;
    LblGameSettingTitle            : TSkLabel;
    LblGameStatsBestScore          : TSkLabel;
    LblGameStatsCoin               : TSkLabel;
    LblGameStatsFish               : TSkLabel;
    LblGameStatsLabel1             : TSkLabel;
    LblGameStatsLabel2             : TSkLabel;
    LblGameStatsLabel3             : TSkLabel;
    LblGameStatsLabel4             : TSkLabel;
    LblGameStatsLabel5             : TSkLabel;
    LblGameStatsPearl              : TSkLabel;
    LblGameStatsReturn             : TSkLabel;
    LblGameStatsShark              : TSkLabel;
    LblGameStatsTitle              : TSkLabel;
    LblHealth                      : TSkLabel;
    LblPlay                        : TSkLabel;
    LblPopupLeaveText              : TSkLabel;
    LblPopupLeaveTitle             : TSkLabel;
    LblSetting                     : TSkLabel;
    Line1                          : TLine;
    MpBackgroundMusic              : TMediaPlayer;
    MpSoundBomb                    : TMediaPlayer;
    MpSoundClick                   : TMediaPlayer;
    MpSoundCoin1                   : TMediaPlayer;
    MpSoundCoin2                   : TMediaPlayer;
    MpSoundCoin3                   : TMediaPlayer;
    MpSoundDie                     : TMediaPlayer;
    MpSoundEating                  : TMediaPlayer;
    MpSoundFishingReel             : TMediaPlayer;
    MpSoundLevelUp                 : TMediaPlayer;
    MpSoundMagic                   : TMediaPlayer;
    MpSoundPowerUp                 : TMediaPlayer;
    MpSoundReel                    : TMediaPlayer;
    MpSoundShark                   : TMediaPlayer;
    NonVisualControls              : TRectangle;
    NotificationCenter             : TNotificationCenter;
    PieAngryProgress               : TPie;
    PieShieldProgress              : TPie;
    RectBestScore                  : TRectangle;
    RectGameScore                  : TRectangle;
    RectString1                    : TRectangle;
    RectString2                    : TRectangle;
    RectString3                    : TRectangle;
    RectString4                    : TRectangle;
    SeaHorse                       : TRectangle;
    ShieldEffect                   : TCircle;
    TheBattleShip                  : TRectangle;
    TheFish                        : TRectangle;
    TheFishImage                   : TRectangle;
    TheFishImageWrapper            : TRectangle;
    TheFishingShip                 : TRectangle;
    TheShark                       : TRectangle;
    TheTorpedo                     : TRectangle;
    TimerAngry                     : TTimer;
    TimerClamShellCreation         : TTimer;
    TimerCoinCreatation            : TTimer;
    TimerDarkPigment               : TTimer;
    TimerEatingEffect              : TTimer;
    TimerFishCreation              : TTimer;
    TimerFisherManCreation         : TTimer;
    TimerGameSpeed                 : TTimer;
    TimerHealth                    : TTimer;
    TimerJellyOrCuttleFishCreation : TTimer;
    TimerMusic                     : TTimer;
    TimerPlayingDurationCounter    : TTimer;
    TimerSeaHorseCreation          : TTimer;
    TimerSharkCreation             : TTimer;
    TimerShield                    : TTimer;
    TimerShipCreation              : TTimer;
    TimerSmallFishCreation         : TTimer;
    ToggleMusic                    : TRectangle;
    ToggleSound                    : TRectangle;
    Coral1: TRectangle;
    Coral2: TRectangle;
    Coral3: TRectangle;
    Coral4: TRectangle;
    Coral5: TRectangle;
    Coral6: TRectangle;
    TimerCoralCreation: TTimer;
    Coral8: TRectangle;
    Coral7: TRectangle;
    Coral9: TRectangle;
    LayoutWrapper: TLayout;
    MpSoundCuttle: TMediaPlayer;
    TimerHideSuperDotTip: TTimer;
    TimerCollisionProcess: TTimer;
    procedure AniAlertFinish(Sender: TObject);
    procedure AniBombFinish(Sender: TObject);
    procedure AniFishingLineStep1Finish(Sender: TObject);
    procedure AniFishingLineStep2Finish(Sender: TObject);
    procedure AniTorpedoFinish(Sender: TObject);
    procedure AppBecameActive(Sender: TObject);
    procedure AppEnteredBackground(Sender: TObject);
    procedure AppEventsBecameActive(Sender: TObject);
    procedure AppFinishedLaunching(Sender: TObject);
    procedure AppWillTerminate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LayoutMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure LayoutMouseLeave(Sender: TObject);
    procedure LayoutMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure LayoutMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure OnBtnBagesClick(Sender: TObject);
    procedure OnGameCompleteButtonClick(Sender: TObject);
    procedure OnGameLeaveClick(Sender: TObject);
    procedure OnGamePausedButtonClick(Sender: TObject);
    procedure OnGameSettingMainFishKindClick(Sender: TObject);
    procedure OnLeavePopupButtonClick(Sender: TObject);
    procedure OnMenuButtonClick(Sender: TObject);
    procedure OnToggleClick(Sender: TObject);
    procedure TheFishResize(Sender: TObject);
    procedure TimerAngryTimer(Sender: TObject);
    procedure TimerClamShellCreationTimer(Sender: TObject);
    procedure TimerCoinCreatationTimer(Sender: TObject);
    procedure TimerDarkPigmentTimer(Sender: TObject);
    procedure TimerEatingEffectTimer(Sender: TObject);
    procedure TimerFishCreationTimer(Sender: TObject);
    procedure TimerGameSpeedTimer(Sender: TObject);
    procedure TimerHealthTimer(Sender: TObject);
    procedure TimerJellyOrCuttleFishCreationTimer(Sender: TObject);
    procedure TimerMusicTimer(Sender: TObject);
    procedure TimerPlayingDurationCounterTimer(Sender: TObject);
    procedure TimerSeaHorseCreationTimer(Sender: TObject);
    procedure TimerShieldTimer(Sender: TObject);
    procedure TimerSmallFishCreationTimer(Sender: TObject);
    procedure TimerCoralCreationTimer(Sender: TObject);
    procedure TimerHideSuperDotTipTimer(Sender: TObject);
    procedure TimerCollisionProcessTimer(Sender: TObject);
  private
    // Biến lưu trữ trạng thái game
    class var FGameState: TGameState;
  private
    FAppIsActive: Boolean;
    // Đối tượng xử lý cá va chạm nhau
    FClipper: TClipper;
    // Biến lưu trữ loại cá chính
    FMainFishImageIndex: Integer;
    // Tọa độ của chú cá theo chiều thẳng đứng
    FFishVerticalCoordinate: Single;
    // Tọa độ nhấn chuột (dùng để di chuyển cá)
    FTapPosition: TPointF;
    // Đang nhấn chuột
    FDragging: Boolean;
    // Đang thay đổi kích thước của chú cá
    FFishResizing: Boolean;
    // Cờ báo hiệu đã thả lưỡi câu cá chưa
    FStartFishingLineIsStarted: Boolean;
    // Chu kì chuyển động của dãi đất + đá phía trước
    FDuration1: Single;
    // Chu kì chuyển động của dãi san hô phía sau
    FDuration2: Single;
    // Bước dịch chuyển của dãi đất + đá phía trước
    FStep1: Single;
    // Bước dịch chuyển của dãi san hô phía sau
    FStep2: Single;
    // Bước dịch chuyển của tiền xu
    FStep3: Single;
    // Sức mạnh siêu nhiên cho cá
    FShield: Integer;
    // Ngưỡng bật Shield cho cá
    FShieldThreshold: Integer;
    // Khu vực cho phép con cá di chuyển
    FAllowedArea: TRectF;
    // Danh sách chứa toàn bộ các con cá
    FFishes: TGameObjectList;
    // Danh sách cache các cong cá
    FCachedFishes: array [0..6, DIRECTION_LEFT..DIRECTION_RIGHT] of TGameObjectList;
    // Danh sách chứa các con sứa
    FJellyFishes, FCachedJellyFishes: TGameObjectList;
    // Danh sách các con mực
    FCuttleFishes, FCachedCuttleFishes: TGameObjectList;
    // Danh sách hiệu ứng ăn cá
    FEatingEffectList: TGameObjectList;
    // Danh sách hiệu ứng ăn cá đã cache
    FCachedEatingEffectList: TGameObjectList;
    // Danh sách các bong bóng
    FBubbleList: TGameObjectList;
    // Danh sách các bong bóng đã cache
    FCachedBubbleList: TGameObjectList;
    // Danh sách các đồng xu
    FCoins: array [1..9] of TRectangle;
    // Danh sách các cây san hô
    FCorals: array [0..8] of TRectangle;
    // Mảng chứa những con cá nhỏ
    FSmallFishes: array [1..10] of TRectangle;
    // Mảng chứa những Animation điều khiển cá nhỏ
    FSmallFishAnimations: array [1..10] of TPathAnimationFX;
    // Mảng chứa dữ liệu cho FSmallFishAnimations
    FSmallFishAnimationData: array [1..5] of TPathAnimationFXData;
    // Hướng xuất phát của con cá mập
    FTheSharkDirection: Integer;
    // Biến lưu điểm
    FGameScore: Integer;
    // Biến lưu số lượng tiền vàng
    FCoinCount: Integer;
    // Biến lưu trữ số kg cá ăn được
    FFishCount: Integer;
    // Biến lưu khoản thời gian di chuyển được
    FPlayingDuration: Integer;
    // Biến lưu trữ sức khỏe của con cá (mỗi 1s ko ăn được cá sẽ giảm 1, ăn cá sẽ tăng lên)
    FHealth: Integer;
    // Biến lưu trữ cấp độ hiện tại của con cá
    FLevel: Integer;
    // Cờ xem có đang dùng "sự giận dữ" không
    FAngry: Integer;
    // Tốc độ chơi game
    FGameSpeed: Real;
    // Mức độ tích lũy sự giận dữ
    FAngryThreshold: Integer;
    // Tỉ lệ màn hình game/design
    FScreenScale: Single;
    // Thread tạo hiệu ứng chuyển động cho dãi đất + san hô
    FBackdropThread: TThread;
    // Thread tạo hiệu ứng chuyển động cho đồng xu và con mực
    FCoinAndCuttleFishAnimationThread: TThread;
    // Thread tạo hiệu ứng chuyển động của các con sứa
    FJellyFishAnimationThread: TThread;
    // Thread tạo hiệu ứng chuyển động cho cá mập
    FSharkThread: TThread;
    // Thread tạo tàu cá/tàu quân sự
    FShipThread: TThread;
    // Cờ báo hiệu đã thả bom chưa
    FBombFlag: Boolean;
    // Cờ báo hiệu đã hiển thị báo động
    FAlertSignAlreadyShown: Boolean;
    // Màn hình đang được hiển thị
    FActiveScreen: TRectangle;
    // Âm thanh
    FSoundEnabled: Boolean;
    // Nhạc nền
    FMusicEnabled: Boolean;
    // Ngôn ngữ
    FLanguage: TGameLanguage;
    // Thống kê chơi game
    FGameData: TGameData;
    // Mảng chứa các media player phát âm "ăn tiền"
    FCoinSoundMediaPlayer: array [0..2] of TMediaPlayer;
    // Hàm hiệu chỉnh thời gian các đối tượng chuyển động so với BackgroundBottom1
    function AjustedDuration(const ADuration: Single): Single;
    // Thủ tục hiệu chỉnh tốc độ sinh cá
    procedure AjustFishCreationSpeed;
    // Thủ tục đặt giá trị cho FAngry
    procedure SetAngry(const AValue: Integer);
    // Thủ tục đặt giá trị cho FAngryThreshold
    procedure SetAngryThreshold(const AVAlue: Integer);
    // Thủ tục gán thời gian hiệu lực cho Shield
    procedure SetShield(const AValue: Integer);
    // Thủ tục đặt giá trị cho FShieldThreshold
    procedure SetShieldThreshold(const AValue: Integer);
    // Thủ tục đổi trạng thái game
    procedure SetGameState(const AValue: TGameState);
    // Thủ tục đổi giá trị game speed
    procedure SetGameSpeed(const AValue: Real);
    // Thủ tục đặt giá trị cho FCoinCount
    procedure SetCoinCount(const AValue: Integer);
    // Thủ tục đặt giá trị cho FFishCount
    procedure SetFishCount(const AValue: Integer);
    // Thủ tục đặt giá trị cho FPlayingDuration
    procedure SetPlayingDuration(const AValue: Integer);
    // Thủ tục đặt giá trị cho FHealth
    procedure SetHealth(const AValue: Integer);
    // Thủ tục đặt giá trị cho FLevel
    procedure SetLevel(const AValue: Integer);
    // Thủ tục đặt giá trị cho FSoundEnabled
    procedure SetSound(const AValue: Boolean);
    // Thủ tục đặt giá trị cho FMusicEnabled
    procedure SetMusic(const AValue: Boolean);
    // Thủ tục đặg giá trị cho FLanguage
    procedure SetLanguage(const AValue: TGameLanguage);
    // Thủ tục đặt trạng thái cho các Timer
    procedure SetTimerStatus(const AStatus: Boolean);
    // Thủ tục đặt giá trị cho FMainFishImageIndex
    procedure SetMainFishImageIndex(const AValue: Integer);
    /// <summary>
    /// Thủ tục đặt trạng thái cho các thread <br>
    /// AStatus = True: kích hoạt<br>
    /// AStatus = False: đóng băng
    /// </summary>
    procedure SetGameThreadStatus(const AStatus: Boolean);
    // Thủ tục bật tắt chuyển động của đàn cá nhỏ
    procedure SetSmallFishAniStatus(const AStatus: Boolean);
    // Thủ tục tạo các Thread của game
    procedure CreateGameThreads;
    // Tính toán tọa độ theo chiều thẳng đứng của con cá
    procedure CalculateVerticalCoordinateOfTheFish;
    // Thủ tục tính Step cho backdrop
    procedure CalculateBackdropAmimationStepValues;
    // Thủ tục tính độ co giãn của màn hình
    procedure CalculateScreenScale;
    // Thủ tục khởi tạo dữ liệu liên quan đến chuyển động
    procedure InitAnimationData;
    // Thủ tục khởi tạo dữ liệu liên quan đến chuyển động của những đồng xu
    procedure InitCoinAnimationData;
    // Thủ tục khởi tạo dữ liệu cho các cây san hô
    procedure InitCoralData;
    // Thủ tục khởi tạo dữ liệu cho đàn cá nhỏ
    procedure InitSmallFishes;
    // Thủ tục khởi tạo dữ liệu cho nhạc + âm thanh
    procedure InitMusicAndSound;
    // Thủ tục nạp thông tin game
    procedure LoadGameData;
    // Thủ tục lưu lại thông tin game
    procedure SaveGameData;
    // Thủ tục bắt đầu game
    procedure StartGame;
    // Thủ tục kết thúc game
    procedure StopGame(const AShowTheResult: Boolean = True; const AHideTheFish: Boolean = True);
    // Thủ tục dừng game (sẽ gọi lại EndGame
    procedure StopGameDelay;
    // Thủ tục tạm dừng game
    procedure PauseGame(const AShowPausedDialog: Boolean = False);
    // Thủ tục khởi động lại game
    procedure ResumeGame;
    // Thủ tục phát âm thanh
    procedure PlaySound(const ASound: TGameSound);
    // Thủ tục hiển thị kết chơi
    procedure ShowGameResult;
    // Thủ tục bật bộ tạo ngọc trai
    procedure ShowClamShell;
    // Thủ tục sinh cá
    procedure CreateFish;
    // Thủ tục xóa toàn bộ cá (giải phóng bộ nhớ)
    procedure ClearFishes;
    // Thủ tục sinh tiền xu
    procedure CreateCoins;
    // Thủ tục sinh đàn cá nhỏ
    procedure CreateSmallFishes;
    // Thủ tục sinh bọt bong bóng
    procedure CreateBubble(const X, Y: Single);
    // Thủ tục tạo hiệu ứng cá ăn cá
    procedure CreateEatingEffect(const X, Y: Single);
    // Thủ tục xử lý khi đồng xu tới bảng điểm
    procedure CoinAnimationFinish(Sender: TObject);
    // Thủ tục cập nhật lại level
    procedure UpdateLevel;
    // Thủ tục cập nhật điểm
    procedure UpdateScore;
    // Thủ tục cập nhật thống kê lên GameStats
    procedure UpdateStats;
    // Thủ tục cập nhật kích thước + hình ảnh của cá chính
    procedure UpdateMainFishImage;
    // Thủ tục xử lý hậu chuyển động (xử lý ăn cá)
    procedure AniAfterProcessingAll(ASender: TObject);
    // Thủ tục xử lý cá ăn tiền xu
    procedure ProcessCoins;
    // Thủ tục xử lý cá ăn cá (không phải cá nhỏ)
    procedure ProcessFishCollision;
    // Thủ tục tăng tốc độ chơi game
    procedure IncreaseGameSpeed;
    // Thủ tục tạo hiệu ứng thả ngư lôi
    procedure DropBomb;
    // Thủ tục tạo hiệu ứng thả lưỡi câu
    procedure ThrowFishingLure;
    // Thủ tục hiển thị biểu tượng báo động
    procedure ShowAlertSign;
    // Thủ tục hiển thị đám đen trên màn hình
    procedure ShowDarkPigment(const X, Y: Single);
    // Thử tục cache ảnh
    procedure CreateImageCache;
    // Thủ tục hiển thị màn hình trong game
    procedure ShowScreen(const AScreen: TRectangle);
    // Thủ tục đặt ảnh cho toggle
    procedure SetToggleImage(const AToggle: TRectangle; const AValue: Boolean);
    // Thủ tục đặt ảnh cho 1 Rectangle
    procedure FillRectangle(const ARectangle: TRectangle; const AImageList: TCustomImageList; const AImageIndex: TImageIndex);
    // Thủ tục tạo hiệu ứng nút bấm bị nhấn xuống
    procedure ButtonClickWithEffect(const AButton: TRectangle; const AProc: TProc<TRectangle>);
    // Thủ tục dàn lại các thành phần của game để phù hợp với kích thước màn hình
    procedure AlignControls;
    // Thủ tục hiển thị hộp thoại để người dùng xác nhận thoát game
    procedure PauseGameAndShowLeavePopup;
    // Thủ tục ẩn hộp thoại LeavePopup
    procedure HideLeavePopup;
    // Thủ tục rung điện thoại
    procedure Viberate(const ADuration: Integer);
    // Hàm kiểm tra xem đối tượng có chồng con cá hay không
    function IsOverlap(const AObject: TRectangle; const AUseClipper: Boolean = True): Boolean;
    // Hàm trả về điểm chính giữa của con cá (theo chiều cao)
    function MidPositionOfTheFish: Single;
    function GetDeviceLanguage: TGameLanguage;
    ///////////////////////
    procedure OnSmallFishFinished(Sender: TObject);
  public
    class property GameState : TGameState read FGameState;
  public
    property Angry           : Integer read FAngry write SetAngry;
    property AngryThreshold  : Integer read FAngryThreshold write SetAngryThreshold;
    property CoinCount       : Integer read FCoinCount write SetCoinCount;
    property FishCount       : Integer read FFishCount write SetFishCount;
    property GameScore       : Integer read FGameScore;
    property GameSpeed       : Real    read FGameSpeed write SetGameSpeed;
    property Health          : Integer read FHealth write SetHealth;
    property Language        : TGameLanguage read FLanguage write SetLanguage;
    property Level           : Integer read FLevel write SetLevel;
    property Music           : Boolean read FMusicEnabled write SetMusic;
    property PlayingDuration : Integer read FPlayingDuration write SetPlayingDuration;
    property Shield          : Integer read FShield write SetShield;
    property ShieldThreshold : Integer read FShieldThreshold write SetShieldThreshold;
    property Sound           : Boolean read FSoundEnabled write SetSound;
    property MainFishImageIndex: Integer read FMainFishImageIndex write SetMainFishImageIndex;
  end;

var
  GameForm: TGameForm;

implementation

uses
  System.Math, System.SyncObjs;

{$R *.fmx}
{$HINTS OFF}
{$WARNINGS OFF}

type
  TGameUIThread = class(TThread)
  private
    class function GetTickCountInMicroSecond: Cardinal; static;
  protected
    FTickcount: Cardinal;
    procedure ResumeGame;
    procedure PauseGame;

    procedure SetActiveValue(const AValue: Boolean);

    procedure Release;
    procedure CustomSleep(const ASecond: Integer);
  public
    constructor CreateGameThread;
    procedure ShowAlertSign;
  public
    property Active: Boolean write SetActiveValue;
  end;

  TBackdropThread = class(TGameUIThread)
  protected
    procedure Execute; override;
  end;

  TCoinAndCuttleFishAnimationThread = class(TGameUIThread)
  protected
    procedure Execute; override;
  end;

  TJellyFishAnimationThread = class(TGameUIThread)
  protected
    procedure Execute; override;
  end;

  TSharkMovingThread = class(TGameUIThread)
  protected
    procedure Execute; override;
  end;

  TShipThread = class(TGameUIThread)
  protected
    procedure Execute; override;
  end;

  TCollisionProcessThread = class(TGameUIThread)
  protected
    procedure Execute; override;
  end;

function TGameForm.AjustedDuration(const ADuration: Single): Single;
begin
  Result := ADuration;
end;

procedure TGameForm.ShowAlertSign;
begin
  if (FGameState = TGameState.Running) and not FAlertSignAlreadyShown then
  begin
    FAlertSignAlreadyShown := True;
    CircleAlert.Opacity := 0;
    CircleAlert.Visible := True;
    AniAlert.Start;
  end;
end;

procedure TGameForm.AjustFishCreationSpeed;
var
  LInterval: Integer;
begin
    case FLevel of
      1: LInterval := 3000;
      2: LInterval := 2500;
      3: LInterval := 2000;
      4: LInterval := 1500;
      5: LInterval := 1250;
      6: LInterval := 1000;
      else LInterval := 750;
    end;
    TimerFishCreation.Interval := Trunc(LInterval * FGameSpeed);
end;

procedure TGameForm.AlignControls;
{$J+}
const
  FirstTime: Boolean = True;
{$J-}
var
  LDelta: Single;
  LCoral: TRectangle;
  LScale: Single;
begin
  LScale := Width / GAME_FORM_WIDTH;
  LayoutWrapper.Scale.X := LScale;
  LayoutWrapper.Scale.Y := LScale;
  LDelta := Height - GAME_FORM_HEIGHT * LScale;
  if FirstTime then
  begin
    for LCoral in FCorals do
      LCoral.TagFloat := LCoral.Position.Y;
    FirstTime := False;
  end;

  for LCoral in FCorals do
    LCoral.Position.Y := LCoral.TagFloat + LDelta / LScale / 1.5;
end;

procedure TGameForm.AniAfterProcessingAll(ASender: TObject);
{$J+}
const
  LCount: Cardinal = 0;
{$J-}
var
  LFish: TRectangle;
begin
  if FGameState = TGameState.Running then
  begin
    Inc(LCount);
    if LCount mod 2 = 0 then
    begin
      // Toàn bộ là cá nhỏ nên sẽ bị cá chính ăn hết
      for LFish in FSmallFishes do
      begin
        if IsOverlap(LFish) then
        begin
          PlaySound(TGameSound.Eating);
          // Tạo hiệu ứng ăn cá
          CreateEatingEffect(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2);
          // Cập nhật lại sức khỏe
          Health := Health + 1; // Cá nhỏ nên 1 = LFish.Tag
          // Tăng tích lũy sự giận dữ
          AngryThreshold := AngryThreshold + 1; // Đưa cái này lên trước FishCoun để bật Angry trước khi Level thay đổi
          // Tăng số cá ăn được
          FishCount := FishCount + 1; // Cá nhỏ nên 1 = LFish.Tag
          // Ẩn cá bị ăn đi
          LFish.Visible := False;
          // Lưu vào thống kê
          Inc(FGameData.Fish);
        end;
      end;
    end
    else
    begin
      Canvas.BeginScene;
      // Xử lý ăn tiền xu
      ProcessCoins;
      // Xử lý ăn cá thường
      ProcessFishCollision;
      // Cập nhật lại màn hình
      Canvas.EndScene;
    end;
  end;
end;

procedure TGameForm.AniAlertFinish(Sender: TObject);
begin
  FAlertSignAlreadyShown := False;
  CircleAlert.Visible := False;
end;

procedure TGameForm.AniBombFinish(Sender: TObject);
begin
  BombEffect.Enabled := False;
  FBombFlag := False;
end;

procedure TGameForm.AniFishingLineStep1Finish(Sender: TObject);
begin
  AniFishingLineStep2.Start;
end;

procedure TGameForm.AniFishingLineStep2Finish(Sender: TObject);
begin
  FStartFishingLineIsStarted := False;
end;

procedure TGameForm.AniTorpedoFinish(Sender: TObject);
var
  LFish, LCoin: TRectangle;
  LCenter: TPointF;
  LRadius: Integer;
begin
  if not BombEffect.Enabled then
  begin
    LCenter := TPointF.Create(Layout.Width / 2, Layout.Height / 2);
    BombEffect.Center := TPointF.Create(Layout.Width * FScreenScale / 2, Layout.Height * FScreenScale / 2);
    BombEffect.Enabled := True;
    PlaySound(TGameSound.Bomb);
    Viberate(250);
    AniBomb.Start;
    // Ẩn để tiết kiệm CPU
    TheTorpedo.Visible := False;
    // Chỉ xử lý khi game đang chạy
    if FGameState = TGameState.Running then
    begin
      case Level of
        0..3: LRadius := 125;
        4: LRadius := 137;
        5..10: LRadius := 150;
      end;
      // Xử lý cá nhỏ
      for LFish in FSmallFishes do
        if TPointF.PointInCircle(TPointF.Create(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2), LCenter, LRadius) then
          LFish.Visible := False;

      // Xử lý cá thường
      for LFish in FFishes do
        if TPointF.PointInCircle(TPointF.Create(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2), LCenter, LRadius) then
        begin
          FFishes.Remove(LFish);
          LFish.Visible := False;
          FCachedFishes[LFish.Kind, LFish.Direction].Add(LFish);
        end;
      // Xử lý các con sứa
      for LFish in FJellyFishes do
        if TPointF.PointInCircle(TPointF.Create(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2), LCenter, LRadius) then
        begin
          FJellyFishes.Remove(LFish);
          LFish.Visible := False;
          FCachedJellyFishes.Add(LFish);
        end;
      // Xử lý các con mực
      for LFish in FCuttleFishes do
        if TPointF.PointInCircle(TPointF.Create(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2), LCenter, LRadius) then
        begin
          FCuttleFishes.Remove(LFish);
          LFish.Visible := False;
          FCachedCuttleFishes.Add(LFish);
        end;
      // Xử lý các đồng xu
      for LCoin in FCoins do
        if TPointF.PointInCircle(TPointF.Create(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2), LCenter, LRadius) then
        begin
          LCoin.Tag := GAME_COIN_HIDDEN;
          LCoin.Position.X := -100;
        end;
      // Xử lý cá mập
      if TPointF.PointInCircle(TPointF.Create(TheShark.Position.X + TheShark.Width / 2, TheShark.Position.Y + TheShark.Height / 2), LCenter, LRadius) then
      begin
        TheShark.Data := 1;
        TheShark.Visible := False;
        TheShark.Position.X := -1000;
      end;
      // Xử lý cá chính
      if (Shield <= 0) and TPointF.PointInCircle(TPointF.Create(TheFish.Position.X + TheFish.Width / 2, TheFish.Position.Y + TheFish.Height / 2), LCenter, LRadius) then
        StopGameDelay;
    end;
  end;
end;

procedure TGameForm.OnGameCompleteButtonClick(Sender: TObject);
var
  LButton: TRectangle;
begin
  LButton := TRectangle(Sender);
  // Tạo hiệu ứng nhấn xuống và xử lý lệnh
  ButtonClickWithEffect(LButton,
    procedure (AButton: TRectangle)
    begin
      if AButton = BtnGameCompleteHome then
        ShowScreen(GameMenu)
      else if AButton = BtnGameCompleteReplay then
      begin
        ShowScreen(nil);
        StartGame;
      end;
    end
  );
end;

procedure TGameForm.OnLeavePopupButtonClick(Sender: TObject);
var
  LButton: TRectangle;
begin
  LButton := TRectangle(Sender);
  // Hiển thị ảnh nhấn nút bấm và xử lý lệnh

  ButtonClickWithEffect(LButton,
    procedure (AButton: TRectangle)
    begin
      // Ẩn hộp thoại trước khi ẩn những cái khác ở StopGame;
      HideLeavePopup;
      // Xử lý lệnh cho nút bấm
      if AButton = BtnPopupLeaveYes then
      begin
        // Cho các con cá hoạt động lại
        SetSmallFishAniStatus(True);
        // Dừng game (không hiển thị kết quả)
        StopGame(False);
        // Ở StopGame tắt TimerSmallFishCreation nên phải bật lại để tạo hiệu ứng cá bơi
        TimerSmallFishCreation.Enabled := True;
      end
      else
        ResumeGame;
    end
  );
end;

procedure TGameForm.OnGameLeaveClick(Sender: TObject);
begin
  // Nếu popup đang hiển thị thì không làm gì hết
  if GamePopupLeave.Visible or (GameState = TGameState.Paused) then
    Exit;
  // Hiển thị ảnh nhấn xuống
  ButtonClickWithEffect(BtnGameLeaveImage, nil);
  // Tạm dừng game và hiển thị popup
  PauseGameAndShowLeavePopup;
end;

procedure TGameForm.OnMenuButtonClick(Sender: TObject);
var
  LButton: TRectangle;
begin
  // Ép sang kiểu TRectangle để xử lý
  LButton := TRectangle(Sender);
  // Cho chữ nhấn xuống theo hình nền
  LButton.Padding.Top := 0;

  ButtonClickWithEffect(LButton,
    procedure (AButton: TRectangle)
    begin
      AButton.Padding.Top := -4;
      // Nếu là nút Play
      if AButton = BtnPlay then
      begin
        ShowScreen(nil);
        StartGame;
      end;
      // Nếu là nút Setting
      if AButton = BtnSetting then
        ShowScreen(GameSetting);
      // Nếu là nút Back ở trang Setting
      if AButton = BtnSettingReturn then
        ShowScreen(GameMenu);
      // Nếu là nút Back ở trang Statistics
      if AButton = BtnGameStatsReturn then
        ShowScreen(GameMenu);
      // Nếu là nút Exit
      if AButton = BtnExit then
        Application.Terminate;
    end
  );
end;

procedure TGameForm.OnSmallFishFinished(Sender: TObject);
begin
  TControl((Sender as TAnimation).Parent).Visible := False;
end;

procedure TGameForm.DropBomb;
begin
  if not FBombFlag then
  begin
    FBombFlag := True;
    TheTorpedo.Visible := True;
    AniTorpedo.Start;
  end;
end;

procedure TGameForm.CalculateBackdropAmimationStepValues;
begin
  FStep1 := GAME_FORM_WIDTH / FDuration1;
  FStep2 := GAME_FORM_WIDTH / FDuration2;
  FStep3 := GAME_FORM_WIDTH / FDuration1;
end;

procedure TGameForm.CalculateScreenScale;
begin
  if Layout.Scene <> nil then
    FScreenScale := Layout.Scene.GetSceneScale * Width / GAME_FORM_WIDTH
  else
    FScreenScale := 1;
end;

procedure TGameForm.CalculateVerticalCoordinateOfTheFish;
begin
  FFishVerticalCoordinate := TheFish.Position.Y + TheFish.Height / 2;
end;

procedure TGameForm.ClearFishes;
var
  LFish: TRectangle;
begin
  for LFish in FFishes do
  begin
    FFishes.Remove(LFish);
    LFish.DisposeOf;
  end;
end;

procedure TGameForm.CoinAnimationFinish(Sender: TObject);
var
  LAnimation: TPathAnimation;
begin
  LAnimation := TPathAnimation(Sender);
  LAnimation.DisposeOf;
end;

procedure TGameForm.CreateGameThreads;
begin
  ////////////////////////////
  FBackdropThread := TBackdropThread.Create(False);
  ////////////////////////////
  FCoinAndCuttleFishAnimationThread := TCoinAndCuttleFishAnimationThread.Create(True);
  FJellyFishAnimationThread := TJellyFishAnimationThread.Create(True);
  FSharkThread := TSharkMovingThread.Create(True);
  FShipThread := TShipThread.Create(True);
end;

procedure TGameForm.CreateBubble(const X, Y: Single);
const
{$J+}
  LastTime: Cardinal = 0;
{$J-}
var
  r: Cardinal;
  LNow: Cardinal;
  LBubble: TRectangle;
begin
  LNow := TThread.GetTickCount;
  if LNow - LastTime > 1500 then
  begin
    LastTime := LNow;
    if FCachedBubbleList.Count = 0 then
    begin
      r := Random(5);
      LBubble := TRectangle.Create(nil);
      LBubble.Width := 10 + r;
      LBubble.Height := 10 + r;
      LBubble.Parent := Layout;
      LBubble.HitTest := False;
      LBubble.Stroke.Kind := TBrushKind.None;
      LBubble.Fill.Kind := TBrushKind.Bitmap;
      LBubble.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
      LBubble.Fill.Bitmap.Bitmap.Assign(Bubble.Fill.Bitmap.Bitmap);
      LBubble.Speed := 0.5 / (1 + Random(3));
      LBubble.BringToFront;
    end
    else
    begin
      LBubble := FCachedBubbleList[0];
      FCachedBubbleList.Delete(0);
    end;
    LBubble.Position.X := X;
    LBubble.Position.Y := Y;
    LBubble.Visible := True;
    FBubbleList.Add(LBubble);
  end;
end;

procedure TGameForm.CreateCoins;
var
  r, i, y, c: Integer; // Random, Index, Position.Y, Processed count
begin
  r := Random(COIN_COUNT - COIN_DISPLAY_COUNT_MIN) + COIN_DISPLAY_COUNT_MIN;
  y := Random(GAME_FORM_HEIGHT - 160) + 100;
  c := 0;
  for i := 1 to COIN_COUNT do
  begin
    if FCoins[i].Tag = GAME_COIN_HIDDEN then
    begin
      FCoins[i].Position.Y := y;
      FCoins[i].Position.X := - (c * 50 + 50);
      FCoins[i].ImageIndex := 0;
      FCoins[i].Tag := GAME_COIN_VISIBLE;
      Inc(c);
      if c > r then
        Exit;
    end;
  end;
end;

procedure TGameForm.CreateEatingEffect(const X, Y: Single);
var
  LEatingEffect: TRectangle;
begin
  if FCachedEatingEffectList.Count = 0 then
  begin
    LEatingEffect := TEatingEffectRectangle.Create(nil);
    LEatingEffect.Visible := False;
    LEatingEffect.ImageList := IlEatingEffect;
    LEatingEffect.ImageCount := 20;
    LEatingEffect.Width := 30;
    LEatingEffect.Height := 30;
    LEatingEffect.Parent := Layout;
    LEatingEffect.HitTest := False;
    LEatingEffect.Stroke.Kind := TBrushKind.None;
    LEatingEffect.Fill.Kind := TBrushKind.Bitmap;
    LEatingEffect.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
    LEatingEffect.BringToFront;
  end
  else
  begin
    LEatingEffect := FCachedEatingEffectList[0];
    FCachedEatingEffectList.Delete(0);
  end;

  LEatingEffect.Position.X := X - 15;
  LEatingEffect.Position.Y := Y - 15;
  LEatingEffect.ImageIndex := 0;
  LEatingEffect.FillImage;
  LEatingEffect.Visible := True;
  FEatingEffectList.Add(LEatingEffect)
end;

procedure TGameForm.CreateFish;
var
  LWidth, LHeight: Single;
  LImageIndex: Integer;
  LFish: TRectangle;
  LFishKind: Integer;
  LFishDirection: Integer;
begin
  // 33% là các loại cá lớn hơn cá hiện tại
{$IFDEF SUPERMODE}
  LFishKind := 5; // IfThen(Random(333) mod 3 = 0, Level + Random(2), Random(Level));
{$ELSE}
  LFishKind := IfThen(Random(333) mod IfThen(Level > 4, 4, 3) = 0, Level, Random(Level));
{$ENDIF}
  // Tạo hướng di chuyển cho con cá
  LFishDirection := IfThen(Random(1000) mod 5 = 0, DIRECTION_RIGHT, DIRECTION_LEFT);
  // Xem có ở trong cache chưa
  if FCachedFishes[LFishKind, LFishDirection].Count > 0 then
  begin
    LFish := FCachedFishes[LFishKind, LFishDirection][0];
    FCachedFishes[LFishKind, LFishDirection].Delete(0);
  end
  else
  begin
    LFish := TRectangle.Create(Self);
    LFish.Kind := LFishKind;
    LFish.Tag := LFish.Kind + 1;
    // Điều chỉnh kích thước
    case LFish.Kind of
      0: begin
        LWidth := 29;
        LHeight := 20;
      end;

      1: begin
        LWidth := 54;
        LHeight := 30;
      end;

      2: begin
        LWidth := 78;
        LHeight := 38;
      end;

      3: begin
        LWidth := 66;
        LHeight := 55;
      end;

      4: begin
        LWidth := 97;
        LHeight := 75;
      end;


      5: begin
        LWidth := 122;
        LHeight := 85;
      end;

      6: begin
        LWidth := 164;
        LHeight := 120;
      end;
    end;

    LFish.Visible := False;
    LFish.HitTest := False;
    LFish.Stroke.Kind := TBrushKind.None;
    LFish.Fill.Kind := TBrushKind.Bitmap;
    LFish.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
    LFish.Parent := Layout;
    LFish.Width := LWidth;
    LFish.Height := LHeight;
    LFish.Direction := LFishDirection;
    if LFish.Direction = DIRECTION_LEFT then
      LFish.Fill.Bitmap.Bitmap.Assign(IlFish.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), LFish.Kind))
    else
      LFish.Fill.Bitmap.Bitmap.Assign(IlFishRight.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), LFish.Kind));

  end;

  case LFish.Direction of
    DIRECTION_LEFT: begin
      LFish.Position.X := - LFish.Width - 50;
      LFish.Position.Y := Random(GAME_FORM_HEIGHT - 120) + 50;
    end;

    DIRECTION_RIGHT: begin
      LFish.Position.X := GAME_FORM_WIDTH + LFish.Width + 50;
      LFish.Position.Y := Random(GAME_FORM_HEIGHT - 120) + 50;
    end;
  end;
  // Khởi tạo tốc độ di chuyển cho con cá
  LFish.Speed := (Random(3) + 1) / 3;
  LFish.Visible := True;
  // Đưa vào danh sách FFishes để xử lý sau này
  FFishes.Add(LFish);
end;

procedure TGameForm.CreateImageCache;
var
  i, j: Integer;
  LWidth, LHeight: Single;
begin
  { Không cần xử lý hình ảnh tiền xu vì nó đã được tạo ở InitCoinAnimationData }

  // Xử lý cá chính
  for i := 0 to 1 do
  begin
    MainFishImageIndex := i;
    for j := 1 to 7 do
      Level := j;
  end;

  Level := GAME_DEFAULT_LEVEL;

  IlClamShell.Bitmap(TSizeF.Create(160, 153), CLAM_WITH_PEARL);
  IlClamShell.Bitmap(TSizeF.Create(160, 153), CLAM_WITHOUT_PEARL);
  IlClamShell.Bitmap(TSizeF.Create(160, 153), CLAM_CLOSED_CLIP);

  IlShark.Bitmap(TSizeF.Create(SHARK_IMAGE_WIDTH, SHARK_IMAGE_HEIGHT), SHARK_SMALL_LEFT);
  IlShark.Bitmap(TSizeF.Create(SHARK_IMAGE_WIDTH, SHARK_IMAGE_HEIGHT), SHARK_SMALL_RIGHT);
  IlShark.Bitmap(TSizeF.Create(SHARK_IMAGE_WIDTH, SHARK_IMAGE_HEIGHT), SHARK_NORMAL_RIGHT);
  IlShark.Bitmap(TSizeF.Create(SHARK_IMAGE_WIDTH, SHARK_IMAGE_HEIGHT), SHARK_NORMAL_LEFT);

  for i := 0 to 7 do
    IlJellyFish.Bitmap(TSizeF.Create(60 , 60), i);

  for i := 0 to 3 do
    IlCuttle.Bitmap(TSizeF.Create(65, 49), i);

  LWidth := 29;
  LHeight := 20;
  IlFish.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 0);
  IlFishRight.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 0);

  LWidth := 54;
  LHeight := 30;
  IlFish.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 1);
  IlFishRight.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 1);

  LWidth := 78;
  LHeight := 38;
  IlFish.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 2);
  IlFishRight.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 2);

  LWidth := 66;
  LHeight := 55;
  IlFish.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 3);
  IlFishRight.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 3);

  LWidth := 97;
  LHeight := 75;
  IlFish.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 4);
  IlFishRight.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 4);

  LWidth := 122;
  LHeight := 85;
  IlFish.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 5);
  IlFishRight.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 5);

  LWidth := 164;
  LHeight := 120;
  IlFish.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 6);
  IlFishRight.Bitmap(TSizeF.Create(Trunc(LWidth * FScreenScale) , Trunc(LHeight * FScreenScale)), 6);

end;

procedure TGameForm.CreateSmallFishes;
const
  SMALL_FISH_POSITION_DELTA = 170;
var
  i, r: Integer;
begin

  // Gán thuộc tính cho con cá thứ 1
  if not FSmallFishes[1].Visible then
  begin
    FSmallFishes[1].Position.X := 32 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[1].Position.Y := 13 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 2
  if not FSmallFishes[2].Visible then
  begin
    FSmallFishes[2].Position.X := 144 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[2].Position.Y := 149 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 3
  if not FSmallFishes[3].Visible then
  begin
    FSmallFishes[3].Position.X := 16 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[3].Position.Y := 69 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 4
  if not FSmallFishes[4].Visible then
  begin
    FSmallFishes[4].Position.X := 88 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[4].Position.Y := 45 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 5
  if not FSmallFishes[5].Visible then
  begin
    FSmallFishes[5].Position.X := 32 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[5].Position.Y := 125 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 6
  if not FSmallFishes[6].Visible then
  begin
    FSmallFishes[6].Position.X := 112 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[6].Position.Y := 101 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 7
  if not FSmallFishes[7].Visible then
  begin
    FSmallFishes[7].Position.X := 208 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[7].Position.Y := 117 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 8
  if not FSmallFishes[8].Visible then
  begin
    FSmallFishes[8].Position.X := 176 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[8].Position.Y := 53 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 9
  if not FSmallFishes[9].Visible then
  begin
    FSmallFishes[9].Position.X := 248 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[9].Position.Y := 61 / 2;
  end;
  // Gán thuộc tính cho con cá thứ 10
  if not FSmallFishes[10].Visible then
  begin
    FSmallFishes[10].Position.X := 144 / 2 - SMALL_FISH_POSITION_DELTA;
    FSmallFishes[10].Position.Y := 5 / 2;
  end;

  // Tạo đường di chuyển cho các con cá
  for i := 1 to High(FSmallFishAnimations) do
  begin
    if not FSmallFishes[i].Visible then
    begin
      // Mỗi con cá sẽ có 1 đường đi ngẫu nhiên
      r := Random(5) + 1;
      FSmallFishes[i].Visible := True;
      FSmallFishAnimations[i].Duration := AjustedDuration(4);
      FSmallFishAnimations[i].Delay := Random(5) * 5 / 100;
      FSmallFishAnimations[i].Polygon := FSmallFishAnimationData[r].Polygon;
      FSmallFishAnimations[i].Spline := FSmallFishAnimationData[r].Spline;
      FSmallFishAnimations[i].Start;
    end;
  end;

end;

procedure TGameForm.ShowClamShell;
begin
  // Tạm ẩn đi, timer sẽ đưa lên lại
  ClamShell.Visible := False;
  // Thiếp lập thời gian tạo ngọc
  TimerClamShellCreation.SetInterval(60000 + Random(60000));
end;

procedure TGameForm.ShowDarkPigment(const X, Y: Single);
begin
  if DarkPigment.Visible = False then
  begin
    // Chuyển container đến vị trí thích hợp
    DarkPigmentContainer.Position.X := X - 270;
    DarkPigmentContainer.Position.Y := Y - 200;
    // Hiển thị bóng đen nhỏ lên trên cùng
    DarkPigment1.Visible := True;
    DarkPigment2.Visible := False;
    DarkPigment3.Visible := False;
    DarkPigment.Fill.Color := TAlphaColorRec.Null;
    // Hiển thị DarkPigment
    DarkPigment.Visible := True;
    // Bật bộ đếm thời gian
    TimerDarkPigment.Enabled := True;
  end;
end;

procedure TGameForm.ShowGameResult;
begin
  LblGameCompleteCoin.Text := CoinCount.ToString;
  LblGameCompleteTime.Text := Format('%2.2d:%2.2d:%2.2d', [PlayingDuration div (60 * 60), (PlayingDuration mod (60 * 60)) div 60, PlayingDuration mod 60]);
  LblGameCompleteFishCount.Text := FishCount.ToString;
  LblGameCompleteScore.Text := AddThousandSeparator(FGameScore.ToString);
  ShowScreen(GameComplete);
end;

procedure TGameForm.PauseGameAndShowLeavePopup;
begin
  PauseGame;
  GamePopupLeave.Position.Y := -150;
  GamePopupLeave.Visible := True;
  TAnimator.AnimateFloat(GamePopupLeave, 'Position.Y', 90, 0.2, TAnimationType.In, TInterpolationType.Circular);
end;

procedure TGameForm.PlaySound(const ASound: TGameSound);
const
{$J+}
  CoinPlayerIndex: Integer = 0;
{$J-}
var
  LPlayer: TMediaPlayer;
begin
  if Sound then
  begin
    LPlayer := nil;
    case ASound of
      TGameSound.Coin: begin
        LPlayer := FCoinSoundMediaPlayer[CoinPlayerIndex];
        CoinPlayerIndex := (CoinPlayerIndex + 1) mod 2;
      end;

      TGameSound.Click: begin
        LPlayer := MpSoundClick;
      end;

      TGameSound.Eating: begin
        LPlayer := MpSoundEating;
      end;

      TGameSound.Bomb:    LPlayer := MpSoundBomb;
      TGameSound.Cuttle:  LPlayer := MpSoundCuttle;
      TGameSound.Reel:    LPlayer := MpSoundReel;
      TGameSound.Die:     LPlayer := MpSoundDie;
      TGameSound.LevelUp: LPlayer := MpSoundLevelUp;
      TGameSound.Magic:   LPlayer := MpSoundMagic;
      TGameSound.PowerUp: LPlayer := MpSoundPowerUp;
      TGameSound.Shark:   LPlayer := MpSoundShark;

    end;

    if Assigned(LPlayer) then
    begin
      LPlayer.CurrentTime := 0;
      LPlayer.Play;
    end;
  end;
end;

procedure TGameForm.ShowScreen(const AScreen: TRectangle);
begin
  // Ẩn banner
  if Banner.Visible then
  begin
    TAnimator.AnimateFloatWait(Banner, 'Position.Y', -55, 0.1);
    Banner.Visible := False;
  end;
  // Ẩn màn hình hiện tại
  if Assigned(FActiveScreen) then
  begin
    TAnimator.AnimateFloatWait(FActiveScreen, 'Position.Y', - (GAME_SCREEN_ANI_DELTA - 25), 0.5, TAnimationType.In, TInterpolationType.Circular);
    FActiveScreen.Visible := False;
  end;
  // Hiện AScreen lên
  if Assigned(AScreen) then
  begin
    AScreen.Position.Y := - (GAME_SCREEN_ANI_DELTA - 25);
    AScreen.Visible := True;
    TAnimator.AnimateFloat(AScreen, 'Position.Y', 25, 0.5, TAnimationType.In, TInterpolationType.Circular);
  end;
  // Đặt lại FActiveScreen
  FActiveScreen := AScreen;
end;

procedure TGameForm.FillRectangle(const ARectangle: TRectangle; const AImageList: TCustomImageList; const AImageIndex: TImageIndex);
begin
  ARectangle.Fill.Bitmap.Bitmap.Assign(AImageList.Bitmap(TSizeF.Create(ARectangle.Width * GameForm.FScreenScale , ARectangle.Height * GameForm.FScreenScale), AImageIndex));
end;

procedure TGameForm.FormActivate(Sender: TObject);
const
{$J+}
  TheFirstTime: Boolean = True;
{$J-}
begin
  if TheFirstTime then
  begin
    // Lưu chu kì chuyển động của dãi đất + đá
    FDuration1 := 6000;
    // Lưu chu kì chuyển động của dãi san hô
    FDuration2 := 8000;
    // Tính Step của backdrop
    CalculateBackdropAmimationStepValues;
    // Tạo thread xử lý hiệu ứng chuyển động cho dãi đất + san hô
    CreateGameThreads;
    // Xóa cờ
    TheFirstTime := False;
    // Hiển thị menu
    TThread.CreateAnonymousThread(
      procedure
      begin
        Sleep(200);

        TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            ShowScreen(GameMenu);
            // Đánh dấu đã hiển thị Hướng dẫn cho lần đầu tiên
            SaveGameData;
          end
        );
      end
    ).Start;
  end;
end;

procedure TGameForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
{$IFDEF ANDROID}
  Application.Terminate;
{$ENDIF}
end;

procedure TGameForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FShield := 0;
  FDragging := False;
  FFishResizing := False;
  FCoinCount := -1;
  FClipper := TClipper.Create;
  // Khởi tạo danh sách chứa các con cá (thường)
  FFishes := TGameObjectList.Create;
  for i := 0 to GAME_FISH_KIND - 1 do
  begin
    FCachedFishes[i, DIRECTION_LEFT] := TGameObjectList.Create;
    FCachedFishes[i, DIRECTION_RIGHT] := TGameObjectList.Create;
  end;
  // Khởi tạo danh sách chứa các con sứa
  FJellyFishes := TGameObjectList.Create;
  FCachedJellyFishes := TGameObjectList.Create;
  // Khởi tạo danh sách chứa các con mực
  FCuttleFishes := TGameObjectList.Create;
  FCachedCuttleFishes := TGameObjectList.Create;
  // Khởi tạo danh chứa hiệu ứng ăn cá
  FEatingEffectList:= TGameObjectList.Create;
  FCachedEatingEffectList := TGameObjectList.Create;
  // Khởi tạo danh sách chứa các bong bóng
  FBubbleList := TGameObjectList.Create;
  FCachedBubbleList := TGameObjectList.Create;
  // Xóa toàn bộ mảng FSmalFishes
  FillChar(FSmallFishes, SizeOf(FSmallFishes), $00);
  // Tính độ co giãn của màn hình
  CalculateScreenScale;
  // Lưu tọa độ của con cá (theo chiều thẳng đứng)
  CalculateVerticalCoordinateOfTheFish;
  // Khởi tạo dữ liệu liên quan đến chuyển động
  InitAnimationData;
  InitCoinAnimationData;
  InitCoralData;
  InitSmallFishes;
  InitMusicAndSound;
  // Biểu tượng báo động
  CircleAlert.Visible := False;
  CircleAlert.Opacity := 0;
  FAlertSignAlreadyShown := False;
  // Dọn dẹp màn hình (ẩn những cái không cần thiết đi)
  SeaHorse.Visible := False;
  ClamShell.Visible := False;
  TheShark.Visible := False;
  TheTorpedo.Visible := False;

  TheShark.Kind := GAME_FISH_KIND_SHARK;
  ClamShell.Kind := GAME_FISH_KIND_CLAM_SHELL;
  ClamShell.Direction := DIRECTION_LEFT;

  //////////////////////
  FActiveScreen := nil;
  Banner.Visible := False;
  GameMenu.Visible := False;
  /////////////////////////////
  CreateImageCache;
  TheFish.Visible := False;
  /////////////////////////////
  LoadGameData;
  /////////////////////////////
  FLanguage := TGameLanguage.None;
  Language := GetDeviceLanguage;
end;

procedure TGameForm.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  FClipper.Free;
  FFishes.Free;
  FJellyFishes.Free;
  FCachedJellyFishes.Free;
  FCuttleFishes.Free;
  FCachedCuttleFishes.Free;
  FEatingEffectList.Free;
  FCachedEatingEffectList.Free;
  FBubbleList.Free;
  FCachedBubbleList.Free;

  for i := 0 to GAME_FISH_KIND - 1 do
  begin
    FCachedFishes[i, DIRECTION_LEFT].Free;
    FCachedFishes[i, DIRECTION_RIGHT].Free;
  end;

  for i := Low(FSmallFishAnimationData) to High(FSmallFishAnimationData) do
  begin
    SetLength(FSmallFishAnimationData[i].Polygon^, 0);
    Dispose(FSmallFishAnimationData[i].Polygon);
    FSmallFishAnimationData[i].Spline.DisposeOf;
  end;

  for i := 1 to High(FSmallFishes) do
  begin
    FSmallFishAnimations[i].DisposeOf;
  end;
end;

procedure TGameForm.FormResize(Sender: TObject);
begin
  // Sắp xếp lại các control trên màn hình
  AlignControls;
end;

procedure TGameForm.FormShow(Sender: TObject);
begin
{$IFDEF MSWINDOWS}
  FullScreen := False;
{$ENDIF}
end;

function TGameForm.GetDeviceLanguage: TGameLanguage;
var
  LocaleService: IFMXLocaleService;
  OSLang: string;
begin
  Result := TGameLanguage.English;
  if TPlatformServices.Current.SupportsPlatformService(IFMXLocaleService, IInterface(LocaleService)) then
  begin
    OSLang := LocaleService.GetCurrentLangID();
    if OSLang = 'vi' then
      Result := TGameLanguage.Vietnamese;
  end;
end;

procedure TGameForm.HideLeavePopup;
begin
  TAnimator.AnimateFloatWait(GamePopupLeave, 'Position.Y', -150, 0.2, TAnimationType.In, TInterpolationType.Circular);
  GamePopupLeave.Visible := False;
end;

procedure TGameForm.IncreaseGameSpeed;
const
  CDurationDelta = 0.2;
var
  D1, D2: Single;
begin
//  if (FDuration1 > 1) and not SameValue(FDuration1, FloatAnimation1.Duration - CDurationDelta) then
//  begin
//    D1 := FDuration1;
//    D2 := FDuration2;
//    // Tăng tốc độ chuyển động <=> Giảm chu kì chuyển động
//    FDuration1 := FDuration1 - CDurationDelta;
//    // Tính toán FDuration2 theo tỉ lệ ban đầu
//    FDuration2 := D2 * FDuration1 / D1;
//  end;
end;

procedure TGameForm.InitAnimationData;
var
  LPathData: TPathData;
begin
  // Khởi tạo dữ liệu chuyển động cho FSmallFishAnimations
  LPathData := TPathData.Create;
  // Đường đi thứ 1
  LPathData.Data := 'M-161,165C100.5,41.5,573.5,90.5,986.5,180';
  TPathAnimationFX.CreateAnimationData(LPathData, FSmallFishAnimationData[1]);
  // Đường đi thứ 2
  LPathData.Data := 'M-177.5,208.5c237-139.387,266,58,1152,15"';
  TPathAnimationFX.CreateAnimationData(LPathData, FSmallFishAnimationData[2]);
  // Đường đi thứ 3
  LPathData.Data := 'M-177.5,208.5c523-260,381-70,1152,15';
  TPathAnimationFX.CreateAnimationData(LPathData, FSmallFishAnimationData[3]);
  // Đường đi thứ 4
  LPathData.Data := 'M-161,165C100.5,41.5,129.921,6.469,292.5,126.5c72,53.157,281-36,694,53.5';
  TPathAnimationFX.CreateAnimationData(LPathData, FSmallFishAnimationData[4]);
  // Đường đi thứ 5
  LPathData.Data := 'M-161,165c295.878,77.475,262.602-94.845,488.021-32.435C543.5,192.5,463.452-32.324,811.5,113.5';
  TPathAnimationFX.CreateAnimationData(LPathData, FSmallFishAnimationData[5]);
  // Giải phóng bộ nhớ
  LPathData.DisposeOf;
end;

procedure TGameForm.InitCoinAnimationData;
var
  i: Integer;
begin
  for i := 1 to COIN_COUNT do
  begin
    FCoins[i] := TRectangle.Create(Self);
    FCoins[i].HitTest := False;
    FCoins[i].Stroke.Kind := TBrushKind.None;
    FCoins[i].Fill.Kind := TBrushKind.Bitmap;
    FCoins[i].Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
    FCoins[i].Position.X := -100;
    FCoins[i].Parent := Layout;
    FCoins[i].Tag := GAME_COIN_HIDDEN;
    FCoins[i].ImageList := IlCoin;
    FCoins[i].ImageCount := 6;
    FCoins[i].Width := 25;
    FCoins[i].Height := 25;
  end;
end;

procedure TGameForm.InitCoralData;
begin
  FCorals[0] := Coral1;
  FCorals[1] := Coral2;
  FCorals[2] := Coral3;
  FCorals[3] := Coral4;
  FCorals[4] := Coral5;
  FCorals[5] := Coral6;
  FCorals[6] := Coral7;
  FCorals[7] := Coral8;
  FCorals[8] := Coral9;
end;

procedure TGameForm.InitMusicAndSound;
var
  LPath: string;
begin
{$IF Defined(MSWINDOWS)}
  LPath := ExtractFilePath(ParamStr(0)) + 'Mp3\';
{$ELSE}
  LPath := System.IOUtils.TPath.GetDocumentsPath + PathDelim;
{$ENDIF}

  MpSoundBomb.FileName := LPath + 'Bomb.mp3';
  MpSoundClick.FileName := LPath + 'Click.mp3';
  MpSoundCoin1.FileName := LPath + 'CoinCollect.mp3';
  MpSoundCoin2.FileName := LPath + 'CoinCollect.mp3';
  MpSoundCoin3.FileName := LPath + 'CoinCollect.mp3';
  MpSoundDie.FileName := LPath + 'Die.mp3';
  MpSoundEating.FileName := LPath + 'Eating.mp3';
  MpSoundLevelUp.FileName := LPath + 'LevelUp.wav';
  MpSoundMagic.FileName := LPath + 'Magic.wav';
  MpSoundPowerUp.FileName := LPath + 'PowerUp.mp3';
  MpSoundReel.FileName := LPath + 'Reel.mp3';
  MpSoundShark.FileName := LPath + 'Shark.mp3';
  MpSoundCuttle.FileName := LPath + 'Cuttle.mp3';


  MpBackgroundMusic.FileName := LPath + 'Music.mp3';

  FCoinSoundMediaPlayer[0] := MpSoundCoin1;
  FCoinSoundMediaPlayer[1] := MpSoundCoin2;
  FCoinSoundMediaPlayer[2] := MpSoundCoin3;

end;

procedure TGameForm.InitSmallFishes;
var
  i: Integer;
  LAnimation: TPathAnimationFX;
begin
  for i := 1 to High(FSmallFishes) do
  begin
    // Đối tượng chứa hình cá
    FSmallFishes[i] := TRectangle.Create(Self);
    FSmallFishes[i].HitTest := False;
    FSmallFishes[i].Width := 29;
    FSmallFishes[i].Height := 20;
    FSmallFishes[i].Tag := 1;
    FSmallFishes[i].Fill.Bitmap.Bitmap.Assign(IlFish.Bitmap(TSizeF.Create(51 * FScreenScale, 35 * FScreenScale), SMALL_FISH));
    FSmallFishes[i].Fill.Kind := TBrushKind.Bitmap;
    FSmallFishes[i].Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
    FSmallFishes[i].Stroke.Kind := TBrushKind.None;
    FSmallFishes[i].Position.X := -100;
    FSmallFishes[i].Parent := Layout;
    FSmallFishes[i].Kind := GAME_FISH_KIND_FISH0;
    FSmallFishes[i].Direction := DIRECTION_LEFT;
    FSmallFishes[i].Visible := False;
    // Animation điều khiển đường đi
    LAnimation := TPathAnimationFX.Create(Self);
    LAnimation.Enabled := False;
    LAnimation.Parent := FSmallFishes[i];
    LAnimation.OnFinish := OnSmallFishFinished;
    /////////////////////////////////
    FSmallFishAnimations[i] := LAnimation;
  end;
end;

procedure TGameForm.TimerGameSpeedTimer(Sender: TObject);
begin
  IncreaseGameSpeed;
end;

procedure TGameForm.TimerHealthTimer(Sender: TObject);
begin
  Health := Health - 1;
end;

procedure TGameForm.TimerHideSuperDotTipTimer(Sender: TObject);
begin
  TimerHideSuperDotTip.Enabled := False;
end;

procedure TGameForm.TimerPlayingDurationCounterTimer(Sender: TObject);
begin
  PlayingDuration := PlayingDuration + 1;
end;

procedure TGameForm.TimerJellyOrCuttleFishCreationTimer(Sender: TObject);
var
  LFish: TRectangle;
  LFishKind: Integer;
  LFlag: Boolean;
begin
  // Đặt lại thời gian sinh con tiếp theo
{$IFDEF SUPERMODE}
  TimerJellyOrCuttleFishCreation.SetInterval((Random(3) + 3) * 1000);
{$ELSE}
  if Level = 1 then
    Exit;
  if Level <= 3 then
    TimerJellyOrCuttleFishCreation.SetInterval((Random(10) + 10) * 1000)
  else
    TimerJellyOrCuttleFishCreation.SetInterval((Random(5) + 7) * 1000);
{$ENDIF}

  //
  LFlag := False;
  LFish := nil;
  // Xác định loại cá
  LFishKind := IfThen(Level = 2, 0, Random(100) mod 2);
  if (LFishKind = 0) and (FCachedJellyFishes.Count > 0) then
  begin
    LFish := FCachedJellyFishes.First;
    FCachedJellyFishes.Delete(0);
    FJellyFishes.Add(LFish);
  end else if FCachedCuttleFishes.Count > 0 then
  begin
    LFish := FCachedCuttleFishes.First;
    FCachedCuttleFishes.Delete(0);
    FCuttleFishes.Add(LFish);
  end;

  if LFish = nil then
  begin
    // Tạo đối tượng chứa hình ảnh
    LFish := TRectangle.Create(Self);
    LFish.Visible := False;
    LFish.HitTest := False;
    LFish.Stroke.Kind := TBrushKind.None;
    LFish.Fill.Kind := TBrushKind.Bitmap;
    LFish.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
    LFish.Parent := Layout;
    LFish.Position.X := -(70 + Random(100));
    LFish.Position.Y := Random(GAME_FORM_HEIGHT - 200) + 50;
    LFish.Data := 0;
    LFish.Speed := (Random(2) + 1) / 3;
    LFish.Direction := DIRECTION_LEFT;
    // Đây là con sứa
    if LFishKind = 0 then
    begin
      LFish.Width := 60;
      LFish.Height := 60;
      LFish.ImageList := IlJellyFish;
      LFish.ImageIndex := Random(8);
      LFish.ImageCount := 8;
      LFish.Kind := GAME_FISH_KIND_JELLEY_FISH;
      // Đưa vào danh sách để xử lý sau này
      FJellyFishes.Add(LFish);
    end
    else
    begin
      // Đây là con mực
      LFish.Width := 65;
      LFish.Height := 49;
      LFish.ImageList := IlCuttle;
      LFish.ImageIndex := Random(4);
      LFish.ImageCount := 4;
      LFish.Kind := GAME_FISH_KIND_CUTTLE_FISH;
      // Đưa vào danh sách để xử lý sau này
      FCuttleFishes.Add(LFish);
    end;
  end;
  // Hiệu chỉnh lại vị trí
  LFish.Position.X := -(70 + Random(100));
  LFish.Position.Y := Random(GAME_FORM_HEIGHT - 200) + 50;
  LFish.Data := 0;
  LFish.Speed := (Random(2) + 1) / 3;
  // Nạp ảnh vào control
  LFish.FillImage;
  // Hiển thị lên màn hình
  LFish.Visible := True;
end;

procedure TGameForm.TimerMusicTimer(Sender: TObject);
begin
  if Music and (MpBackgroundMusic.State = TMediaState.Stopped) and FAppIsActive then
    MpBackgroundMusic.Play;
end;

procedure TGameForm.LayoutMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if FGameState = TGameState.Running then
  begin
    FDragging := True;
    FTapPosition := TPointF.Create(X, Y);
  end;
end;

procedure TGameForm.LayoutMouseLeave(Sender: TObject);
begin
  FDragging := False;
end;

procedure TGameForm.LayoutMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
const
{$J+}
  SIGN1: Integer = 1; // Dùng để xem có đổi dấu không
  SIGN2: Integer = 1;
{$J-}
var
  LFlag: Boolean; // Đánh dấu có thay đổi vị trí của con cá không
  LX, LY: Single;
  LSign1, LSign2: Integer;
begin
  if FDragging then
  begin
    LFlag := False;
    // Xem có chuyển hướng để thêm bong bóng không
    LSign1 := IfThen(FTapPosition.X - X > 0, 1, -1);
    LSign2 := IfThen(FTapPosition.Y - Y > 0, 1, -1);
    if (SIGN1 * LSign1 = -1) or (SIGN2 * LSign2 = -1) then
    begin
      CreateBubble(TheFish.Position.X, TheFish.Position.Y + MidPositionOfTheFish);
      SIGN1 := LSign1;
      SIGN2 := LSign2;
    end;

    // Tính toán tọa độ mới của con cá
    LX := TheFish.Position.X + X - FTapPosition.X;
    LY := TheFish.Position.Y + Y - FTapPosition.Y;
    // Kiểm tra có nằm trong màn hình không
    if (LX >= 0) and (LX <= Width - TheFish.Width) then
    begin
      LFlag := True;
      TheFish.Position.X := LX;
    end;
    // Kiểm tra có nằm trong màn hình không
    if (LY >= 30) and (LY <= Height - TheFish.Height - 20) then
    begin
      LFlag := True;
      TheFish.Position.Y := LY;
    end;
    // Nếu có thay đổi vị trí của con cá
    if LFlag then
    begin
      // Tính toán lại tọa độ
      CalculateVerticalCoordinateOfTheFish;
      // Lưu lại tọa độ sau khi hiệu chỉnh
      FTapPosition := TPointF.Create(X, Y);
    end;
  end;
end;

procedure TGameForm.LayoutMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  FDragging := False;
end;

procedure TGameForm.LoadGameData;
var
  LStream: TFileStream;
begin
  FillChar(FGameData, SizeOf(FGameData), $00);

  FGameData.Character := 0;
  FGameData.Sound := 1;
  FGameData.Music := 1;
  if System.IOUtils.TFile.Exists(System.IOUtils.TPath.GetDocumentsPath + PathDelim + GAME_DATA_FILE) then
  begin
    try
      LStream := TFileStream.Create(System.IOUtils.TPath.GetDocumentsPath + PathDelim + GAME_DATA_FILE, fmOpenRead);
      LStream.Read(FGameData, SizeOf(FGameData));
      LStream.Free;
    except
    end;
  end;

  Sound := FGameData.Sound = 1;
  Music := FGameData.Music = 1;
  SetToggleImage(ToggleSound, FSoundEnabled);
  SetToggleImage(ToggleMusic, FMusicEnabled);
  MainFishImageIndex := FGameData.Character;
end;

function TGameForm.MidPositionOfTheFish: Single;
begin
  case MainFishImageIndex of
    0: Result := 95 * TheFish.Height / 157;
    1: Result := 163 * TheFish.Height / 244;
  end;
end;

function TGameForm.IsOverlap(const AObject: TRectangle; const AUseClipper: Boolean = True): Boolean;

  function PointInRect(const X, Y: Single; const ARect: TRectangle): Boolean; {$IFDEF RELEASE} inline; {$ENDIF}
  begin
    Result :=
      (X >= ARect.Position.X) and (X <= ARect.Position.X + ARect.Width) and
      (Y >= ARect.Position.Y) and (Y <= ARect.Position.Y + ARect.Height);
  end;

  function IsSimpleOverlap(const AObject1, AObject2: TRectangle): Boolean;
  var
    H, W: Single;
    X1, Y1: Single;
    X2, Y2: Single;
    X3, Y3: Single;
    X4, Y4: Single;
  begin
    H := AObject1.Height;
    W := AObject1.Width;

    X1 := AObject1.Position.X;
    Y1 := AObject1.Position.Y;

    X2 := X1 + W;
    Y2 := Y1;

    X3 := X1;
    Y3 := Y1 + H;

    X4 := X1 + W;
    Y4 := Y1 + H;

    Result := AObject2.Visible and (
         PointInRect(X1, Y1, AObject2) or
         PointInRect(X2, Y2, AObject2) or
         PointInRect(X3, Y3, AObject2) or
         PointInRect(X4, Y4, AObject2));
  end;

  procedure AdjustPath(var APath: ProjectF.GameUtils.Clipper.TPath; X, Y: Integer);
  var
    i: Integer;
  begin
    for i := Low(APath) to High(APath) do
    begin
      APath[i].X := APath[i].X + X;
      APath[i].Y := APath[i].Y + Y;
    end;
  end;

var
  LClip: ProjectF.GameUtils.Clipper.TPath;
  LSubject: ProjectF.GameUtils.Clipper.TPath;
begin
  Result := False;
  if Assigned(AObject) and AObject.Visible then
  begin
    // Kiểm tra các đối tượng Rectangle có giao nhau không
    if IsSimpleOverlap(TheFish, AObject) or IsSimpleOverlap(AObject, TheFish) then
    begin
      // Kiểm tra thêm bằng Clipper nếu được yêu cầu
      if AUseClipper then
      begin
        // Tham chiếu tới Clipper Data
        LSubject := ClipperSubject[MainFishImageIndex * GAME_LEVEL_MAX + Level - 1];
        // Copy dữ liệu qua chỗ khác
        SetLength(LSubject, Length(LSubject));
        // Hiệu chỉnh vị trí
        AdjustPath(LSubject, Trunc(TheFish.Position.X), Trunc(TheFish.Position.Y));
        // Tham chiếu tới Clipper Data
        LClip := ClipperClip[AObject.Kind * 2 + AObject.Direction];
        // Copy dữ liệu qua chỗ khác
        SetLength(LClip, Length(LClip));
        // Hiệu chỉnh lại vị trí
        AdjustPath(LClip, Trunc(AObject.Position.X), Trunc(AObject.Position.Y));
        // Đưa vào Clipper để xử lý
        FClipper.AddPath(LSubject, ptSubject, True);
        FClipper.AddPath(LClip, ptClip, True);
        // Kiểm tra có giao nhau không
        FClipper.Execute(ctIntersection, ClipperSolution, pftEvenOdd, pftEvenOdd);
        // Giải phóng bộ nhớ
        FClipper.Clear;
        // Đọc kết quả
        Result := Length(ClipperSolution) > 0;
      end
      else
        Result := True;
    end;
  end;
end;

procedure TGameForm.PauseGame(const AShowPausedDialog: Boolean = False);
begin
  if FGameState = TGameState.Running then
  begin
    FGameState := TGameState.Paused;
    SetGameThreadStatus(False);
    SetTimerStatus(False);

    if AShowPausedDialog then
      GamePopupPaused.Visible := True;
  end;
  SetSmallFishAniStatus(False);
end;

procedure TGameForm.ProcessCoins;
var
  LCoin: TRectangle;
begin
  for LCoin in FCoins do
  begin
    if LCoin.Tag = GAME_COIN_VISIBLE then
    begin
      if IsOverlap(LCoin, False) then begin
        // Phát âm thanh
        PlaySound(TGameSound.Coin);
        // Ẩn tiền xu bị ăn đi
        LCoin.Tag := GAME_COIN_HIDDEN;
        LCoin.Position.X := -100;
        // Tăng số tiền xu ăn được
        CoinCount := CoinCount + 1;
        // Tích lũy Shield
        ShieldThreshold := ShieldThreshold + 1;
        // Lưu vào thống kê
        Inc(FGameData.Coin);
      end;
    end;
  end;
end;

procedure TGameForm.ProcessFishCollision;
var
  LFish: TRectangle;
  LShield: Boolean;
  LFishingLineRect, LFishingHookRect: TRectF;
begin
  LShield := Shield > 0;
  // Xử lý cá thường
  for LFish in FFishes do
  begin
    if LFish.Visible then
    begin
      if IsOverlap(LFish) then
      begin
        // Kiểm tra xem cá nào ăn
        if (FLevel >= LFish.Tag) or (Angry > 0) then
        begin
          // Phát âm thanh
          PlaySound(TGameSound.Eating);
          // Tạo hiệu ứng
          CreateEatingEffect(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2);
          // Tích lũy Angry
          AngryThreshold := AngryThreshold + 1;
          // Tăng số cá ăn được
          FishCount := FishCount + LFish.Tag;
          // Xóa khỏi danh sách các con cá thường
          FFishes.Remove(LFish);
          // Ẩn cá bị ăn
          LFish.Visible := False;
          // Đưa vào cache
          FCachedFishes[LFish.Kind, LFish.Direction].Add(LFish);
          // Lưu vào thống kê
          Inc(FGameData.Fish);
        end
        else if not LShield then
        begin
          // Phát âm thanh
          PlaySound(TGameSound.Eating);
          // Tạo hiệu ứng
          CreateEatingEffect(TheFish.Position.X + TheFish.Width / 2, TheFish.Position.Y + TheFish.Height / 2);
          // Dừng game
          StopGame;
        end;
      end;
    end;
  end;


  // Xử lý các con sứa
  for LFish in FJellyFishes do
  begin
    if LFish.Visible then
    begin
      if IsOverlap(LFish) then
      begin
        if Angry > 0 then
        begin
          FJellyFishes.Remove(LFish);
          LFish.Visible := False;
          FCachedJellyFishes.Add(LFish);
          // Tạo hiệu ứng
          CreateEatingEffect(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2);
        end
        else if (LFish.Data <= 0) and not LShield then
        begin
          LFish.Data := 25;
          Health := Health - 25;
          PlaySound(TGameSound.Cuttle);
        end;
      end;
    end;
  end;

  // Xử lý các con mực
  for LFish in FCuttleFishes do
  begin
    if LFish.Visible then
    begin
      if IsOverlap(LFish) then
      begin
        if Angry > 0 then
        begin
          FCuttleFishes.Remove(LFish);
          LFish.Visible := False;
          FCachedCuttleFishes.Add(LFish);
          // Tạo hiệu ứng
          CreateEatingEffect(LFish.Position.X + LFish.Width / 2, LFish.Position.Y + LFish.Height / 2);
        end
        else if (LFish.Data <= 0) and not LShield then
        begin
          LFish.Speed := 10;
          PlaySound(TGameSound.Cuttle);
          ShowDarkPigment(LFish.Position.X + 50, LFish.Position.Y + 30);
        end;
      end;
    end;
  end;

  // Xử lý cá ngựa
  if IsOverlap(SeaHorse, False) then
  begin
    Health := 100;
    SeaHorse.Visible := False;
    PlaySound(TGameSound.Eating);
    Inc(FGameData.SeaHorse);
    // Tạo hiệu ứng
    CreateEatingEffect(SeaHorse.Position.X + SeaHorse.Width / 2, SeaHorse.Position.Y + SeaHorse.Height / 2);
  end;

  // Xử lý con sò
  if IsOverlap(ClamShell) and (ClamShell.Tag = 0) then
  begin
    // Đánh dấu đã xử lý
    ClamShell.Tag := 1;
    // 25% khả năng con cá bị con sò kẹp
    if (Random(100) mod 4 = 0) and not LShield then
    begin
      ClamShell.Fill.Bitmap.Bitmap.Assign(IlClamShell.Bitmap(TSizeF.Create(160, 153), CLAM_CLOSED_CLIP));
      StopGame;
    end
    else
    begin
      ClamShell.Fill.Bitmap.Bitmap.Assign(IlClamShell.Bitmap(TSizeF.Create(160, 153), CLAM_WITHOUT_PEARL));
      PlaySound(TGameSound.Magic);
      Angry := 30;
      Health := 100;
      Shield := 30;
      Inc(FGameData.Pearl);
    end;
  end;

  // Xử lý cần câu
  if not LShield and (TheFishingShip.Position.X < GAME_FORM_WIDTH) then
  begin
    LFishingLineRect.Top := FishingLine.Position.Y + TheFishingShip.Position.Y;
    LFishingLineRect.Left := FishingLine.Position.X + TheFishingShip.Position.X;
    LFishingLineRect.Width := FishingLine.Width;
    LFishingLineRect.Height := FishingLine.Height;

    LFishingHookRect.Top := LFishingLineRect.Top + FishingHook.Position.Y;
    LFishingHookRect.Left := LFishingLineRect.Left + FishingHook.Position.X;
    LFishingHookRect.Width := FishingHook.Width;
    LFishingHookRect.Height := FishingHook.Height;

    if LFishingLineRect.IntersectsWith(TheFish.BoundsRect) or LFishingHookRect.IntersectsWith(TheFish.BoundsRect) then
    begin
      StopGame(True, False);
      TheFish.RotationAngle := 90;
      TheFish.Parent := FishingLine;
      TheFish.Position.X := - MidPositionOfTheFish;
      TheFish.Position.Y := FishingLine.Height;
      AniFishingLineStep1.Stop;
      if not AniFishingLineStep2.Running then
        AniFishingLineStep2.Start;
    end;
  end;

end;

procedure TGameForm.AppBecameActive(Sender: TObject);
begin
  FAppIsActive := True;
end;

procedure TGameForm.AppEnteredBackground(Sender: TObject);
begin
  if GameState = TGameState.Running then
    PauseGame(True);

  FAppIsActive := False;
  MpBackgroundMusic.Stop;
  SaveGameData;
end;

procedure TGameForm.AppEventsBecameActive(Sender: TObject);
begin
  if Music then
    MpBackgroundMusic.Play;
end;

procedure TGameForm.AppFinishedLaunching(Sender: TObject);
var
  i: Integer;
  LNotification: TNotification;
begin
  FAppIsActive := True;
{
  // Hủy toàn bộ các notification đang có
  NotificationCenter.CancelAll;
  // Tạo các notification mới
  for i := 0 to 10 do
  begin
    // Tạo notification mới
    LNotification := NotificationCenter.CreateNotification;
    // Đặt tên cho notification
    LNotification.Name := i.ToString + 'Swim';
    // Đặt ngày đầu tiên xuất hiện của notification
    LNotification.FireDate := IncDay(DateOf(Now), 8 - DayOfWeek(Now) + i * 7 ) + EncodeTime(8, 30, 0, 0);
    // Lặp lại theo tuần
    LNotification.RepeatInterval := TRepeatInterval.None;
    case Language of
      TGameLanguage.English: begin
        // Đặt title cho notification
        LNotification.Title := 'Swim!!';
        // Nội dung của notification
        LNotification.AlertBody := 'Let''s jump into the ocean!!';
        // Gửi đến notification center
        NotificationCenter.ScheduleNotification(LNotification);
      end;

      TGameLanguage.Vietnamese: begin
        // Đặt title cho notification
        LNotification.Title := 'Bơi đi!!';
        // Nội dung của notification
        LNotification.AlertBody := 'Cùng bơi với biển xanh nào!!';
        // Gửi đến notification center
        NotificationCenter.ScheduleNotification(LNotification);
      end;
    end;
    // Giải phóng bộ nhớ
    LNotification.Free;
  end;
}
end;

procedure TGameForm.AppWillTerminate(Sender: TObject);
var
  LNotification: TNotification;
begin
  SaveGameData;
end;

procedure TGameForm.OnBtnBagesClick(Sender: TObject);
begin
  ButtonClickWithEffect(Sender as TRectangle,
    procedure (AButton: TRectangle)
    begin
      UpdateStats;
      ShowScreen(GameStats);
    end
  );
end;

procedure TGameForm.OnGamePausedButtonClick(Sender: TObject);
begin
  // Tạo hiệu ứng & xử lý lệnh
  ButtonClickWithEffect(Sender as TRectangle,
    procedure (AButton: TRectangle)
    begin
      // Xử lý lệnh cho nút bấm
      if AButton = BtnGamePausedExit then
      begin
        GamePopupPaused.Visible := False;
        // Cho các con cá hoạt động lại
        SetSmallFishAniStatus(True);
        // Dừng game (không hiển thị kết quả)
        StopGame(False);
        // Ở StopGame tắt TimerSmallFishCreation nên phải bật lại để tạo hiệu ứng cá bơi
        TimerSmallFishCreation.Enabled := True;
      end
      else
        ResumeGame;
    end
  );
end;

procedure TGameForm.ResumeGame;
begin
  if FGameState = TGameState.Paused then
  begin
    FGameState := TGameState.Running;
    GamePopupPaused.Visible := False;
    SetGameThreadStatus(True);
    SetTimerStatus(True);
    SetSmallFishAniStatus(True);
  end;
end;

procedure TGameForm.SaveGameData;
var
  LStream: TFileStream;
begin
  LStream := TFileStream.Create(System.IOUtils.TPath.GetDocumentsPath + PathDelim + GAME_DATA_FILE, fmOpenWrite or fmCreate);
  LStream.Write(FGameData, SizeOf(FGameData));
  LStream.Free;
end;

procedure TGameForm.SetAngry(const AValue: Integer);
var
  LThreshold: Integer;
begin
  if Level <= 5 then
    LThreshold := 50 * Level
  else
    LThreshold := 1000;

  if FAngry <> AValue then
  begin
    FAngry := AValue;
    EffectAngry.Enabled := FAngry > 0;

    // Bật báo động Angry sắp hết
    if FAngry = 3 then
      Shield := Max(5, Shield);

    // Tắt bộ hiệu chỉnh Shield khi Angry đã hết
    if FAngry = 0 then
    begin
      TimerAngry.Enabled := False;
      PieAngryProgress.EndAngle := FAngryThreshold / LThreshold * 360 - 90;
      GameSpeed := 1;
    end
    else if TimerAngry.Enabled = False then
    begin
      // Bật lại bộ hiệu chỉnh Angry nếu nó đang tắt (trước đó FAngry = 0)
      TimerAngry.Enabled := True;
      GameSpeed := 0.5;
    end;
  end;
end;

procedure TGameForm.SetAngryThreshold(const AVAlue: Integer);
var
  LThreshold: Integer;
begin
{$IFDEF SUPERMODE}
  LThreshold := 20;
{$ELSE}
  if Level <= 5 then
    LThreshold := 50 * Level
  else
    LThreshold := 500;
{$ENDIF}

  if FAngryThreshold <> AValue then
  begin
    if (AValue >= LThreshold) then
    begin
      Angry := 30; // 30s
      FAngryThreshold := 0; // Xóa giá trị
      PlaySound(TGameSound.PowerUp);
    end
    else
    begin
      FAngryThreshold := AValue;
    end;
    PieAngryProgress.EndAngle := FAngryThreshold / LThreshold * 360 - 90;
  end;
end;

procedure TGameForm.OnGameSettingMainFishKindClick(Sender: TObject);
begin
  ButtonClickWithEffect(Sender as TRectangle,
    procedure (AButton: TRectangle)
    var
      LFishKind: Integer;
    begin
      if AButton = BtnGameSettingBack then
        LFishKind := MainFishImageIndex - 1
      else if AButton = BtnGameSettingForward then
        LFishKind := MainFishImageIndex + 1;

      MainFishImageIndex := (GAME_MAIN_FISH_KIND_MAX + LFishKind) mod GAME_MAIN_FISH_KIND_MAX;
    end
  );
end;

procedure TGameForm.ButtonClickWithEffect(const AButton: TRectangle; const AProc: TProc<TRectangle>);
begin
  if Sound then
    PlaySound(TGameSound.Click);

  // Hiển thị ảnh nhấn nút bấm
  AButton.Fill.Bitmap.Bitmap.Assign(
    IlButtonActive.Bitmap(
      TSizeF.Create(AButton.Width * FScreenScale , AButton.Height * FScreenScale),
      AButton.Tag)
  );
  // Trả lại ảnh gốc
  TThread.CreateAnonymousThread(
    procedure
    begin
      Sleep(GAME_BUTTON_TRANISTION);
      /////////////////////
      TThread.Synchronize(nil,
        procedure
        begin
          AButton.Fill.Bitmap.Bitmap.Assign(
            IlButtonNormal.Bitmap(
              TSizeF.Create(AButton.Width * FScreenScale , AButton.Height * FScreenScale),
              AButton.Tag)
          );
          // Xử lý lệnh
          AProc(AButton);
        end
      );
    end
  ).Start;
end;

procedure TGameForm.SetCoinCount(const AValue: Integer);
begin
  if FCoinCount <> AValue then
  begin
    FCoinCount := AValue;
    LblCoinCount.Text := FCoinCount.ToString;
    UpdateScore;
  end;
end;

procedure TGameForm.SetFishCount(const AValue: Integer);
begin
  if FFishCount <> AValue then
  begin
    FFishCount := AValue;
    LblFishCount.Text := FFishCount.ToString;
    // Tính lại điểm
    UpdateScore;
    // Cập nhật lại level
    UpdateLevel;
  end;
end;

procedure TGameForm.SetGameSpeed(const AValue: Real);
begin
  FGameSpeed := AValue;
  AjustFishCreationSpeed;
end;

procedure TGameForm.SetGameState(const AValue: TGameState);
begin
  if FGameState <> AValue then
  begin
    FGameState := AValue;
    case FGameState of
      TGameState.Stopped: ;
      TGameState.Running: ;
      TGameState.Paused : ;
    end;
  end;
end;

procedure TGameForm.SetHealth(const AValue: Integer);
begin
  ///
  if (FHealth <> AValue) and (AValue <= 100) then
  begin
    FHealth := AValue;
    LblHealth.Text := FHealth.ToString;
    // Tạm tắt bộ trừ sức khỏe
    TimerHealth.Enabled := False;
    // Nếu FHealth = 0 thì kết thúc game, ngược lại thì bật bộ giảm trừ sức khỏe
    if FHealth <= 0 then StopGame else TimerHealth.Enabled := True;
  end;
end;

procedure TGameForm.SetLanguage(const AValue: TGameLanguage);
var
  LHelp: TStringList;
begin
  if FLanguage <> AValue then
  begin
    FLanguage := AValue;

    LHelp := TStringList.Create;

    case FLanguage of
      TGameLanguage.English: begin
        LblPlay.Text := 'Play';
        LblSetting.Text := 'Setting';
        LblExit.Text := 'Exit';
        ////////////////////////
        LblGameSettingTitle.Text := 'Setting';
        LblGameSettingSound.Text := 'Sound';
        LblGameSettingMusic.Text := 'Music';
        LblGameSettingBtnReturn.Text := 'Back';

        LblGameStatsTitle.Text := 'Stats';
        LblGameStatsLabel1.Text := 'Best score:';
        LblGameStatsLabel2.Text := 'Fish:';
        LblGameStatsLabel3.Text := 'Gold coin:';
        LblGameStatsLabel4.Text := 'Shark:';
        LblGameStatsLabel5.Text := 'Pearl:';
        LblGameStatsReturn.Text := 'Back';

        LblGameCompletelTitle.Text := 'Result';

        LblPopupLeaveTitle.Text := 'Confirm?';
        LblPopupLeaveText.Text := 'Are you sure'#9#13' to leave the game?';

        LHelp.Add('Touch anywhere on the screen to move the fish');
        LHelp.Add('');
        LHelp.Add('*******');
        LHelp.Add('');

        LHelp.Add('Taking on the role of a fish, you have to be vigilant for obstacles that include larger predators, poisonous jelly fish, aggressive sharks, hungry fishermen awaiting crispy fried fish fillets for dinner, and naval mines that are gonna tear you apart.');
        LHelp.Add('');
        LHelp.Add('Always check the numbers that are going backwards in the green circle at the top right corner.' + ' It shows how much energy you have. Low energy? Not a big deal! Boost your energy by munching smaller fish. As smaller fish are eaten, you grow in size and become capable of eating larger fish.');
        LHelp.Add('');
        LHelp.Add('Don’t forget to collect as many collect coins as you can along the way. ' + 'The more coins you collect, the higher score you gain. Once you have collected 100 gold coins, wait for a miracle to happen.');
        LHelp.Add('');
        LHelp.Add('Have fun!! ');
        LHelp.Add('');
        LHelp.Add('This app uses some resources from: ');
        LHelp.Add('www.freepik.com ');
        LHelp.Add('www.freesound.org ');
        LHelp.Add('www.fleamedia.com ');
        LHelp.Add('www.phongchuviet.com ');
      end;

      TGameLanguage.Vietnamese: begin
        //LblGameMenuTitle.Text := 'Menu';
        LblPlay.Text := 'Chơi ngay';
        LblSetting.Text := 'Cấu hình';
        LblExit.Text := 'Thoát';
        //////////////
        LblGameSettingTitle.Text := 'Cấu hình';
        LblGameSettingSound.Text := 'Âm thanh';
        LblGameSettingMusic.Text := 'Nhạc nền';
        LblGameSettingBtnReturn.Text := 'Quay lại';

        LblGameStatsTitle.Text := 'Thống kê';
        LblGameStatsLabel1.Text := 'Điểm cao:';
        LblGameStatsLabel2.Text := 'Lượng cá:';
        LblGameStatsLabel3.Text := 'Tiền vàng:';
        LblGameStatsLabel4.Text := 'Cá mập:';
        LblGameStatsLabel5.Text := 'Ngọc trai:';
        LblGameStatsReturn.Text := 'Quay lại';

        LblGameCompletelTitle.Text := 'Kết quả';

        LblPopupLeaveTitle.Text := 'Dừng?';
        LblPopupLeaveText.Text := 'Bạn có muốn dừng không?';

        LHelp.Add('Chạm vào bất kì vị trí nào trên màn hình để chơi');
        LHelp.Add('');
        LHelp.Add('*******');
        LHelp.Add('');

        LHelp.Add('Vào vai một chú cá, bạn hãy dùng tay di chuyển nó tránh các' + ' chướng ngại trên đường đi: những con cá lớn hơn, những con sứa có chất độc, ' + 'con cá mập chỉ chực cắn bạn, hay người đi câu luôn muốn biến bạn thành món cá chiên giòn, ' + 'thậm chí những quả ngư lôi lạc đích có sức công phá ghê gớm dễ dàng xé nát bạn ra. ');
        LHelp.Add('');
        LHelp.Add('Không những thế, khi bơi, năng lượng của bạn tiêu hao rất nhiều' + ' (hãy nhìn con số đang đếm lùi ở ô tròn to màu xanh lá phía trên cùng' + ' bên phải khi chơi, nếu con số này về 0 là bạn kiệt sức và chết),' + ' hãy bù đắp năng lượng bằng cách ăn những chú cá nhỏ hơn. Việc này còn giúp bạn lớn lên,' + ' đến một mức nào đó bạn sẽ ăn được những con cá lớn hơn. ');
        LHelp.Add('');
        LHelp.Add('Bạn đừng quên thu thập những đồng tiền vàng' + ' trên đường đi nhé! Nó sẽ giúp điểm số của bạn nhảy lên' + ' thật cao (ô tròn to màu vàng phía trên cùng bên trái). Và hơn hết, điều kì' + ' diệu sẽ xảy ra nếu bạn thu thập được 100 đồng tiền vàng. ');
        LHelp.Add('');
        LHelp.Add('Chúc bạn may mắn!!! ');
        LHelp.Add('');
        LHelp.Add('Chương trình có sử dụng những tài nguyên từ: ');
        LHelp.Add('www.freepik.com ');
        LHelp.Add('www.freesound.org ');
        LHelp.Add('www.fleamedia.com ');
        LHelp.Add('www.phongchuviet.com ');
      end;
    end;
    LHelp.Free;
  end;
end;

procedure TGameForm.SetLevel(const AValue: Integer);
begin
  if FLevel <> AValue then
  begin
    FLevel := AValue;
    UpdateMainFishImage;
    AjustFishCreationSpeed;
  end;
end;

procedure TGameForm.SetPlayingDuration(const AValue: Integer);
begin
  if FPlayingDuration <> AValue then
  begin
    FPlayingDuration := AValue;
    UpdateScore;
  end;
end;

procedure TGameForm.SetMainFishImageIndex(const AValue: Integer);
begin
  if FMainFishImageIndex <> AValue then
  begin
    FMainFishImageIndex := AValue;
    // Lưu vào data
    FGameData.Character := AValue;
    // Cập nhật lại ảnh chính
    UpdateMainFishImage;
    // Cập nhật lại hình ở Rectangle Setting
    FillRectangle(GameSettingFishPlaceHolder, IlMainFish, FMainFishImageIndex);
  end;
end;

procedure TGameForm.SetMusic(const AValue: Boolean);
begin
  if FMusicEnabled <> AValue then
  begin
    FMusicEnabled := AValue;
    FGameData.Music := IfThen(AValue, 1, 0);
    SetToggleImage(ToggleMusic, FMusicEnabled);

    if not FMusicEnabled then
      MpBackgroundMusic.Stop
    else
      MpBackgroundMusic.Play;
  end;
end;

procedure TGameForm.SetShield(const AValue: Integer);
begin
  if FShield <> AValue then
  begin
    FShield := AValue;
    ShieldEffect.Visible := FShield > 0;

    // Bật báo động Shield sắp hết
    if FShield = 3 then
    begin
      ShieldEffect.Opacity := 0.25;
      AniShieldAlert.Enabled := True
    end
    else if FShield > 3 then
    begin
      ShieldEffect.Opacity := 0.25;
      AniShieldAlert.Enabled := False;
    end;

    // Tắt bộ hiệu chỉnh Shield khi Shield đã hết
    if FShield = 0 then
    begin
      TimerShield.Enabled := False;
      PieShieldProgress.EndAngle := FShieldThreshold / 150 * 360 - 90;
    end
    else if TimerShield.Enabled = False then
      // Bật lại bộ hiệu chỉnh Shield nếu nó đang tắt (trước đó FShield = 0)
      TimerShield.Enabled := True;
  end;
end;

procedure TGameForm.SetShieldThreshold(const AValue: Integer);
begin
  if FShieldThreshold <> AValue then
  begin
    if AValue >= 100 then
    begin
      Shield := 30;
      FShieldThreshold := 0;
      PlaySound(TGameSound.Magic);
    end
    else
    begin
      FShieldThreshold := AValue;
    end;
    PieShieldProgress.EndAngle := FShieldThreshold / 100 * 360 - 90;
  end;
end;

procedure TGameForm.SetSmallFishAniStatus(const AStatus: Boolean);
var
  LAni: TAnimation;
begin
  for LAni in FSmallFishAnimations do
    LAni.Pause := not AStatus;
end;

procedure TGameForm.SetSound(const AValue: Boolean);
begin
  if FSoundEnabled <> AValue then
  begin
    FSoundEnabled := AValue;
    FGameData.Sound := IfThen(AValue, 1, 0);
    SetToggleImage(ToggleSound, FSoundEnabled);
  end;
end;

procedure TGameForm.SetGameThreadStatus(const AStatus: Boolean);
begin
  TGameUIThread(FBackdropThread).Active := AStatus;
  TGameUIThread(FSharkThread).Active := AStatus;
  TGameUIThread(FJellyFishAnimationThread).Active := AStatus;
  TGameUIThread(FShipThread).Active := AStatus;
end;

procedure TGameForm.SetTimerStatus(const AStatus: Boolean);
begin
  TimerMusic.Enabled := AStatus;
  TimerSmallFishCreation.Enabled := AStatus;
  TimerCoinCreatation.Enabled := AStatus;
  TimerFishCreation.Enabled := AStatus;
  TimerHealth.Enabled := AStatus;
  TimerPlayingDurationCounter.Enabled := AStatus;
  TimerJellyOrCuttleFishCreation.Enabled := AStatus;
  TimerSeaHorseCreation.Enabled := AStatus;
  TimerClamShellCreation.Enabled := AStatus;
end;

procedure TGameForm.SetToggleImage(const AToggle: TRectangle; const AValue: Boolean);
var
  LBitmap: FMX.Graphics.TBitmap;
begin
  if AValue then
    LBitmap :=  IlButtonActive.Bitmap(TSizeF.Create(38 * FScreenScale , 18 * FScreenScale), GAME_BUTTON_TOGGLE)
  else
    LBitmap :=  IlButtonNormal.Bitmap(TSizeF.Create(38 * FScreenScale , 18 * FScreenScale), GAME_BUTTON_TOGGLE);
  // Gán ảnh mới vào
  AToggle.Fill.Bitmap.Bitmap.Assign(LBitmap);
end;

procedure TGameForm.ThrowFishingLure;
var
  S1, S2: Single;
begin
  if not FStartFishingLineIsStarted then
  begin
    FStartFishingLineIsStarted := True;
    case Level of
      1, 2:
        begin
          AniFishingLineStep1.Duration := 2;
          AniFishingLineStep2.Delay := 0.5;
          S1 := 20;
          S2 := 150;
        end;
      3: begin
        AniFishingLineStep1.Duration := 1.5;
        AniFishingLineStep2.Delay := 0.625;
        S1 := 20;
        S2 := 200;
      end;
      else begin
        AniFishingLineStep1.Duration := 1;
        AniFishingLineStep2.Delay := 0.75;
        S1 := 20;
        S2 := 250;
      end;
    end;

    AniFishingLineStep1.StartValue := S1;
    AniFishingLineStep1.StopValue := S2;
    AniFishingLineStep2.StartValue := S2;
    AniFishingLineStep2.StopValue := S1;

    AniFishingLineStep1.Start;
    PlaySound(TGameSound.Reel);
  end;
end;

procedure TGameForm.StartGame;
begin
  // Bật sang trang thái đang chơi
  FGameState := TGameState.Running;
  // Bật Shield cho cá trong 10s đầu
  Shield := 10;
  ShieldThreshold := 0;
  GameSpeed := 1;
  // Xóa tiền vàng
  CoinCount := 0;
  // Xóa lượng cá ăn được
  FishCount := 0;
  // Cấp độ hiện thời của cá
  Level := GAME_DEFAULT_LEVEL;
  // Khởi tạo giá trị sức khỏe
  Health := 100;
  // Sự giận dữ
  Angry := 0;
  AngryThreshold := 0;
  // Quãng đường đi được
  FPlayingDuration := 0;
  // Tàu cá
  FStartFishingLineIsStarted := False;
  // Tàu chiến
  TheTorpedo.Visible := False;
  BombEffect.Enabled := False;
  FBombFlag := False;
  // Hiển thị bản điểm
  Banner.Position.Y := -55;
  Banner.Visible := True;
  TAnimator.AnimateFloat(Banner, 'Position.Y', 6, 0.5);
  // Đưa con cá ra ngoài màn hình phía phải để ẩn đi
  TheFish.Position.X := Width + TheFish.Width;
  TheFish.Position.Y := 200;
  TheFish.Visible := True;
  TheFish.Parent := Layout;
  TheFish.RotationAngle := 0;
  UpdateMainFishImage;
  // Đưa con cá lên trên cùng
  TheFish.BringToFront;
  // Tạo hiệu ứng chuyển động đưa con cá vào vị trí sẵn sàng
  TAnimator.AnimateFloatWait(TheFish, 'Position.X', GAME_FORM_WIDTH - 300 - TheFish.Width, 1.5);
  // Kích hoạt các thread
  TGameUIThread(FCoinAndCuttleFishAnimationThread).ResumeGame;
  TGameUIThread(FJellyFishAnimationThread).ResumeGame;
  TGameUIThread(FSharkThread).ResumeGame;
  TGameUIThread(FShipThread).ResumeGame;
  // Bật bộ tạo ngọc trai
  ShowClamShell;
  // Bật các Timer
  SetTimerStatus(True);
end;

procedure TGameForm.StopGameDelay;
begin
  // Đánh dấu game đã kết thúc
  FGameState := TGameState.Stopped;
  TheFish.Visible := False;
  //
  TThread.CreateAnonymousThread(
    procedure
    begin
      // Tạm ngưng một chút
      Sleep(500);
      // Gọi thủ tục kết thúc game
      TThread.Synchronize(nil,
        procedure
        begin
          StopGame;
        end
      );
    end
  ).Start;
end;

procedure TGameForm.StopGame(const AShowTheResult: Boolean; const AHideTheFish: Boolean);
begin
  FDragging := False;
  FGameState := TGameState.Stopped;

  SetTimerStatus(False);
  TheFish.Visible := not AHideTheFish;
  RectBestScore.Visible := False;
  if AShowTheResult then
  begin
    if GameScore > FGameData.BestScore then
    begin
      FGameData.BestScore := GameScore;
      RectBestScore.Visible := True;
      AniBestScore.Start;
    end;

    PlaySound(TGameSound.Die);
    SaveGameData;
    ShowGameResult;
  end
  else
    ShowScreen(GameMenu);
end;

procedure TGameForm.TheFishResize(Sender: TObject);
begin
  // Nếu đang thay đổi kích thước thì thoát
  if FFishResizing then
    Exit;

  // Đặt cờ đang thay đổi kích thước
  FFishResizing := True;
  // Thay đổi chiều cao của con cá
  if MainFishImageIndex = 0 then
    TheFish.Height := 157 * TheFish.Width / 200
  else if FMainFishImageIndex = 1 then
    TheFish.Height := 244 * TheFish.Width / 400;
  // Đặt lại vị trí của con cá sao cho người chơi chỉ thấy cá thay đổi kích thước
  TheFish.Position.Y := FFishVerticalCoordinate - TheFish.Height / 2;
  // Xóa cờ thay đổi kích thước
  FFishResizing := False;
end;

procedure TGameForm.TimerAngryTimer(Sender: TObject);
begin
  if FGameState = TGameState.Running then
    Angry := Angry - 1;
end;

procedure TGameForm.TimerClamShellCreationTimer(Sender: TObject);
begin
  if FGameState = TGameState.Running then
  begin
    ClamShell.Fill.Bitmap.Bitmap.Assign(IlClamShell.Bitmap(TSizeF.Create(160, 153), CLAM_WITH_PEARL));
    ClamShell.Tag := 0;
    ClamShell.Position.X := -100;
    ClamShell.Visible := True;
  end;
  // Tạm tắt đi, BackdropThread sẽ bật lại
  TimerClamShellCreation.Enabled := False;
end;

procedure TGameForm.TimerCoinCreatationTimer(Sender: TObject);
begin
  CreateCoins;
  TimerCoinCreatation.Enabled := False;
  TimerCoinCreatation.Interval := Trunc(FDuration1 * 2 + (Random(5) + FDuration1 / 3000) * 1000);
  TimerCoinCreatation.Enabled := True;
end;

procedure TGameForm.TimerCollisionProcessTimer(Sender: TObject);
begin
  AniAfterProcessingAll(nil)
end;

procedure TGameForm.TimerCoralCreationTimer(Sender: TObject);
var
  r, i: Integer;
begin
  TimerCoralCreation.SetInterval((4 + Random(5)) * 1000);
  if GameState <> TGameState.Paused then
  begin
    r := Random(Length(FCorals));
    for i := Low(FCorals) to High(FCorals) do
      if FCorals[(r + i) mod Length(FCorals)].Visible = False  then
      begin
        FCorals[(r + i) mod Length(FCorals)].Position.X := -100;
        FCorals[(r + i) mod Length(FCorals)].Visible := True;
        // Tránh trùng con sò
        if ClamShell.BoundsRect.IntersectsWith(FCorals[(r + i) mod Length(FCorals)].BoundsRect) then
          FCorals[(r + i) mod Length(FCorals)].Position.X := -200;
        Break;
      end;
  end;
end;

procedure TGameForm.TimerDarkPigmentTimer(Sender: TObject);
const
{$J+}
  Phase: Integer = 0;
{$J-}
begin
  // Bắt đầu vẽ
  Canvas.BeginScene;
  // Xử lý theo pha
  case Phase of
    0: begin
      DarkPigment1.Visible := False;
      DarkPigment2.Visible := True;
      DarkPigment3.Visible := False;
      Phase := 1;
    end;

    1: begin
      DarkPigment1.Visible := False;
      DarkPigment2.Visible := False;
      DarkPigment3.Visible := True;
      Phase := 2;
    end;

    2: begin
      DarkPigment1.Visible := False;
      DarkPigment2.Visible := False;
      DarkPigment3.Visible := False;
      DarkPigment.Fill.Color := TAlphaColorRec.Black;
      Phase := 3;
    end;

    3: begin
      DarkPigment.Opacity := 0.90;
      Phase := 4;
    end;

    4: begin
      DarkPigment.Opacity := 0.35;
      Phase := 5;
    end

    else begin
      TimerDarkPigment.Enabled := False;
      DarkPigment.Visible := False;
      DarkPigment.Opacity := 1;
      Phase := 0;
      // Lưu vào thống kê
      Inc(FGameData.CuttleFish);
    end;
  end;
  // Cập nhật lại màn hình
  Canvas.EndScene;
end;

procedure TGameForm.TimerEatingEffectTimer(Sender: TObject);
var
  LEatingEffect: TRectangle;
begin
  Canvas.BeginScene;
  // Hình ảnh hiệu ứng ăn cá
  for LEatingEffect in FEatingEffectList do
    LEatingEffect.NextImage;
  Canvas.EndScene;
end;

procedure TGameForm.TimerFishCreationTimer(Sender: TObject);
begin
  if FGameState = TGameState.Running then
    CreateFish;
end;

procedure TGameForm.TimerSeaHorseCreationTimer(Sender: TObject);
begin
  SeaHorse.Position.X := -50;
  SeaHorse.Position.Y := Random(GAME_FORM_HEIGHT - 100) + 80;
  SeaHorse.Visible := True;
end;

procedure TGameForm.TimerShieldTimer(Sender: TObject);
begin
  if FGameState = TGameState.Running then
    Shield := Shield - 1;
end;

procedure TGameForm.TimerSmallFishCreationTimer(Sender: TObject);
begin
  // Tạm tắt bộ đếm
  TimerSmallFishCreation.Enabled := False;
  // Gọi thủ tục tạo đàn cá
  CreateSmallFishes;
  // Hẹn giờ tạo đàn cá nhỏ
  TimerSmallFishCreation.Interval := (Random(3) + IfThen(Level < 3, 3, 7)) * 1000;
  // Thực thi bộ đếm
  TimerSmallFishCreation.Enabled := True;
end;

procedure TGameForm.OnToggleClick(Sender: TObject);
begin
  if Sender = ToggleMusic then
    Music := not Music
  else if Sender = ToggleSound then
    Sound := not Sound;
end;

procedure TGameForm.UpdateLevel;
begin
{$IFNDEF SUPERMODE}
  if FFishCount >= 4500 then
    Level := 6
  else if FFishCount >= 1500 then
    Level := 5
  else if FFishCount >= 500 then
    Level := 4
  else if FFishCount >= 150 then
    Level := 3
  else if FFishCount >= 50 then
    Level := 2
  else
    Level := 1;
{$ELSE}
  if FFishCount >= 4500 then
    Level := 6
  else if FFishCount >= 1500 then
    Level := 5
  else if FFishCount >= 500 then
    Level := 4
  else if FFishCount >= 15 then
    Level := 3
  else if FFishCount >= 5 then
    Level := 2
  else
    Level := 1;
{$ENDIF}
end;

procedure TGameForm.UpdateMainFishImage;
begin
  if MainFishImageIndex = 0 then
    case Level of
      1: TheFish.Width := 45;
      2: TheFish.Width := 64;
      3: TheFish.Width := 85;
      4: TheFish.Width := 97;
      5: TheFish.Width := 115;
      6: TheFish.Width := 121;
      7: TheFish.Width := 140;
    end
  else if MainFishImageIndex = 1 then
    case Level of
      1: TheFish.Width := 46;
      2: TheFish.Width := 61;
      3: TheFish.Width := 82;
      4: TheFish.Width := 98;
      5: TheFish.Width := 115;
      6: TheFish.Width := 135;
      7: TheFish.Width := 155;
    end;

  FillRectangle(TheFishImage, IlMainFish, MainFishImageIndex);
end;

procedure TGameForm.UpdateScore;

  function FormatNumber(const ANumber: Integer): string;
  begin
    Result := ANumber.ToString;
    if ANumber < 10 then
      Result := '00' + Result
    else if ANumber < 100 then
      Result := '0' + Result;
  end;

var
  k: Integer;
  LTextWidth: Single;
begin
  FGameScore := FFishCount * 7 + FCoinCount * 11 + FPlayingDuration * 3;
  k := FGameScore div 1000;
  if k > 0 then
  begin
    LblGameScore.TextSettings.Font.Size := 15;
    LblGameScore.Text := FormatNumber(FGameScore mod 1000);
    // Tính toán tọa độ cho phần ngàn của điểm số
    LblGameScore.Canvas.Font.Family := 'Skranji';
    LblGameScore.Canvas.Font.Size := 15;
    LTextWidth := LblGameScore.Canvas.TextWidth(LblGameScore.Text);
    // Hiệu chỉnh vị trí (căn lề trái so với LblGameScore)
    LblGameScoreSuper.Position.X := (LblGameScore.Width - LTextWidth) / 2;
    LblGameScoreSuper.Text := k.ToString + ',';
  end
  else
  begin
    LblGameScore.TextSettings.Font.Size := 18;
    LblGameScore.Text := FGameScore.ToString;
    LblGameScoreSuper.Text := '';
  end;
end;

procedure TGameForm.UpdateStats;
begin
  LblGameStatsBestScore.Text := AddThousandSeparator(FGameData.BestScore.ToString);
  LblGameStatsFish.Text := AddThousandSeparator(FGameData.Fish.ToString);
  LblGameStatsCoin.Text := AddThousandSeparator(FGameData.Coin.ToString);
  LblGameStatsPearl.Text := AddThousandSeparator(FGameData.Pearl.ToString);
  LblGameStatsShark.Text := AddThousandSeparator(FGameData.Shark.ToString);
end;

procedure TGameForm.Viberate(const ADuration: Integer);
begin
  {$IF Defined(ANDROID)}
  TVibrator.Vibrate(ADuration);
  {$ENDIF}
end;

{ TBackdropThread }

procedure TBackdropThread.Execute;
var
  LCommandTime: Cardinal;
begin
  // Lưu thời gian ban đầu
  FTickcount := GetTickCount;
  // LCommand: chẵn -> xử lý hình ảnh; lẽ -> xử lý ăn cá + xu
  LCommandTime := 0;
  // Lặp nếu chưa tắt game
  while not Terminated do
  begin
    // Xử lý ở MainThread
    TThread.Synchronize(TThread.CurrentThread,
      procedure
      var
        i: Integer;
        LPosition: Single;
        LFish, LBubble: TRectangle;
        LNow, LDelta: Cardinal;
      label
        XuLyHinhAnh;
      begin
        with GameForm do
        begin
          XuLyHinhAnh:
          // Tính thời gian hiện tại
          LNow := GetTickCount;
          // Tính khoản thời gian đã trôi qua
          LDelta := LNow - FTickcount;
          // Lưu thời gian hiện tại lại
          FTickcount := LNow;
          // Chỉ xử lý nếu game ko dừng
          if GameState <> TGameState.Paused then
          begin
            // Bắt đầu vẽ
            Canvas.BeginScene;
            // Tính toán tọa độ mới cho dãi đất
            LPosition := Background1.Position.X + FStep1 * LDelta;
            if LPosition > 0 then
              LPosition := BACKDROP_START_POSITION;
            // Gán tọa độ mới cho dãi đất
            Background1.Position.X := LPosition;
            // Tính toán tọa độ mới cho dãi san hô
            LPosition := Background2.Position.X + FStep2 * LDelta;
            if LPosition > 0 then
              LPosition := BACKDROP_START_POSITION;
            // Gán tọa độ mới cho dãi san hô
            Background2.Position.X := LPosition;

            // Dịch chuyển các đồng xu
            for i := 1 to COIN_COUNT do
              if FCoins[i].Tag = GAME_COIN_VISIBLE then
              begin
                LPosition := FCoins[i].Position.X + FStep3 * LDelta;
                if LPosition < GAME_FORM_WIDTH then
                  FCoins[i].Position.X := LPosition
                else
                  FCoins[i].Tag := GAME_COIN_VISIBLE;
              end;

            // Dịch chuyển con cá ngựa
            if SeaHorse.Visible then
            begin
              LPosition := SeaHorse.Position.X + FStep1 * LDelta * 3;
              if LPosition > GAME_FORM_WIDTH then
                SeaHorse.Visible := False
              else
                SeaHorse.Position.X := LPosition;
            end;

            // Dịch chuyển các bong bóng
            for LBubble in FBubbleList do
            begin
              LPosition := LBubble.Position.Y - FStep1 * LDelta * LBubble.Speed;
              if LBubble.Position.Y < -20 then
              begin
                FBubbleList.Remove(LBubble);
                FCachedBubbleList.Add(LBubble);
                LBubble.Visible := False;
              end
              else
              begin
                LBubble.Position.X := LBubble.Position.X + FStep1 * LDelta / 1.75;
                LBubble.Position.Y := LPosition;
              end;
            end;

            //TODO: có 1 exception ở đây
            // Dịch chuyển các con sứa
            for LFish in FJellyFishes do
            begin
              if LFish.Data <= 0 then
              begin
                LPosition := LFish.Position.X + FStep1 * LDelta * LFish.Speed;
                if LPosition < GAME_FORM_WIDTH then
                  LFish.Position.X := LPosition
                else
                begin
                  FJellyFishes.Remove(LFish);
                  FCachedJellyFishes.Add(LFish);
                  LFish.Visible := False;
                end;
              end
              else
              begin
                LFish.Position.X := LFish.Position.X + FStep1 * LDelta * LFish.Speed;
                LFish.Position.Y := LFish.Position.Y - FStep1 * LDelta / 3;
                LFish.Data := LFish.Data - Trunc(FStep1 * LDelta / 3);
              end;
            end;

            // Dịch chuyển các con mực
            for LFish in FCuttleFishes do
            begin
              LPosition := LFish.Position.X + FStep1 * LDelta * LFish.Speed;
              if LPosition < GAME_FORM_WIDTH then
                LFish.Position.X := LPosition
              else
              begin
                FCuttleFishes.Remove(LFish);
                LFish.Visible := False;
                FCachedCuttleFishes.Add(LFish);
               end;
            end;

            // Dịch chuyển con sò
            if ClamShell.Visible then
            begin
              LPosition := ClamShell.Position.X + FStep1 * LDelta;
              if LPosition < GAME_FORM_WIDTH then
                ClamShell.Position.X := LPosition
              else
              begin
                ClamShell.Visible := False;
                ShowClamShell;
              end;
            end;

            for i := Low(FCorals) to High(FCorals) do
            begin
              if FCorals[i].Visible then
              begin
                LPosition := FCorals[i].Position.X + FStep1 * LDelta;
                if LPosition < GAME_FORM_WIDTH then
                  FCorals[i].Position.X := LPosition
                else
                begin
                  FCorals[i].Visible := False;
                end;
              end;
            end;

            // Dịch chuyển cá khác
            for LFish in FFishes do
            begin
              if LFish.Visible then
              begin
                case LFish.Direction of
                  DIRECTION_LEFT: begin
                    LPosition := LFish.Position.X + FStep1 * LDelta * (1.1 + LFish.Speed);
                    if LPosition < GAME_FORM_WIDTH then
                      LFish.Position.X := LPosition
                    else
                    begin
                      FFishes.Remove(LFish);
                      LFish.Visible := False;
                      FCachedFishes[LFish.Kind, LFish.Direction].Add(LFish);
                    end;
                  end;

                  DIRECTION_RIGHT: begin
                    LPosition := LFish.Position.X - FStep1 * LDelta * (1.1 + LFish.Speed);
                    if LPosition > - 250 then
                      LFish.Position.X := LPosition
                    else
                    begin
                      FFishes.Remove(LFish);
                      LFish.Visible := False;
                      FCachedFishes[LFish.Kind, LFish.Direction].Add(LFish);
                    end;
                  end;
                end;
              end;
            end;
            // Vẽ lên màn hình
            Canvas.EndScene;
          end;
        end;
      end
    );

    Sleep(0);
  end;
end;

{ TCoinAnimationThread }

procedure TCoinAndCuttleFishAnimationThread.Execute;
begin
  // Không cần kiểm tra xem game có đang chạy không, vì khi gọi GameStop đã tắt timer tạo xu & tạo mực + sứa
  while not Terminated do
  begin
    if TGameForm.GameState <> TGameState.Paused then
    begin
      // Gán hình ảnh cho các đồng xu
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        var
          i: Integer;
          LFish: TRectangle;
        begin
          with GameForm do
          begin
            Canvas.BeginScene;
            // Hình ảnh đồng xu
            for i := 1 to COIN_COUNT do
              if FCoins[i].Tag = GAME_COIN_VISIBLE then
                FCoins[i].NextImage;
            // Hình ảnh con mực
            for LFish in FCuttleFishes do
              LFish.NextImage;
            Canvas.EndScene;
          end
        end
      );
    end;

    Sleep(150);
  end;
end;

{ TRectangle }

procedure TRectangle.FillImage;
begin
  Fill.Bitmap.Bitmap.Assign(ImageList.Bitmap(TSizeF.Create(Width * GameForm.FScreenScale , Height * GameForm.FScreenScale), ImageIndex));
end;

procedure TRectangle.NextImage;
begin
  if Assigned(ImageList) then
  begin
    ImageIndex := (ImageIndex + 1) mod ImageCount;
    FillImage;
  end;
end;

{ TSharkMovingThread }

procedure TSharkMovingThread.Execute;
var
  LPhaseChanged: Boolean;
  LPhase: Integer; // Phase chuyển động của cá mập
  LStep: Single;
  LTheSharkIsBeingGone, LTheSharkIsGone: Boolean;
begin
  // Tạm ngưng 1 lúc trước khi con cá mập hiện lên màn hình lần đầu
  repeat
    CustomSleep(30 + Random(10));
  until ((TGameForm.GameState = TGameState.Running) and (GameForm.Level >= 3)) or Terminated;
  // Đánh dấu chưa khởi tạo bất cứ dữ liệu nào
  LPhase := 0;
  // Hệ số dịch chuyển của cá mập
  LStep := 1.5; // Nhanh hơn dãi đất 1.5 lần
  //
  LTheSharkIsGone := False;
  LTheSharkIsBeingGone := False;
  // Lặp
  while not Terminated do
  begin
    // Trường hợp cá mập bị trúng bom
    if GameForm.TheShark.Data <> 0 then
    begin
      GameForm.TheShark.Data := 0;
      // Xóa toàn bộ dữ liệu
      LTheSharkIsBeingGone := False;
      LTheSharkIsGone := False;
      LPhase := 0;
      // Chờ một lúc rồi chạy phiên tiếp theo
      repeat
        CustomSleep(30 + Random(10));
      until (TGameForm.GameState = TGameState.Running) or Terminated;
    end;

    // Cờ đánh dấu sự đổi pha
    LPhaseChanged := False;
    // Bắt đầu xử lý
    TThread.Synchronize(TThread.CurrentThread,
      procedure
      var
        LNow: Cardinal;
        LDelta: Integer;
        LPosition: Single;
      begin
        with GameForm do
        begin
          if (LPhase = 0) or (LTheSharkIsBeingGone and (LPhase = -1)) then
          begin
            // Xác định hướng ban đầu
            if not LTheSharkIsBeingGone then
            begin
              LPosition := 200;
              FTheSharkDirection := Random(20) mod 2;
              TheShark.Direction := FTheSharkDirection;
            end
            else
              LPosition := 175;
            // Thiết lập PathData
            case FTheSharkDirection of
              // Cá mập xuất hiện từ trái qua phải
              DIRECTION_LEFT: begin
                // Thu nhỏ kích thước và đưa con cá vào vị trí xuất phát
                TheShark.SetBounds(-SHARK_SMALL_WIDTH, LPosition, SHARK_SMALL_WIDTH, SHARK_SMALL_HEIGHT);
                // Đưa ảnh vào control
                TheShark.Fill.Bitmap.Bitmap.Assign(IlShark.Bitmap(TSizeF.Create(SHARK_IMAGE_WIDTH, SHARK_IMAGE_HEIGHT), SHARK_SMALL_LEFT));
              end;
              // Cá mập xuất hiện từ phải qua trái
              DIRECTION_RIGHT: begin
                // Thu nhỏ kích thước và đưa con cá vào vị trí xuất phát
                TheShark.SetBounds(Layout.Width + SHARK_SMALL_WIDTH, LPosition, SHARK_SMALL_WIDTH, SHARK_SMALL_HEIGHT);
                // Đưa ảnh vào control
                TheShark.Fill.Bitmap.Bitmap.Assign(IlShark.Bitmap(TSizeF.Create(SHARK_IMAGE_WIDTH, SHARK_IMAGE_HEIGHT), SHARK_SMALL_RIGHT));
              end;
            end;
            // Chuyển pha
            LPhase := 1;
            // Lưu thời điểm bắt đầu
            FTickCount := GetTickCount;
            // Hiện con cá lên màn hình
            TheShark.Visible := True;
            // Đưa con cá lui sau để tạo hiệu ứng ở xa
            TheShark.Parent := Background3;
            { Đây là việc hậu trường nên không cần gọi Canvas.EndScene; (vì con cá bị ẩn) }
          end
          else
          begin
            LNow := GetTickCount;
            LDelta := LNow - FTickCount;
            FTickCount := LNow;
            // Bắt đầu vẽ
            Canvas.BeginScene;
            // Đưa con cá mập lên trước
            TheShark.BringToFront;

            if LTheSharkIsBeingGone then
              TheShark.Position.Y := TheShark.Position.Y - FStep1 * FStep1 * LStep * LDelta * 2.5;

            case FTheSharkDirection of
              DIRECTION_LEFT: begin
                LPosition := TheShark.Position.X + FStep1 * LStep * LDelta * 0.95;
                if LPosition > GAME_FORM_WIDTH then
                begin
                  // Chuyển sang hình lớn
                  TheShark.SetBounds(GAME_FORM_WIDTH, 200, SHARK_NORMAL_WIDTH, SHARK_NORMAL_HEIGHT);
                  TheShark.Fill.Bitmap.Bitmap.Assign(IlShark.Bitmap(TSizeF.Create(SHARK_IMAGE_WIDTH, SHARK_IMAGE_HEIGHT), SHARK_NORMAL_RIGHT));
                  FTheSharkDirection := DIRECTION_RIGHT;
                  LPhaseChanged := True;
                  Inc(LPhase);

                  if LTheSharkIsBeingGone then
                  begin
                    // Con cá mập đã đi thực sự
                    LTheSharkIsGone := True;
                    // Ẩn đi đễ tiết kiệm bộ nhớ + thao tác vẽ
                    TheShark.Visible := False;
                    // Lưu vào thống kê
                    Inc(FGameData.Shark);
                  end;
                end
                else
                  TheShark.Position.X := LPosition;
              end;

              DIRECTION_RIGHT: begin
                LPosition := TheShark.Position.X - FStep1 * LStep * LDelta * 0.95;
                if LPosition < -250 { - SHARK_SMALL_WIDTH } then
                begin
                  TheShark.SetBounds(- SHARK_NORMAL_WIDTH, 200, SHARK_NORMAL_WIDTH, SHARK_NORMAL_HEIGHT);
                  TheShark.Fill.Bitmap.Bitmap.Assign(IlShark.Bitmap(TSizeF.Create(SHARK_IMAGE_WIDTH, SHARK_IMAGE_HEIGHT), SHARK_NORMAL_LEFT));
                  FTheSharkDirection := DIRECTION_LEFT;
                  LPhaseChanged := True;
                  Inc(LPhase);

                  if LTheSharkIsBeingGone then
                  begin
                    // Con cá mập đã đi thực sự
                    LTheSharkIsGone := True;
                    // Ẩn đi đễ tiết kiệm bộ nhớ + thao tác vẽ
                    TheShark.Visible := False;
                    // Lưu vào thống kê
                    Inc(FGameData.Shark);
                  end;
                end
                else
                  TheShark.Position.X := LPosition;
              end;
            end;
            // Cập nhật lại GameForm
            Canvas.EndScene;

            // Xử lý cá mập ăn
            if (LPhase > 1) and (GameForm.FGameState = TGameState.Running) then
            begin
              if IsOverlap(TheShark) and (Shield = 0) then
              begin
                StopGameDelay;
              end;
            end;
          end;
        end;
      end
    );

    if (GameForm.FGameState = TGameState.Stopped) and LPhaseChanged then
    begin
      // Xóa toàn bộ dữ liệu
      LTheSharkIsBeingGone := False;
      LTheSharkIsGone := False;
      LPhase := 0;
      // Chờ một lúc rồi chạy phiên tiếp theo
      repeat
        CustomSleep(30 + Random(15));
      until ((TGameForm.GameState = TGameState.Running) and (GameForm.Level >= 3)) or Terminated;
    end
    else if not LTheSharkIsGone then
    begin
      // Nếu có sự đổi pha
      if LPhaseChanged then
      begin
        // Xác suất con cá mập cắn tiếp là 50%
        if ((LPhase < 3) or (Random(100) mod 2 = 0)) and (LPhase - 2 <= GameForm.Level) and (GameForm.FGameState = TGameState.Running) then
        begin
          // Ngưng 3s trước khi xuất hiện lần tiếp theo
          CustomSleep(2);
          // Báo động cho người chơi biết
          ShowAlertSign;
          // Phát âm thanh
          GameForm.PlaySound(TGameSound.Shark);
          // Ngưng một chút để người chơi chuẩn bị
          CustomSleep(1);
          // Lưu lại thời gian mới
          FTickCount := GetTickCount;
          // Tăng tốc độ di chuyển
          LStep := 5;
          // Tính toán tọa độ của con cá mập sao cho nó nằm thẳng hàng với con cá chính
          TThread.Synchronize(nil,
            procedure
            begin
              with GameForm do
              begin
                TheShark.Parent := Layout;
                TheShark.Position.Y :=  TheFish.Position.Y + TheFish.Height / 2 - TheShark.Height / 2;
              end;
            end
          );
        end
        else
        begin
          // Con cá mập bắt đầu đi
          LTheSharkIsBeingGone := True;
          LPhase := -1;
          LStep := 3;
          // Trường hợp con cá bị cá mập cắn thì không cần phải Sleep (Lúc này GameState = Stopped)
          if TGameForm.GameState = TGameState.Running then
            Sleep(500);
        end;
      end
      else
        Sleep(1);
    end
    else
    begin
      // Xóa toàn bộ dữ liệu
      LTheSharkIsBeingGone := False;
      LTheSharkIsGone := False;
      LPhase := 0;
      // Chờ một lúc rồi chạy phiên tiếp theo
      repeat
        CustomSleep(30 + Random(15));
      until ((GameForm.GameState = TGameState.Running) and (GameForm.Level >= 3)) or Terminated;
    end;
  end;
end;

{ TCollisionProcessThread }

procedure TCollisionProcessThread.Execute;
begin
  while not Terminated do
  begin

  end;
end;

{ TShipThread }

procedure TShipThread.Execute;
const
  SHIP_FISHING_SHIP = 0;
  SHIP_BATTLE_SHIP = 1;
var
  LKind: Cardinal;
  LShipChanged: Boolean;
begin
  // Tạm dừng một thời gian trước khi bắt đầu
  repeat
    CustomSleep(15 + Random(5));
  until ((GameForm.GameState = TGameState.Running) and (GameForm.Level >= 2)) or Terminated;
  // Khởi tạo các giá trị ban đầu
  LKind := SHIP_FISHING_SHIP;
  FTickCount := GetTickCount;
  LShipChanged := False;
  // Báo động cho người chơi biết
  ShowAlertSign;
  // Lặp
  while not Terminated do
  begin
    if LKind = SHIP_FISHING_SHIP then
    begin
      {$REGION 'FISHING SHIP'}
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        var
          LPosition: Single;
          LNow, LDelta: Cardinal;
        begin
          LNow := GetTickCount;
          LDelta := LNow - FTickCount;
          FTickCount := LNow;
          //////////////////////////////////////////
          with GameForm do
          begin
            LPosition := TheFishingShip.Position.X - LDelta * FStep1;
            if LPosition < - 200 then
            begin
              LShipChanged := True;
              TheFishingShip.Position.X := GAME_FORM_WIDTH + 20 + TheFish.Width;
              // Chuyển qua loại thuyền khác
              if GameForm.Level >= 3 then
                LKind := SHIP_BATTLE_SHIP;
              // Lưu vào thống kê
              Inc(FGameData.FishingShip);
            end
            else
            begin
              TheFishingShip.Position.X := LPosition;
              if SameValue(LPosition, GAME_FORM_WIDTH * 2/3, 5) then
                ThrowFishingLure;
            end;
          end;
        end
      );
      {$ENDREGION}
    end
    else
    begin
      {$REGION 'BATTLE SHIP'}
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        var
          LPosition: Single;
          LNow, LDelta: Cardinal;
        begin
          LNow := GetTickCount;
          LDelta := LNow - FTickCount;
          FTickCount := LNow;
          //////////////////////////////////////////
          with GameForm do
          begin
            LPosition := TheBattleShip.Position.X + LDelta * FStep1;
            if LPosition > GAME_FORM_WIDTH then
            begin
              LShipChanged := True;
              TheBattleShip.Position.X := -500;
              // Chuyển qua loại thuyền khác
              LKind := SHIP_FISHING_SHIP;
              // Lưu vào thống kê
              Inc(FGameData.NavyShip);
            end
            else
            begin
              TheBattleShip.Position.X := LPosition;
              if SameValue(LPosition, 100, 5) then
                DropBomb;
            end;
          end;
        end
      );

      {$ENDREGION}
    end;

    if not LShipChanged then
      repeat
        Sleep(1)
      until (GameForm.GameState <> TGameState.Paused)
    else
    begin
      // Chờ một lúc rồi chạy phiên tiếp theo
      repeat
        CustomSleep(30 + Random(15));
      until ((GameForm.GameState = TGameState.Running) and (GameForm.Level >= 2)) or Terminated;
      // Xóa cờ
      LShipChanged := False;
      // Thời gian mới
      FTickCount := TThread.GetTickCount;
      // Báo động cho người chơi biết
      ShowAlertSign;
    end;
  end;
end;

{ TJellyFishAnimationThread }

procedure TJellyFishAnimationThread.Execute;
begin
  while not Terminated do
  begin
    if TGameForm.GameState <> TGameState.Paused then
    begin
      // Gán hình mới cho các con sứa
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        var
          LFish: TRectangle;
        begin
          with GameForm do
          begin
            Canvas.BeginScene;

            for LFish in FJellyFishes do
            begin
              LFish.NextImage;
            end;

            Canvas.EndScene;
          end
        end
      );
    end;

    Sleep(750);
  end;
end;

{ TGameUIThread }

procedure TGameUIThread.SetActiveValue(const AValue: Boolean);
begin
  if AValue then
    ResumeGame
  else
    PauseGame;
end;

procedure TGameUIThread.ShowAlertSign;
begin
  TThread.Synchronize(nil,
    procedure
    begin
      GameForm.ShowAlertSign;
    end
  );
end;

procedure TGameUIThread.CustomSleep(const ASecond: Integer);
var
  LMiliSecond: Integer;
begin
  LMiliSecond := ASecond * 1000;
  while (TThread.GetTickCount - FTickcount < LMiliSecond) and not Terminated do
    Sleep(10);
end;

constructor TGameUIThread.CreateGameThread;
begin
  inherited Create(False);
end;

class function TGameUIThread.GetTickCountInMicroSecond: Cardinal;
begin
  Result := 0;
end;

procedure TGameUIThread.PauseGame;
begin
  Suspended := True;
end;

procedure TGameUIThread.Release;
begin
  DisposeOf;
end;

procedure TGameUIThread.ResumeGame;
begin
  FTickcount := GetTickCount;
  Suspended := False;
end;

{ TEatingEffectRectangle }

procedure TEatingEffectRectangle.NextImage;
begin
  if ImageIndex + 1 = ImageCount then
  begin
    // Refactor cái này
    GameForm.FEatingEffectList.Remove(Self);
    GameForm.FCachedEatingEffectList.Add(Self);
    Visible := False;
  end
  else
    inherited;
end;

initialization

  Randomize;

end.
