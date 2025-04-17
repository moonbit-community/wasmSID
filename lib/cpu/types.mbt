///|
let s = "0123456789ABCDEF"

//
// UInt8
//

///|
pub(all) type UInt8 Int derive(Show, Eq, Compare, Default)

///|
trait U8 {
  u8(Self) -> UInt8
}

///|
fn u8(self : UInt16) -> UInt8 {
  self._ & 0xFF
}

///|
impl Add for UInt8 with op_add(self : UInt8, other : UInt8) -> UInt8 {
  self._ + other._ // FIXME: Overflow
}

///|
impl Sub for UInt8 with op_sub(self : UInt8, other : UInt8) -> UInt8 {
  self._ - other._ // FIXME: Underflow
}

///|
impl Mul for UInt8 with op_mul(self : UInt8, other : UInt8) -> UInt8 {
  self._ * other._ // FIXME: Overflow
}

///|
impl Div for UInt8 with op_div(self : UInt8, other : UInt8) -> UInt8 {
  self._ / other._ // FIXME: Underflow
}

///|
impl Mod for UInt8 with op_mod(self : UInt8, other : UInt8) -> UInt8 {
  self._ % other._
}

///|
impl Shl for UInt8 with op_shl(self : UInt8, bit : Int) -> UInt8 {
  self._ << bit
}

///|
impl Shr for UInt8 with op_shr(self : UInt8, bit : Int) -> UInt8 {
  self._ >> bit
}

///|
fn flip(self : UInt8, other : UInt8) -> UInt8 {
  self._ & (-other._ - 1)
}

// bitwise and
///|
impl BitAnd for UInt8 with land(self : UInt8, other : UInt8) -> UInt8 {
  self._ & other._
}

// bitwise or
///|
impl BitOr for UInt8 with lor(self : UInt8, bit : UInt8) -> UInt8 {
  self._ | bit._
}

// bitwise xor
///|
impl BitXOr for UInt8 with lxor(self : UInt8, bit : UInt8) -> UInt8 {
  self._ ^ bit._
}

///|
pub fn bit(self : UInt8, bit : UInt8) -> Bool {
  // disabled for overflow check
  // if bit >= 8 {
  //   println("UInt8::bit out of bounds")
  //   abort("out of bounds")
  // }
  ((self >> bit._) & 1) == 1
}

///|
fn bitn(self : UInt8, bit : UInt8) -> UInt8 {
  (self >> bit._) & 1
}

///|
fn clr(self : UInt8, mask : UInt8) -> UInt8 {
  self._ & (-mask._ - 1)
}

///|
fn set(self : UInt8, mask : UInt8) -> UInt8 {
  self._ | mask._
}

///|
fn has(self : UInt8, mask : UInt8) -> Bool {
  (self._ & mask._) != 0
}

///|
fn overflow(self : UInt8) -> Bool {
  self.bit(8)
}

///|
fn borrow(self : UInt8) -> Bool {
  self._.is_neg()
}

// fn to_byte(
//   b0 : Bool,
//   b1 : Bool,
//   b2 : Bool,
//   b3 : Bool,
//   b4 : Bool,
//   b5 : Bool,
//   b6 : Bool,
//   b7 : Bool
// ) -> UInt8 {
//   (b0 |> to_u8) | (b1 |> to_u8)<<(1)._ | (b2 |> to_u8)<<(2)._ | (b3 |> to_u8)<<(
//     3,
//   )._ | (b4 |> to_u8)<<(4)._ | (b5 |> to_u8)<<(5)._ | (b6 |> to_u8)<<(6)._ |
//   (b7 |> to_u8)<<(7)._
// }

///|
fn to_signed(self : UInt8) -> Int {
  self._ - ((self & 0x80) << 1)._
}

///|
pub fn to_hex(self : UInt8) -> String {
  s[((self >> 4) & 0x0F)._].to_string() + s[(self & 0x0F)._].to_string()
  // hex(self >> 4) + hex(self)
}

///|
fn to_byte(self : UInt8) -> Byte {
  self._.to_byte()
}

///|
fn to_int(self : UInt8) -> Int {
  self._
}

//
// UInt16
//

///|
pub(all) type UInt16 Int derive(Show, Eq, Compare, Default)

///|
trait U16 {
  u16(Self) -> UInt16
}

///|
fn u16(self : UInt8) -> UInt16 {
  self._ & 0xFFFF
}

///|
impl Add for UInt16 with op_add(self : UInt16, other : UInt16) -> UInt16 {
  self._ + other._ |> u16 // handle overflow
}

///|
impl Sub for UInt16 with op_sub(self : UInt16, other : UInt16) -> UInt16 {
  self._ - other._ |> u16 // handle underflow
}

///|
impl Mul for UInt16 with op_mul(self : UInt16, other : UInt16) -> UInt16 {
  self._ * other._ |> u16 // handle overflow
}

///|
impl Div for UInt16 with op_div(self : UInt16, other : UInt16) -> UInt16 {
  self._ / other._ |> u16 // handle underflow
}

///|
impl Shl for UInt16 with op_shl(self : UInt16, bit : Int) -> UInt16 {
  self._ << bit |> u16
}

///|
impl Shr for UInt16 with op_shr(self : UInt16, bit : Int) -> UInt16 {
  self._ >> bit |> u16
}

// bitwise and
///|
impl BitAnd for UInt16 with land(self : UInt16, other : UInt16) -> UInt16 {
  self._ & other._
}

// bitwise or
///|
impl BitOr for UInt16 with lor(self : UInt16, bit : UInt16) -> UInt16 {
  self._ | bit._
}

// bitwise xor
///|
impl BitXOr for UInt16 with lxor(self : UInt16, bit : UInt16) -> UInt16 {
  self._ ^ bit._
}

///|
fn UInt16::has(self : UInt16, bit : UInt16) -> Bool {
  (self._ & bit._) != 0
}

///|
pub fn UInt16::to_hex(self : UInt16) -> String {
  // println(
  //   "U16::to_hex \(self) $" + s[((self >> 12) & 0x0F)._].to_string() + s[((self >>
  //   8) & 0x0F)._].to_string() + s[((self >> 4) & 0x0F)._].to_string() + s[(self &
  //   0x0F)._].to_string(),
  // )
  // u8(self >> 8).to_hex() + u8(self & 0xFF).to_hex()
  s[((self >> 12) & 0x0F)._].to_string() +
  s[((self >> 8) & 0x0F)._].to_string() +
  s[((self >> 4) & 0x0F)._].to_string() +
  s[(self & 0x0F)._].to_string()
}

///|
fn UInt16::to_byte(self : UInt16) -> Byte {
  self._.to_byte()
}

///|
fn UInt16::to_int(self : UInt16) -> Int {
  self._
}
