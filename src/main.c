#include "lcd/lcd.h"
#include "utils.h"
#include "assembly/example.h"

#define DEBOUNCE_DELAY_MS 300


uint8_t current_difficulty = 1;
// bool last_opt = 1;
int remain = 8;

void Inp_init(void)
{
  rcu_periph_clock_enable(RCU_GPIOA);
  rcu_periph_clock_enable(RCU_GPIOC);

  gpio_init(GPIOA, GPIO_MODE_IPD, GPIO_OSPEED_50MHZ,
            GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3);
  gpio_init(GPIOC, GPIO_MODE_IPD, GPIO_OSPEED_50MHZ,
            GPIO_PIN_13 | GPIO_PIN_14 | GPIO_PIN_15);
}

void IO_init(void) {
  Inp_init(); // inport init
  Lcd_Init(); // LCD init
}
void LCD_Show_Difficulty(uint8_t difficulty) {
  
    switch(difficulty) {
        case 1:
            LCD_ShowString(0, 0, (u8*)"easy", 65535);
            LCD_ShowString(0, 17, (u8*)"normal", 33840);
            LCD_ShowString(0, 32, (u8*)"hard", 33840);
            LCD_ShowString(0, 47, (u8*)"practice", 33840);
            break;
        case 2:
            LCD_ShowString(0, 0, (u8*)"easy", 33840);
            LCD_ShowString(0, 17, (u8*)"normal", 65535);
            LCD_ShowString(0, 32, (u8*)"hard", 33840);
            LCD_ShowString(0, 47, (u8*)"practice", 33840);
            break;
        case 3:
            LCD_ShowString(0, 0, (u8*)"easy", 33840);
            LCD_ShowString(0, 17, (u8*)"normal", 33840);
            LCD_ShowString(0, 32, (u8*)"hard", 65535);
            LCD_ShowString(0, 47, (u8*)"practice", 33840);
            break;
        case 4:
            LCD_ShowString(0, 0, (u8*)"easy", 33840);
            LCD_ShowString(0, 17, (u8*)"normal", 33840);
            LCD_ShowString(0, 32, (u8*)"hard", 33840);
            LCD_ShowString(0, 47, (u8*)"practice", 65535);
            break;
    }
}

void Board_self_test(void) {

  

  LCD_ShowString(0, 0, (u8*)"easy", 65535);
  LCD_ShowString(0, 15, (u8*)"normal", 33840);
  LCD_ShowString(0, 30, (u8*)"hard", 33840);
  LCD_ShowString(0, 45, (u8*)"practice",33840);
  while (1) {
  
    // LCD_ShowString(60, 25, (u8*)"TEST", WHITE);
    LCD_Show_Difficulty(current_difficulty);


    if (Get_Button(JOY_LEFT)) {
      if (current_difficulty < 4)
      {
        current_difficulty++;
      }
      else
      {
        current_difficulty = 1;
      }
            LCD_Show_Difficulty(current_difficulty);
          
            delay_1ms(DEBOUNCE_DELAY_MS);
            
                   
    }
    
            
            
    if (Get_Button(JOY_RIGHT)) {
        if (current_difficulty > 1) {
            current_difficulty--;
        } else{
            current_difficulty = 4;
        }
            LCD_Show_Difficulty(current_difficulty);
          
            delay_1ms(DEBOUNCE_DELAY_MS);
                
            
    }
        
    

    // if (Get_Button(BUTTON_1)) {
    //   LCD_ShowString(60, 5, (u8*)"SW2", BLUE);
    // }
    // if (Get_Button(BUTTON_2)) {
    //   LCD_ShowString(60, 45, (u8*)"SW1", BLUE);
    // }
   
    if(Get_Button(JOY_CTR)){
      for (int i = 0; i < 4; i++){
        if(current_difficulty == 1){
          delay_1ms(300);
          LCD_ShowString(0, 0, (u8 *)"easy", 0);
          LCD_ShowString(0, 15, (u8*)"normal", 33840);
          LCD_ShowString(0, 30, (u8*)"hard", 33840);
          LCD_ShowString(0, 45, (u8*)"practice",33840);
          delay_1ms(300);
          LCD_ShowString(0, 0, (u8 *)"easy", 65535);
          LCD_ShowString(0, 15, (u8*)"normal", 33840);
          LCD_ShowString(0, 30, (u8*)"hard", 33840);
          LCD_ShowString(0, 45, (u8*)"practice",33840);
        }else if(current_difficulty == 2){
          delay_1ms(300);
          LCD_ShowString(0, 0, (u8 *)"easy", 33840);
          LCD_ShowString(0, 15, (u8*)"normal", 0);
          LCD_ShowString(0, 30, (u8*)"hard", 33840);
          LCD_ShowString(0, 45, (u8*)"practice",33840);
          delay_1ms(300);
          LCD_ShowString(0, 0, (u8 *)"easy", 33840);
          LCD_ShowString(0, 15, (u8*)"normal", 65535);
          LCD_ShowString(0, 30, (u8*)"hard", 33840);
          LCD_ShowString(0, 45, (u8*)"practice",33840);
        }else if(current_difficulty == 3){
          delay_1ms(300);
          LCD_ShowString(0, 0, (u8 *)"easy", 33840);
          LCD_ShowString(0, 15, (u8*)"normal", 33840);
          LCD_ShowString(0, 30, (u8*)"hard", 0);
          LCD_ShowString(0, 45, (u8*)"practice",33840);
          delay_1ms(300);
          LCD_ShowString(0, 0, (u8 *)"easy", 33840);
          LCD_ShowString(0, 15, (u8*)"normal", 33840);
          LCD_ShowString(0, 30, (u8*)"hard", 65535);
          LCD_ShowString(0, 45, (u8*)"practice",33840);
        }else if(current_difficulty == 4){
          delay_1ms(300);
          LCD_ShowString(0, 0, (u8 *)"easy", 33840);
          LCD_ShowString(0, 15, (u8*)"normal", 33840);
          LCD_ShowString(0, 30, (u8*)"hard", 33840);
          LCD_ShowString(0, 45, (u8*)"practice",0);
          delay_1ms(300);
          LCD_ShowString(0, 0, (u8 *)"easy", 33840);
          LCD_ShowString(0, 15, (u8*)"normal", 33840);
          LCD_ShowString(0, 30, (u8*)"hard", 33840);
          LCD_ShowString(0, 45, (u8*)"practice",65535);

        }
      }
      break;
    }
  
  }

}

void draw_rotated_text(uint16_t x, uint16_t y, const char *text, uint16_t color) {
    uint16_t current_x = x;
    uint16_t current_y = y;

    while (*text != '\0') {
        LCD_ShowChar(current_x, current_y, *text, 0, color);
        text++; // Move to the next character
        current_y += 16; // Move to the next line (assuming each character is 16 pixels in height)
    }
}
int main(void) {
  
  IO_init();
  LCD_Clear(BLACK);

  draw();
  // LCD_ShowPicture(0, 0, 80, 150);

  delay_1ms(2000);
  LCD_Clear(BLACK);
  Board_self_test();
  LCD_Clear(BLACK);
  LCD_DrawRectangle(0, 40, 70, 150, 65535);

  int num = 0;
  int headwall = rand() % 35 + 50;
  float offset = 0;
  float para = 1;
  int hp = 9;
  int score = 0;
  int gap;

  if(num == 0 && (current_difficulty == 1 || current_difficulty == 4)) gap = 50;
  if(num == 0 && current_difficulty == 2) gap = 35;
  if(num == 0 && current_difficulty == 3) gap = 20;


  // Tail buffer to store player's previous positions
  int tail_length = 20;
  int tail_x[20];
  int tail_y[20];
  for (int i = 0; i < tail_length; i++) {
      tail_x[i] = 30;
      tail_y[i] = 95;
  }

  uint64_t start_time, end_time;
  uint64_t elapsed_time_ms = 0;

  while (1)
  {
    start_time = get_timer_value();

    if (Get_Button(JOY_RIGHT) || Get_Button(JOY_CTR) || Get_Button(JOY_LEFT) || Get_Button(JOY_UP) || Get_Button(JOY_DOWN) || Get_Button(BUTTON_1) || Get_Button(BUTTON_2)) {
      offset -= 4;
      remain = 4;
      para = 1;
    }
    

    LCD_DrawPoint(30, 95 + offset, 2016);

    for (int i = 0; i < tail_length - 1; i++) {
        LCD_DrawLine(tail_x[i], tail_y[i], tail_x[i + 1], tail_y[i + 1], 0); // 33840 is the color of the tail
    }

    for (int i = tail_length - 1; i > 0; i--) {
            tail_x[i] = tail_x[i - 1];
            tail_y[i] = tail_y[i - 1];
    }
    tail_x[0] = 30;
    tail_y[0] = 95 + offset;

    // Move tail points left
    for (int i = 0; i < tail_length; i++) {
        tail_x[i]--;
    }

    // Draw the tail
    for (int i = 0; i < tail_length - 1; i++) {
        LCD_DrawLine(tail_x[i], tail_y[i], tail_x[i + 1], tail_y[i + 1], 2016); // 33840 is the color of the tail
    }




    LCD_DrawRectangle(0, 40, 70, 150, 65535);
    LCD_ShowString(0, 0, "hp:", 65535);
    if (hp == 0) hp += 9;
    LCD_ShowNum(30, 0, hp, 1, 65535);
    
    
    LCD_ShowString(0, 20, "score:", 65535);
    if(score < 10){
      LCD_ShowNum(53, 20, score, 1, 65535);
    }
    else if (score < 100){
      LCD_ShowNum(53, 20, score, 2, 65535);
    }
    else{
      LCD_ShowNum(53, 20, score, 3, 65535);
    }

    LCD_DrawLine(70 - num + 1, 40, 70 - num + 1, headwall, 0);
    LCD_DrawLine(70 - num + 1, headwall + gap, 70 - num + 1, 150, 0);
    LCD_DrawLine(70 - num, 40, 70 - num, headwall, 65535);
    LCD_DrawLine(70 - num, headwall + gap, 70 - num, 150, 65535);
    
    if(((70 - num) == 30) && ((95 + offset) < headwall || (95 + offset) > headwall + gap)){
      offset = 0;
      para = 1;
      if(current_difficulty != 4) hp--;
    }
    else if(((70 - num) == 30) && ((95 + offset) > headwall && (95 + offset) < headwall + gap)){
      score++;
    }

    offset = offset + para / 4 - remain;
    para++;
    
    
    num++;
    if(numset(num)){
      num = 0;
      headwall = rand() % 35 + 50;
    }
    delay_1ms(5);
    
    LCD_DrawPoint(30, 95 + offset - (para-1) / 4 + remain , 0);
    
    if(offset > 54 || offset < -54){
      offset = 0;
      para = 1;
      if(current_difficulty != 4) hp--;
    }

    if(remain > 0){
      remain--;
    }

    end_time = get_timer_value();
    elapsed_time_ms = (end_time - start_time) / (SystemCoreClock / 1000);
    delay_1ms(20 - elapsed_time_ms);
  }
}
