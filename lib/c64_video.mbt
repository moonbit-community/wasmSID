//0:NTSC, 1:PAL (based on the SID-header field)

///|
enum VideoStandard {
  Unknown
  NTSC
  PAL
  Both
} derive(Show, Eq)

///|
fn VideoStandard::from_int(value : Int) -> VideoStandard raise {
  match value {
    0b00 => Unknown
    0b01 => PAL
    0b10 => NTSC
    0b11 => Both
    _ => raise UnknownVideoStandard
  }
}

///|
fn VideoStandard::to_int(self : VideoStandard) -> Int raise {
  match self {
    NTSC => 0
    PAL => 1
    _ => raise UnknownVideoStandard
  }
}

///|
fn VideoStandard::op_get(
  self : VideoStandard,
  value : VideoStandard,
) -> Int raise {
  value.to_int()
}

///|
struct CPUClock(VideoStandard) derive(Show, Eq)

///|
fn CPUClock::to_int(self : CPUClock) -> Int raise {
  match self.inner() {
    Unknown => 0
    NTSC => 1022727
    PAL => 985248
    _ => raise UnknownCPUClock
  }
}

///|
fn CPUClock::op_get(self : CPUClock, value : VideoStandard) -> Int raise {
  value.to_int()
}

///|
test "CPUClock::None" {
  let value = CPUClock(Unknown)
  assert_eq(value, Unknown)
  inspect(value.to_int(), content="0")
}

///|
test "CPUClock::NTSC" {
  let value = CPUClock(NTSC)
  assert_eq(value, NTSC)
  inspect(value.to_int(), content="1022727")
}

///|
test "CPUClock::PAL" {
  let value = CPUClock(PAL)
  assert_eq(value, PAL)
  inspect(value.to_int(), content="985248")
}

///|
test "error CPUClock::Both" {
  let value = CPUClock(Both)
  assert_eq(value, Both)
  inspect(value.to_int?(), content="Err(unknown CPU clock)")
}

///|
test "CPUClock::NTSC shift left" {
  let value = CPUClock(NTSC)
  assert_eq(value, NTSC)
  inspect(value.to_int?().unwrap() << 4, content="16363632")
}

///|
test "CPUClock::PAL shift left" {
  let value = CPUClock(PAL)
  assert_eq(value, PAL)
  inspect(value.to_int?().unwrap() << 4, content="15763968")
}

///|
priv struct ScanLines(VideoStandard) derive(Show, Eq)

///|
fn ScanLines::to_int(self : ScanLines) -> Int raise {
  match self.inner() {
    NTSC => 262
    PAL => 312
    _ => raise UnknownScanLines
  }
}

///|
fn ScanLines::op_get(self : ScanLines, value : VideoStandard) -> Int raise {
  value.to_int()
}

///|
test "error ScanLines::None" {
  let value = ScanLines(Unknown)
  assert_eq(value, Unknown)
  inspect(value.to_int?(), content="Err(unknown scan lines)")
}

///|
test "ScanLines::NTSC" {
  let value = ScanLines(NTSC)
  assert_eq(value, NTSC)
  inspect(value.to_int(), content="262")
}

///|
test "ScanLines::PAL" {
  let value = ScanLines(PAL)
  assert_eq(value, PAL)
  inspect(value.to_int(), content="312")
}

///|
test "error ScanLines::Both" {
  let value = ScanLines(Both)
  assert_eq(value, Both)
  inspect(value.to_int?(), content="Err(unknown scan lines)")
}

///|
priv struct ScanLineCycles(VideoStandard) derive(Show, Eq)

///|
fn ScanLineCycles::to_int(self : ScanLineCycles) -> Int raise {
  match self.inner() {
    NTSC => 65
    PAL => 63
    _ => raise UnknownScanLineCycles
  }
}

///|
fn ScanLineCycles::op_get(
  self : ScanLineCycles,
  value : VideoStandard,
) -> Int raise {
  value.to_int()
}

///|
test "error ScanLineCycles::None" {
  let value = ScanLineCycles(Unknown)
  assert_eq(value, Unknown)
  inspect(value.to_int?(), content="Err(unknown scan line cycles)")
}

///|
test "ScanLineCycles::NTSC" {
  let value = ScanLineCycles(NTSC)
  assert_eq(value, NTSC)
  inspect(value.to_int(), content="65")
}

///|
test "ScanLineCycles::PAL" {
  let value = ScanLineCycles(PAL)
  assert_eq(value, PAL)
  inspect(value.to_int(), content="63")
}

///|
test "error ScanLineCycles::Both" {
  let value = ScanLineCycles(Both)
  assert_eq(value, Both)
  inspect(value.to_int?(), content="Err(unknown scan line cycles)")
}

///|
priv struct FrameRate(VideoStandard) derive(Show, Eq)

///|
fn FrameRate::to_int(self : FrameRate) -> Int raise {
  match self.inner() {
    NTSC => 60
    PAL => 50
    _ => raise UnknownFrameRate
  }
}

///|
fn FrameRate::op_get(self : FrameRate, value : VideoStandard) -> Int raise {
  value.to_int()
}

///|
test "error FrameRate::None" {
  let value = FrameRate(Unknown)
  assert_eq(value, Unknown)
  inspect(value.to_int?(), content="Err(unknown frame rate)")
}

///|
test "FrameRate::NTSC" {
  let value = FrameRate(NTSC)
  assert_eq(value, NTSC)
  inspect(value.to_int(), content="60")
}

///|
test "FrameRate::PAL" {
  let value = FrameRate(PAL)
  assert_eq(value, PAL)
  inspect(value.to_int(), content="50")
}

///|
test "error FrameRate::Both" {
  let value = FrameRate(Both)
  assert_eq(value, Both)
  inspect(value.to_int?(), content="Err(unknown frame rate)")
}
