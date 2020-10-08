// Fonts: https://github.com/olikraus/u8g2/wiki/fntlistall#9-pixel-height

#include <Arduino.h>
#include <U8g2lib.h>

#ifdef U8X8_HAVE_HW_SPI
#include <SPI.h>
#endif

#ifdef U8X8_HAVE_HW_I2C
#include <Wire.h>
#endif

U8G2_ST7920_128X64_1_SW_SPI u8g2(U8G2_R0, 13, 11, 10, 8);

void setup(void) {
  u8g2.begin();
}

void u8g2_prepare(void) {
  u8g2.setFont(u8g2_font_courR08_tf);
  u8g2.setFontRefHeightExtendedText();
  u8g2.setDrawColor(1);
  u8g2.setFontPosTop();
  u8g2.setFontDirection(0);
}

void draw() {
  u8g2_prepare();


  u8g2.drawStr(2, 13, "Todo comienza con");

  u8g2.setCursor(2, 28);
  u8g2.print(F("un punto que"));

  u8g2.setCursor(2, 42);
  u8g2.print(F("se detiene a pensar"));


  /*
    u8g2.drawStr( 0, 0, "drawDisc");
    u8g2.drawDisc(10,18,9);
    u8g2.drawDisc(24,16,7);
    u8g2.drawStr( 0, 30, "drawCircle");
    u8g2.drawCircle(10,18+30,9);
    u8g2.drawCircle(24,16+30,7);
  */

  u8g2.drawStr( 0, 0, "drawBox");
  u8g2.drawBox(5, 10, 20, 10);
  u8g2.drawBox(10, 15, 30, 7);
  u8g2.drawStr( 0, 30, "drawFrame");
  u8g2.drawFrame(5, 10 + 30, 20, 10);
  u8g2.drawFrame(10, 15 + 30, 30, 7);

  u8g2.setFont(u8g2_font_unifont_t_symbols); // 16x16
  u8g2.drawGlyph(5, 48, 0x2591);  /* dec 9731/hex 2603 Snowman */

  /* write background pattern, then: */
  u8g2.setFontMode(0);
  u8g2.setDrawColor(1);
  u8g2.drawStr(3, 15, "Color=1, Mode 0");
  u8g2.setDrawColor(0);
  u8g2.drawStr(3, 30, "Color=0, Mode 0");
  u8g2.setFontMode(1);
  u8g2.setDrawColor(1);
  u8g2.drawStr(3, 45, "Color=1, Mode 1");
  u8g2.setDrawColor(0);
  u8g2.drawStr(3, 60, "Color=0, Mode 1");


  u8g2.setDrawColor(1); /* color 1 for the box */
  u8g2.drawBox(22, 2, 35, 50);

}

void loop(void) {
  // likes: u8g2_font_6x13_te, u8g2_font_CursivePixel_tr, u8g2_font_timR10_tf
  u8g2.firstPage();
  do {
    draw();
  } while ( u8g2.nextPage() );
  delay(1000);
  u8g2.clear();
  delay(1000);
}

