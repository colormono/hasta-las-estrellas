// Fonts: https://github.com/olikraus/u8g2/wiki

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
  u8g2.setFont(u8g2_font_courR08_tf);
}

void loop(void) {
  // likes: u8g2_font_6x13_te, u8g2_font_CursivePixel_tr, u8g2_font_timR10_tf
  u8g2.firstPage();
  do {
    u8g2.setCursor(2, 13);
    //u8g2.print(F("Todo comienza con"));
    
    u8g2.setCursor(2, 28);
    // u8g2.print(F("un punto que"));
    u8g2.print(F("CARGANDO..."));
    
    u8g2.setCursor(2, 42);
    //u8g2.print(F("se detiene a pensar"));
    
  } while ( u8g2.nextPage() );
  delay(10000);
  u8g2.clear();
  delay(5000);
}

