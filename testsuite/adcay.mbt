///|
pub let adcay : FixedArray[Int] = [
  0x01, 0x08, // LoadAddress
   0x4C, 0x16, 0x08, 0x00, 0x97, 0x32, 0x2C, 0x30, 0x3A, 0x9E, 0x32, 0x30, 0x37,
  0x30, 0x00, 0x00, 0x00, 0xA9, 0x01, 0x85, 0x02, 0x20, 0x38, 0x0B, 0x0D, 0x91, 0x41,
  0x44, 0x43, 0x41, 0x59, 0x00, 0xA9, 0x1B, 0x8D, 0xE1, 0x09, 0xA9, 0xC6, 0x8D, 0xE2,
  0x09, 0xA9, 0xB1, 0x8D, 0xE3, 0x09, 0xA9, 0x6C, 0x8D, 0xE4, 0x09, 0xA9, 0x00, 0x8D,
  0xE5, 0x09, 0xBA, 0x8E, 0xE6, 0x09, 0xA9, 0x00, 0x8D, 0xE1, 0x09, 0x8D, 0xE2, 0x09,
  0x8D, 0xE4, 0x09, 0xAD, 0xE5, 0x09, 0x29, 0x08, 0xD0, 0x64, 0xAD, 0xE1, 0x09, 0x8D,
  0xE7, 0x09, 0x8D, 0xED, 0x09, 0x8D, 0x6F, 0x08, 0x29, 0x7F, 0x8D, 0x86, 0x08, 0x18,
  0xAD, 0xE5, 0x09, 0x29, 0x01, 0xF0, 0x01, 0x38, 0x08, 0xAD, 0xE2, 0x09, 0x69, 0x00,
  0x8D, 0xEE, 0x09, 0xAD, 0xE5, 0x09, 0x09, 0x30, 0x29, 0x3C, 0x90, 0x02, 0x09, 0x01,
  0xAA, 0xAD, 0xE2, 0x09, 0x29, 0x7F, 0x28, 0x69, 0x00, 0x30, 0x0C, 0x8A, 0x29, 0x01,
  0xF0, 0x0C, 0x8A, 0x09, 0x40, 0xAA, 0x4C, 0x9A, 0x08, 0x8A, 0x29, 0x01, 0xF0, 0xF4,
  0xAD, 0xEE, 0x09, 0xC9, 0x00, 0xD0, 0x04, 0x8A, 0x09, 0x02, 0xAA, 0xAD, 0xEE, 0x09,
  0x10, 0x04, 0x8A, 0x09, 0x80, 0xAA, 0x8E, 0xF1, 0x09, 0x4C, 0x33, 0x09, 0xAD, 0xE1,
  0x09, 0x8D, 0xE7, 0x09, 0x8D, 0xED, 0x09, 0x29, 0x0F, 0x8D, 0xD4, 0x08, 0xAD, 0xE5,
  0x09, 0x09, 0x30, 0x29, 0x3C, 0xAA, 0xAD, 0xE5, 0x09, 0x4A, 0xAD, 0xE2, 0x09, 0x29,
  0x0F, 0x69, 0x00, 0xA0, 0x00, 0xC9, 0x0A, 0x90, 0x07, 0x38, 0xE9, 0x0A, 0x29, 0x0F,
  0xA0, 0x08, 0x8D, 0xEE, 0x09, 0x8C, 0xFC, 0x08, 0x8C, 0xFF, 0x08, 0xAD, 0xE1, 0x09,
  0x29, 0xF0, 0x0D, 0xFF, 0x08, 0x8D, 0xFF, 0x08, 0xAD, 0xE2, 0x09, 0x29, 0xF0, 0x09,
  0x00, 0x18, 0x69, 0x00, 0x08, 0xB0, 0x04, 0xC9, 0xA0, 0x90, 0x04, 0x38, 0xE9, 0xA0,
  0xE8, 0x0D, 0xEE, 0x09, 0x8D, 0xEE, 0x09, 0x28, 0x50, 0x06, 0x08, 0x8A, 0x09, 0x40,
  0xAA, 0x28, 0x10, 0x04, 0x8A, 0x09, 0x80, 0xAA, 0xAD, 0xE5, 0x09, 0x4A, 0xAD, 0xE2,
  0x09, 0x6D, 0xE1, 0x09, 0xD0, 0x04, 0x8A, 0x09, 0x02, 0xAA, 0x8E, 0xF1, 0x09, 0xAD,
  0xE3, 0x09, 0x8D, 0xEF, 0x09, 0xAD, 0xE4, 0x09, 0x8D, 0xF0, 0x09, 0xAD, 0xE6, 0x09,
  0x8D, 0xF2, 0x09, 0xAE, 0xE6, 0x09, 0x9A, 0xAD, 0xE5, 0x09, 0x48, 0xAD, 0xE2, 0x09,
  0xAE, 0xE3, 0x09, 0xAC, 0xE4, 0x09, 0x28, 0x79, 0xE7, 0x09, 0x08, 0xD8, 0x8D, 0xE8,
  0x09, 0x8E, 0xE9, 0x09, 0x8C, 0xEA, 0x09, 0x68, 0x8D, 0xEB, 0x09, 0xBA, 0x8E, 0xEC,
  0x09, 0x20, 0xF3, 0x09, 0xEE, 0x58, 0x09, 0xD0, 0x03, 0xEE, 0x59, 0x09, 0xAD, 0xE4,
  0x09, 0xD0, 0x03, 0xCE, 0x59, 0x09, 0xCE, 0xE4, 0x09, 0x18, 0xAD, 0xE1, 0x09, 0x69,
  0x11, 0x8D, 0xE1, 0x09, 0x90, 0x1A, 0xA9, 0x00, 0x8D, 0xE1, 0x09, 0x18, 0xAD, 0xE2,
  0x09, 0x69, 0x11, 0x8D, 0xE2, 0x09, 0x90, 0x0A, 0xA9, 0x00, 0x8D, 0xE2, 0x09, 0xEE,
  0xE5, 0x09, 0xF0, 0x03, 0x4C, 0x49, 0x08, 0x20, 0x38, 0x0B, 0x20, 0x2D, 0x20, 0x4F,
  0x4B, 0x0D, 0x00, 0xA5, 0x02, 0xF0, 0x08, 0x20, 0xE4, 0xFF, 0xF0, 0xFB, 0x4C, 0x00,
  0x80, 0x20, 0x38, 0x0B, 0x41, 0x44, 0x43, 0x49, 0x58, 0x00, 0xA9, 0x00, 0x85, 0x0A,
  0x85, 0xB9, 0xA9, 0x05, 0x85, 0xB7, 0xA9, 0xC4, 0x85, 0xBB, 0xA9, 0x09, 0x85, 0xBC,
  0x68, 0x68, 0x4C, 0x6F, 0xE1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAD, 0xE7, 0x09, 0xCD, 0xED,
  0x09, 0xD0, 0x29, 0xAD, 0xE8, 0x09, 0xCD, 0xEE, 0x09, 0xD0, 0x21, 0xAD, 0xE9, 0x09,
  0xCD, 0xEF, 0x09, 0xD0, 0x19, 0xAD, 0xEA, 0x09, 0xCD, 0xF0, 0x09, 0xD0, 0x11, 0xAD,
  0xEB, 0x09, 0xCD, 0xF1, 0x09, 0xD0, 0x09, 0xAD, 0xEC, 0x09, 0xCD, 0xF2, 0x09, 0xD0,
  0x01, 0x60, 0x20, 0x38, 0x0B, 0x0D, 0x42, 0x45, 0x46, 0x4F, 0x52, 0x45, 0x20, 0x20,
  0x00, 0xA2, 0xE1, 0xA0, 0x09, 0x20, 0x79, 0x0A, 0x20, 0x38, 0x0B, 0x0D, 0x41, 0x46,
  0x54, 0x45, 0x52, 0x20, 0x20, 0x20, 0x00, 0xA2, 0xE7, 0xA0, 0x09, 0x20, 0x79, 0x0A,
  0x20, 0x38, 0x0B, 0x0D, 0x52, 0x49, 0x47, 0x48, 0x54, 0x20, 0x20, 0x20, 0x00, 0xA2,
  0xED, 0xA0, 0x09, 0x20, 0x79, 0x0A, 0xA9, 0x0D, 0x20, 0xD2, 0xFF, 0x20, 0xE4, 0xFF,
  0xF0, 0xFB, 0xC9, 0x03, 0xF0, 0x01, 0x60, 0xA5, 0x02, 0xF0, 0x03, 0x4C, 0x00, 0x80,
  0x6C, 0x02, 0xA0, 0x86, 0xAC, 0x84, 0xAD, 0xA0, 0x00, 0xB1, 0xAC, 0x20, 0x22, 0x0B,
  0xA9, 0x20, 0x20, 0xD2, 0xFF, 0xA9, 0x20, 0x20, 0xD2, 0xFF, 0xC8, 0xB1, 0xAC, 0x20,
  0x22, 0x0B, 0xA9, 0x20, 0x20, 0xD2, 0xFF, 0xC8, 0xB1, 0xAC, 0x20, 0x22, 0x0B, 0xA9,
  0x20, 0x20, 0xD2, 0xFF, 0xC8, 0xB1, 0xAC, 0x20, 0x22, 0x0B, 0xA9, 0x20, 0x20, 0xD2,
  0xFF, 0xC8, 0xB1, 0xAC, 0xA2, 0x4E, 0x0A, 0x90, 0x02, 0xA2, 0xCE, 0x48, 0x8A, 0x20,
  0xD2, 0xFF, 0x68, 0xA2, 0x56, 0x0A, 0x90, 0x02, 0xA2, 0xD6, 0x48, 0x8A, 0x20, 0xD2,
  0xFF, 0x68, 0xA2, 0x30, 0x0A, 0x90, 0x02, 0xA2, 0x31, 0x48, 0x8A, 0x20, 0xD2, 0xFF,
  0x68, 0xA2, 0x42, 0x0A, 0x90, 0x02, 0xA2, 0xC2, 0x48, 0x8A, 0x20, 0xD2, 0xFF, 0x68,
  0xA2, 0x44, 0x0A, 0x90, 0x02, 0xA2, 0xC4, 0x48, 0x8A, 0x20, 0xD2, 0xFF, 0x68, 0xA2,
  0x49, 0x0A, 0x90, 0x02, 0xA2, 0xC9, 0x48, 0x8A, 0x20, 0xD2, 0xFF, 0x68, 0xA2, 0x5A,
  0x0A, 0x90, 0x02, 0xA2, 0xDA, 0x48, 0x8A, 0x20, 0xD2, 0xFF, 0x68, 0xA2, 0x43, 0x0A,
  0x90, 0x02, 0xA2, 0xC3, 0x48, 0x8A, 0x20, 0xD2, 0xFF, 0x68, 0xA9, 0x20, 0x20, 0xD2,
  0xFF, 0xC8, 0xB1, 0xAC, 0x48, 0x4A, 0x4A, 0x4A, 0x4A, 0x20, 0x2D, 0x0B, 0x68, 0x29,
  0x0F, 0x09, 0x30, 0xC9, 0x3A, 0x90, 0x02, 0x69, 0x06, 0x4C, 0xD2, 0xFF, 0x68, 0x8D,
  0x43, 0x0B, 0x68, 0x8D, 0x44, 0x0B, 0xA2, 0x01, 0xBD, 0x42, 0x0B, 0xF0, 0x06, 0x20,
  0xD2, 0xFF, 0xE8, 0xD0, 0xF5, 0x38, 0x8A, 0x6D, 0x43, 0x0B, 0x8D, 0x5E, 0x0B, 0xA9,
  0x00, 0x6D, 0x44, 0x0B, 0x8D, 0x5F, 0x0B, 0x4C, 0x5D, 0x0B,
]
