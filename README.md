## 프로그램 개요

- [회로도](https://www.circuitstate.com/wp-content/uploads/2023/10/STM8S-Blue-STM8S103F3P6-Generic-Development-Board-Schematic-Diagram-R0.1-CIRCUITSTATE-Electronics-1_1.png)
- [결선도](https://yooaroma.com/mm/image/stm8/stm8blue/stm8blue_blink_key_text.jpg)
- [동영상](https://youtu.be/1DKdeK5Q6ho)
- [프로그램 소스](https://github.com/yooaroma/stm8blue_blink_key)

## ST 마이컴 개발시 설치 TOOLS

- vscode download : <https://code.visualstudio.com/download>
- 칩(chip) 프로그래머 : ST Visual Programmer : <https://www.st.com/en/development-tools/stvp-stm8.html>
- GNU/LINUX에서 STM8 개발 도구 시작하기 : <https://www.codementor.io/@hbendali/getting-started-with-stm8-development-tools-on-gnu-linux-zu59yo35x>
- stm8flash : <https://github.com/vdudouyt/stm8flash>
- STM8S105K4T6 - stm8flash 에 대한 설명 : <https://blog.naver.com/chcbaram/222688164090>
- 최종 stm8flash : <https://github.com/chcbaram/stm8flash_win>
- st 컴파일러 : sdcc download : <https://sourceforge.net/projects/sdcc/files/snapshot_builds/x86_64-w64-mingw32/>
  - snapshot 의 빌더 버젼(\*.zip)을 다운로드 받아서 unzip하고 나서 c:/tools 아래에 카피한다. 그리고 시스템 환경변수 path 에 위 c:\tools\sdcc\bin 폴더를 추가한다.
- make : download : <https://github.com/xpack-dev-tools/windows-build-tools-xpack/releases>
  - 최신 버젼을 (\*.zip) 화일을 unzip 하여 c:/tools/make 아래에 카피한다. 그리고 시스템 환경변수 path 에 위 c:\tools\make\bin 폴더를 추가한다.
- gcc 컴파일러 설치 : <https://www.mingw-w64.org/>
  - 다운로드로 가서 : <https://www.mingw-w64.org/downloads/> -> <https://github.com/niXman/mingw-builds-binaries/releases> 즉 Mingw-builds installation: GitHub 를 선택해서
    <x86_64-14.2.0-release-win32-seh-msvcrt-rt_v12-rev0.7z> path는 c:\tools\mingw64 에 설치하고 사용하기를 권장...
  - path c:\tools\mingw64\bin 를 추가하면 실행이 가능합니다.
- vscode extention program : Serial Monitor

---

- Micro USB STM8S103F3P6 초소형 개발보드 <br>

  - [Micro USB STM8S103F3P6 초소형 개발보드](https://www.devicemart.co.kr/goods/view?no=1361337) <br>
    ![Micro USB STM8S103F3P6 초소형 개발보드](https://yooaroma.com/mm/image/stm8/stm8blue/STM8S103F3P6_BOARD.png) <br>
  - [**circuitstate.com** 보드 설명 사이트](https://www.circuitstate.com/pinouts/stm8s-blue-generic-stm8s103f3p6-development-board-pinout-diagram-and-pin-reference/#Schematic) <br>
  - [보드 pinout 및 reference](https://www.circuitstate.com/wp-content/uploads/2023/10/STM8S-Blue-STM8S103F3P6-Microcontroller-Development-Board-Pinout-Diagram-and-Pin-Reference-Featured-Image-CIRCUITSTATE-Electronics-2.jpg) <br>
    ![보드 pinout 및 reference](https://yooaroma.com/mm/image/stm8/stm8blue/STM8S-Blue-STM8S103F3P6-Microcontroller-Development-Board-Pinout-Diagram-and-Pin-Reference-Featured-Image-CIRCUITSTATE-Electronics-2.jpg) <br>
  - [보드 사진 앞면과 뒷면](https://www.circuitstate.com/wp-content/uploads/2023/10/STM8S-Blue-STM8S103F3P6-Generic-Microcontroller-Development-Board-Top-and-Bottom-Views-CIRCUITSTATE-Electronics-1.jpg) <br>
    ![보드 사진 앞면과 뒷면](https://yooaroma.com/mm/image/stm8/stm8blue/STM8S-Blue-STM8S103F3P6-Generic-Microcontroller-Development-Board-Top-and-Bottom-Views-CIRCUITSTATE-Electronics-1.jpg) <br>
  - [보드 회로도](https://www.circuitstate.com/wp-content/uploads/2023/10/STM8S-Blue-STM8S103F3P6-Generic-Development-Board-Schematic-Diagram-R0.1-CIRCUITSTATE-Electronics-1_1.png) <br>
    ![보드 회로도](https://yooaroma.com/mm/image/stm8/stm8blue/STM8S-Blue-STM8S103F3P6-Generic-Development-Board-Schematic-Diagram-R0.1-CIRCUITSTATE-Electronics-1_1.png) <br>
  - [보드 pinout](https://www.circuitstate.com/wp-content/uploads/2023/10/STM8S-Blue-Generic-STM8S103F3P6-Microcontroller-Board-Pinout-Diagram-R0.1-CIRCUITSTATE-Electronics-1.png) <br>
    ![보드 pinout](https://yooaroma.com/mm/image/stm8/stm8blue/STM8S-Blue-Generic-STM8S103F3P6-Microcontroller-Board-Pinout-Diagram-R0.1-CIRCUITSTATE-Electronics-1.png) <br>
  - [보드 IC pinout](https://www.circuitstate.com/wp-content/uploads/2023/10/STM8S-Blue-STM8S103F3P6-Generic-Microcontroller-Development-Board-IC-Pinout-CIRCUITSTATE-Electronics-1.png) <br>
    ![보드 IC pinout](https://yooaroma.com/mm/image/stm8/stm8blue/STM8S-Blue-STM8S103F3P6-Generic-Microcontroller-Development-Board-IC-Pinout-CIRCUITSTATE-Electronics-1.png) <br>

---

---

## 기타 자료

- stm8flash : <https://github.com/hbendalibraham/stm8_started>
- 디버거 : <https://marketplace.visualstudio.com/items?itemName=CL.stm8-debug>

---

## 참고자료

- snippets : 사용법 <https://youtu.be/EVxCdenPbFs> 드림코딩 <br>
- devicemart 구매 <br>
- [SMG] Micro USB STM8S103F3P6 초소형 개발보드 [SZH-AT041] <https://www.devicemart.co.kr/goods/view?no=1361337> <br>
- [SMG] STM8S105K4T6 초소형 개발보드 [SZH-DVBP-002] <https://www.devicemart.co.kr/goods/view?no=1326909> <br>
- [SMG] ST-LINK V2 호환 STM8/STM32 프로그래머/에뮬레이터 [SZH-PRBP-004] <https://www.devicemart.co.kr/goods/view?no=1326910> <br>
- [SMG] CH340G USB to TTL 컨버터 모듈 [SZH-EK092] <https://www.devicemart.co.kr/goods/view?no=1321026> <br>
- <https://tenbaht.github.io/sduino/hardware/stm8blue/> <br>
- <https://tenbaht.github.io/sduino/> <br>
- <https://github.com/roybaer/sduino_mb> <br>
- <https://github.com/roybaer/sduino_uno> <br>

---

## 실행 순서

- 하고자 하는 디렉토리로 이동한다.
- make 하면 makefile을 참고하여 실행한다.
- 결과 화일은 obj 와 exe에 생성된다.
- make flash 를 하면 된다.

## 다른 방법

- xx.hex 화일을 다운로드한다.
- ST Visual Programmer 을 통해서 화일을 읽어 들인다.
- File -> Open (xx.hex)
- Configure 선택 (ST-LINK - USB - SWIM - STM8S105x6) OK
- Program -> Current Tab (Ctl-P)
- File -> Exit

---

## GPIO 설명

- PB5 : LED
- PD3 : KEY
- PD5 : UART1_TX
- PD6 : UART1_RX
- PC7 : SPI_MISO
- PC6 : SPI_MOSI
- PC5 : SPI_SCK
- PA3 : SPI_NSS
- PD2 : AIN3
- PB5 : I2C_SDA
- PB4 : I2C_SCL

---
