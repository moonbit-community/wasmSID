
           *= $0801
           .BYTE $4C,$14,$08,$00,$97
TURBOASS   = 780
           .TEXT "780"
           .BYTE $2C,$30,$3A,$9E,$32,$30
           .BYTE $37,$33,$00,$00,$00
           LDA #1
           STA TURBOASS
           JMP MAIN


PRINT
           .BLOCK
           PLA
           STA PRINT0+1
           PLA
           STA PRINT0+2
           LDX #1
PRINT0
           LDA !*,X
           BEQ PRINT1
           JSR $FFD2
           INX
           BNE PRINT0
PRINT1
           SEC
           TXA
           ADC PRINT0+1
           STA PRINT2+1
           LDA #0
           ADC PRINT0+2
           STA PRINT2+2
PRINT2
           JMP !*
           .BEND


PRINTHB
           .BLOCK
           PHA
           LSR A
           LSR A
           LSR A
           LSR A
           JSR PRINTHN
           PLA
           AND #$0F
PRINTHN
           ORA #$30
           CMP #$3A
           BCC PRINTHN0
           ADC #6
PRINTHN0
           JSR $FFD2
           RTS
           .BEND

STARTTIMER BRK
STOPTIMER  BRK

INTLOW     .BYTE 0
INTHIGH    .BYTE 0
FLAGSBEFORE .BYTE 0
FLAGSAFTER .BYTE 0

SETINT
           .BLOCK
           PHA
           LDA #0
           STA $DC0E  // CIACRA: NONE
           CLC
           PLA
           ADC #3
           STA $DC04  // TIMALO
           LDA #0
           STA $DC05  // TIMAHI
           LDA #<IRQ
           STA $FFFE
           LDA #>IRQ
           STA $FFFF
           LDA #$35
           STA 1      // R6510: BASIC / RAM / I/O / NO_BUTTON / MOTOR_ON
           LDA $D011  // SCROLY: Raster IRQ
           BMI OK
WAIT
           LDA $D012  // RASTER: 30
           CMP #30
           BCS WAIT
OK
           LDA #$19  // CIACRA: START / ONESHOT / FORCELOAD
           STA $DC0E
           RTS
           .BEND
IRQ
           .BLOCK
           PHP       // Push the processor status register's contents onto the the stack. S:= PSR, SP:= SP-1
           BIT $DC0D // Test memory bits. Z flag set according to A AND M; N flag: = M7; V flag: = M6
           STA SAVEDA+1
           STX SAVEDX+1
           PLA
           STA FLAGSAFTER
           LDA #<IRQ2
           STA $FFFE
           LDA #>IRQ2
           STA $FFFF
           TSX
           INX
           LDA $0100,X
           STA FLAGSBEFORE
           INX
           LDA $0100,X
           STA INTLOW
           INX
           LDA $0100,X
           STA INTHIGH
SAVEDX
           LDX #$11
SAVEDA
           LDA #$11
           RTI
           .BEND

IRQ2
           .BLOCK
           PHP
           BIT $DC0D  // CIAICR
           STA SAVEDA+1
           STX SAVEDX+1
           PLA
           STA FLAGSAFTER2
           TSX
           INX
           LDA $0100,X
           STA FLAGSBEFORE2
           INX
           LDA $0100,X
           STA INTLOW2
           INX
           LDA $0100,X
           STA INTHIGH2
SAVEDX
           LDX #$11
SAVEDA
           LDA #$11
           RTI
           .BEND

FLAGSBEFORE2 .BYTE 0
FLAGSAFTER2 .BYTE 0
INTLOW2    .BYTE 0
INTHIGH2   .BYTE 0


RESTOREINT
           LDA #$37
           STA 1      // R6510: BASIC / KERNAL / IO / NO_BUTTON / MOTOR_ON
           LDA #<16419 // 17045
           STA $DC04
           LDA #>16419
           STA $DC05
           LDA #$11
           STA $DC0E  // CIACRA: START / FORCELOAD
           RTS


GSAVESP    .BYTE 0
GASTACK    *= *+256

SAVESTACK
           .BLOCK
           TSX
           STX GSAVESP
           LDX #0
SAVE
           LDA $0100,X
           STA GASTACK,X
           INX
           BNE SAVE
           RTS
           .BEND

RESTORESTACK
           .BLOCK
           PLA
           STA RETURN2+1
           PLA
           STA RETURN1+1
           LDX GSAVESP
           INX
           INX
           TXS
           LDX #0
RESTORE
           LDA GASTACK,X
           STA $0100,X
           INX
           BNE RESTORE
RETURN1
           LDA #$11
           PHA
RETURN2
           LDA #$11
           PHA
           RTS
           .BEND

ADDRESSING
           .WORD BRKN
           .WORD RIX
           .WORD HLTN
           .WORD MIX
           .WORD RZ
           .WORD RZ
           .WORD MZ
           .WORD MZ
           .WORD PHPN
           .WORD B
           .WORD N
           .WORD B
           .WORD RA
           .WORD RA
           .WORD MA
           .WORD MA
           .WORD R
           .WORD RIY
           .WORD HLTN
           .WORD MIY
           .WORD RZX
           .WORD RZX
           .WORD MZX
           .WORD MZX
           .WORD N
           .WORD RAY
           .WORD N
           .WORD MAY
           .WORD RAX
           .WORD RAX
           .WORD MAX
           .WORD MAX
           .WORD JSRW
           .WORD RIX
           .WORD HLTN
           .WORD MIX
           .WORD RZ
           .WORD RZ
           .WORD MZ
           .WORD MZ
           .WORD PLPN
           .WORD B
           .WORD N
           .WORD B
           .WORD RA
           .WORD RA
           .WORD MA
           .WORD MA
           .WORD R
           .WORD RIY
           .WORD HLTN
           .WORD MIY
           .WORD RZX
           .WORD RZX
           .WORD MZX
           .WORD MZX
           .WORD N
           .WORD RAY
           .WORD N
           .WORD MAY
           .WORD RAX
           .WORD RAX
           .WORD MAX
           .WORD MAX
           .WORD RTIN
           .WORD RIX
           .WORD HLTN
           .WORD MIX
           .WORD RZ
           .WORD RZ
           .WORD MZ
           .WORD MZ
           .WORD PHAN
           .WORD B
           .WORD N
           .WORD B
           .WORD JMPW
           .WORD RA
           .WORD MA
           .WORD MA
           .WORD R
           .WORD RIY
           .WORD HLTN
           .WORD MIY
           .WORD RZX
           .WORD RZX
           .WORD MZX
           .WORD MZX
           .WORD N
           .WORD RAY
           .WORD N
           .WORD MAY
           .WORD RAX
           .WORD RAX
           .WORD MAX
           .WORD MAX
           .WORD RTSN
           .WORD RIX
           .WORD HLTN
           .WORD MIX
           .WORD RZ
           .WORD RZ
           .WORD MZ
           .WORD MZ
           .WORD PLAN
           .WORD B
           .WORD N
           .WORD B
           .WORD JMPI
           .WORD RA
           .WORD MA
           .WORD MA
           .WORD R
           .WORD RIY
           .WORD HLTN
           .WORD MIY
           .WORD RZX
           .WORD RZX
           .WORD MZX
           .WORD MZX
           .WORD SEIN
           .WORD RAY
           .WORD N
           .WORD MAY
           .WORD RAX
           .WORD RAX
           .WORD MAX
           .WORD MAX
           .WORD B
           .WORD WIX
           .WORD B
           .WORD RIX
           .WORD WZ
           .WORD WZ
           .WORD WZ
           .WORD RZ
           .WORD N
           .WORD B
           .WORD N
           .WORD B
           .WORD WA
           .WORD WA
           .WORD WA
           .WORD RA
           .WORD R
           .WORD WIY
           .WORD HLTN
           .WORD WIY
           .WORD WZX
           .WORD WZX
           .WORD WZY
           .WORD RZY
           .WORD N
           .WORD WAY
           .WORD N
           .WORD WAY
           .WORD WAX
           .WORD WAX
           .WORD WAY
           .WORD WAY
           .WORD B
           .WORD RIX
           .WORD B
           .WORD RIX
           .WORD RZ
           .WORD RZ
           .WORD RZ
           .WORD RZ
           .WORD N
           .WORD B
           .WORD N
           .WORD B
           .WORD RA
           .WORD RA
           .WORD RA
           .WORD RA
           .WORD R
           .WORD RIY
           .WORD HLTN
           .WORD RIY
           .WORD RZX
           .WORD RZX
           .WORD RZY
           .WORD RZY
           .WORD N
           .WORD RAY
           .WORD N
           .WORD RAY
           .WORD RAX
           .WORD RAX
           .WORD RAY
           .WORD RAY
           .WORD B
           .WORD RIX
           .WORD B
           .WORD MIX
           .WORD RZ
           .WORD RZ
           .WORD MZ
           .WORD MZ
           .WORD N
           .WORD B
           .WORD N
           .WORD B
           .WORD RA
           .WORD RA
           .WORD MA
           .WORD MA
           .WORD R
           .WORD RIY
           .WORD HLTN
           .WORD MIY
           .WORD RZX
           .WORD RZX
           .WORD MZX
           .WORD MZX
           .WORD N
           .WORD RAY
           .WORD N
           .WORD MAY
           .WORD RAX
           .WORD RAX
           .WORD MAX
           .WORD MAX
           .WORD B
           .WORD RIX
           .WORD B
           .WORD MIX
           .WORD RZ
           .WORD RZ
           .WORD MZ
           .WORD MZ
           .WORD N
           .WORD B
           .WORD N
           .WORD B
           .WORD RA
           .WORD RA
           .WORD MA
           .WORD MA
           .WORD R
           .WORD RIY
           .WORD HLTN
           .WORD MIY
           .WORD RZX
           .WORD RZX
           .WORD MZX
           .WORD MZX
           .WORD N
           .WORD RAY
           .WORD N
           .WORD MAY
           .WORD RAX
           .WORD RAX
           .WORD MAX
           .WORD MAX

CMD        .BYTE 0

WRONG
           JSR RESTOREINT
           JSR PRINT
           .BYTE 13
           .TEXT "WRONG $DC0D"
           .BYTE 0
           JMP WAITK

MAIN
           JSR PRINT
           .BYTE 13
           .TEXT "�IRQ"
           .BYTE 0

           TSX
           STX ERROR+1
           LDA #0
           STA CMD

           LDA #5
           JSR SETINT
           LDA $DC0D  // CIAICR
           CMP #$00
           BNE WRONG
           LDA #4
           JSR SETINT
           LDA $DC0D  // CIAICR
           CMP #$01   // TimerA count down
           BNE WRONG
           LDA #3
           JSR SETINT
           LDA $DC0D  // CIAICR
           CMP #$81   // TimerA count down / IRQ
           BNE WRONG
           JSR RESTOREINT

LOOP
           .BLOCK
           LDA CMD
           CMP #$FF
           JMP OK
           LDA #13
           JSR $FFD2
           LDA CMD
           JSR PRINTHB
WAITKEY
           JSR $FFE4
           BEQ WAITKEY
           CMP #3
           BNE OK
           JMP $8000
OK
           .BEND

           LDA #<ADDRESSING
           LDX #>ADDRESSING
           CLC
           ADC CMD
           BCC NOINC1
           INX
NOINC1
           CLC
           ADC CMD
           BCC NOINC2
           INX
NOINC2
           STA 172
           STX 173
           LDY #0
           LDA (172),Y
           STA JUMP+1
           INY
           LDA (172),Y
           STA JUMP+2
JUMP
           JSR $1111
NOERROR
           INC CMD
           BNE LOOP

           JMP OK

CLOCK      .BYTE 0
RIGHTLOW   .BYTE 0
RIGHTHIGH  .BYTE 0

COMPARE
           STX ADDLOW+1
           CLC
ADDLOW
           ADC #$11
           STA RIGHTLOW
           BCC NOINY
           INY
NOINY
           STY RIGHTHIGH
           CMP INTLOW
           BNE ERROR
           CPY INTHIGH
           BNE ERROR
           LDA FLAGSBEFORE
           AND #$14
           BNE ERROR
           LDA FLAGSAFTER
           AND #$14
           CMP #$14
           BNE ERROR
           RTS

ERROR
           LDX #$11
           TXS
           LDA #13
           JSR $FFD2
           LDA CMD
           JSR PRINTHB
           LDA #"/"
           JSR $FFD2
           LDX CLOCK
           LDA #0
           JSR $BDCD
           JSR PRINT
           .BYTE 13
           .TEXT "STACK  "
           .BYTE 0
           LDA INTHIGH
           JSR PRINTHB
           LDA INTLOW
           JSR PRINTHB
           LDA #32
           JSR $FFD2
           LDA FLAGSBEFORE
           AND #$14
           JSR PRINTHB
           LDA #32
           JSR $FFD2
           LDA FLAGSAFTER
           AND #$14
           JSR PRINTHB
           JSR PRINT
           .BYTE 13
           .TEXT "RIGHT  "
           .BYTE 0
           LDA RIGHTHIGH
           JSR PRINTHB
           LDA RIGHTLOW
           JSR PRINTHB
           LDA #32
           JSR $FFD2
           LDA #$00
           JSR PRINTHB
           LDA #32
           JSR $FFD2
           LDA #$14
           JSR PRINTHB
WAITK
           JSR $FFE4
           BEQ WAITK
           CMP #3
           BEQ STOP
           JMP NOERROR
STOP
           LDA TURBOASS
           BEQ BASIC
           JMP $8000
BASIC
           JMP $A474


OK
           JSR PRINT
           .TEXT " - OK"
           .BYTE 13,0
           LDA TURBOASS
           BEQ LOAD
WAITKEY    JSR $FFE4
           BEQ WAITKEY
           JMP $8000

LOAD
           LDA #47
           STA 0
           JSR PRINT
NAME       .TEXT "NMI"
NAMELEN    = *-NAME
           .BYTE 0
           LDA #0
           STA $0A
           STA $B9
           LDA #NAMELEN
           STA $B7
           LDA #<NAME
           STA $BB
           LDA #>NAME
           STA $BC
           PLA
           PLA
           JMP $E16F


N
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           LDA #1
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
COMMAND
           NOP
           CLI
           CLD
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           JSR RESTORESTACK
           RTS
RIGHT      .BYTE 1,2
           .BEND


SEIN
           .BLOCK
           LDA #0
           STA CLOCK
           JSR SETINT
           SEI
IRQ
           CLI
           CLD
           JSR RESTOREINT
           LDA FLAGSBEFORE
           EOR #$04
           STA FLAGSBEFORE
           LDA #0
           LDX #<IRQ
           LDY #>IRQ
           JSR COMPARE
           .BEND

           .BLOCK
           LDA #1
           STA CLOCK
           JSR SETINT
           SEI
           CLI
           CLD
IRQ
           JSR RESTOREINT
           LDA #0
           LDX #<IRQ
           LDY #>IRQ
           JSR COMPARE
           .BEND

           RTS

B
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #1
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA #0
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 2,3
           .BEND


RZ
WZ
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #2
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA 2
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 2,2,3
           .BEND


MZ
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #4
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA 2
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 2,2,2,2,3
           .BEND


RZX
RZY
WZX
WZY
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #3
           STA CLOCK
LOOP
           LDX #0
           LDY #0
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA 2,X
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 2,2,2,3
           .BEND



MZX
MZY
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #5
           STA CLOCK
LOOP
           LDX #0
           LDY #0
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA 2,X
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 2,2,2,2,2,3
           .BEND


RA
WA
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #3
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA $FFF0
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 3,3,3,4
           .BEND


MA
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #5
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA $FFF0
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 3,3,3,3,3,4
           .BEND


RAX
RAY
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           LDA #3
           STA CLOCK
LOOP
           LDX #0
           LDY #0
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA $FFF0,X
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT1,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           LDA CMD
           STA COMMAND2
           LDA #4
           STA CLOCK
LOOP2
           LDX #$12
           LDY #$12
           LDA CLOCK
           JSR SETINT
COMMAND2
           LDA $FFF0,X
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT2,X
           LDX #<COMMAND2
           LDY #>COMMAND2
           JSR COMPARE
           DEC CLOCK
           BPL LOOP2
           JSR RESTORESTACK
           RTS
RIGHT1     .BYTE 3,3,3,4
RIGHT2     .BYTE 3,3,3,3,4
           .BEND


WAX
WAY
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           LDA #4
           STA CLOCK
LOOP
           LDX #0
           LDY #0
           LDA CLOCK
           JSR SETINT
COMMAND
           STA $FFF0,X
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           JSR RESTORESTACK
           RTS
RIGHT      .BYTE 3,3,3,3,4
           .BEND


MAX
MAY
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           LDA #6
           STA CLOCK
LOOP
           LDX #0
           LDY #0
           LDA CLOCK
           JSR SETINT
COMMAND
           STA $FFF0,X
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           JSR RESTORESTACK
           RTS
RIGHT      .BYTE 3,3,3,3,3,3,4
           .BEND


RIX
WIX
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           LDA #$02
           STA 172
           LDA #$00
           STA 173
           LDA #5
           STA CLOCK
LOOP
           LDX #0
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA (172,X)
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           JSR RESTORESTACK
           RTS
RIGHT      .BYTE 2,2,2,2,2,3
           .BEND


MIX
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           LDA #$02
           STA 172
           LDA #$00
           STA 173
           LDA #7
           STA CLOCK
LOOP
           LDX #0
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA (172,X)
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           JSR RESTORESTACK
           RTS
RIGHT      .BYTE 2,2,2,2,2,2,2,3
           .BEND


RIY
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           STA COMMAND1
           LDA #$F0
           STA 172
           LDA #$FF
           STA 173
           LDA #4
           STA CLOCK
LOOP
           LDY #$00
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA (172),Y
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           LDA #5
           STA CLOCK
LOOP1
           LDY #$12
           LDA CLOCK
           JSR SETINT
COMMAND1
           LDA (172),Y
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT1,X
           LDX #<COMMAND1
           LDY #>COMMAND1
           JSR COMPARE
           DEC CLOCK
           BPL LOOP1
           JSR RESTORESTACK
           RTS
RIGHT      .BYTE 2,2,2,2,3
RIGHT1     .BYTE 2,2,2,2,2,3
           .BEND


WIY
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           LDA #$F0
           STA 172
           LDA #$FF
           STA 173
           LDA #5
           STA CLOCK
LOOP
           LDY #$00
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA (172),Y
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           JSR RESTORESTACK
           RTS
RIGHT      .BYTE 2,2,2,2,2,3
           .BEND


MIY
           .BLOCK
           JSR SAVESTACK
           LDA CMD
           STA COMMAND
           LDA #$F0
           STA 172
           LDA #$FF
           STA 173
           LDA #7
           STA CLOCK
LOOP
           LDY #$00
           LDA CLOCK
           JSR SETINT
COMMAND
           LDA (172),Y
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           JSR RESTORESTACK
           RTS
RIGHT      .BYTE 2,2,2,2,2,2,2,3
           .BEND


R
           .BLOCK
FROM       = $2000
TO         = $2000
           LDA CMD
           STA FROM-2
           LDX #$F3
           AND #$20
           BEQ CLEAR
           LDX #$30
CLEAR
           TXA
           PHA
           LDA #TO-FROM&$FF
           STA FROM-1
           LDA #$EA
           STA TO
           LDA #$60
           STA TO+1
           LDA #0
           STA CLOCK
           LDA #10
           JSR SETINT
           PLP
           JSR FROM-2
           JSR RESTOREINT
           LDX #<TO
           LDY #>TO
           LDA #0
           JSR COMPARE
           .BEND

           .BLOCK
FROM       = $2000
TO         = $2000
           LDA CMD
           STA FROM-2
           LDX #$F3
           AND #$20
           BEQ CLEAR
           LDX #$30
CLEAR
           TXA
           PHA
           LDA #TO-FROM&$FF
           STA FROM-1
           LDA #$EA
           STA TO
           LDA #$60
           STA TO+1
           LDA #1
           STA CLOCK
           LDA #11
           JSR SETINT
           PLP
           JSR FROM-2
           JSR RESTOREINT
           LDX #<TO
           LDY #>TO
           LDA #1
           JSR COMPARE
           .BEND

           .BLOCK
FROM       = $2000
TO         = $2010
           LDA CMD
           STA FROM-2
           LDX #$F3
           AND #$20
           BNE CLEAR
           LDX #$30
CLEAR
           TXA
           PHA
           LDA #TO-FROM&$FF
           STA FROM-1
           LDA #$EA
           STA TO
           LDA #$60
           STA TO+1
           LDA #0
           STA CLOCK
           LDA #10
           JSR SETINT
           PLP
           JSR FROM-2
           JSR RESTOREINT
           LDX #<TO
           LDY #>TO
           LDA #0
           JSR COMPARE
           .BEND

           .BLOCK
FROM       = $2000
TO         = $2010
           LDA CMD
           STA FROM-2
           LDX #$F3
           AND #$20
           BNE CLEAR
           LDX #$30
CLEAR
           TXA
           PHA
           LDA #TO-FROM&$FF
           STA FROM-1
           LDA #$EA
           STA TO
           LDA #$60
           STA TO+1
           LDA #1
           STA CLOCK
           LDA #11
           JSR SETINT
           PLP
           JSR FROM-2
           JSR RESTOREINT
           LDX #<TO
           LDY #>TO
           LDA #1
           JSR COMPARE
           .BEND

           .BLOCK
FROM       = $2000
TO         = $2010
           LDA CMD
           STA FROM-2
           LDX #$F3
           AND #$20
           BNE CLEAR
           LDX #$30
CLEAR
           TXA
           PHA
           LDA #TO-FROM&$FF
           STA FROM-1
           LDA #$EA
           STA TO
           LDA #$60
           STA TO+1
           LDA #2
           STA CLOCK
           LDA #12
           JSR SETINT
           PLP
           JSR FROM-2
           JSR RESTOREINT
           LDX #<TO
           LDY #>TO
           LDA #1
           JSR COMPARE
           .BEND

           .BLOCK
FROM       = $1FF0
TO         = $2010
           LDA CMD
           STA FROM-2
           LDX #$F3
           AND #$20
           BNE CLEAR
           LDX #$30
CLEAR
           TXA
           PHA
           LDA #TO-FROM&$FF
           STA FROM-1
           LDA #$EA
           STA TO
           LDA #$60
           STA TO+1
           LDA #1
           STA CLOCK
           LDA #11
           JSR SETINT
           PLP
           JSR FROM-2
           JSR RESTOREINT
           LDX #<TO
           LDY #>TO
           LDA #0
           JSR COMPARE
           .BEND

           .BLOCK
FROM       = $1FF0
TO         = $2010
           LDA CMD
           STA FROM-2
           LDX #$F3
           AND #$20
           BNE CLEAR
           LDX #$30
CLEAR
           TXA
           PHA
           LDA #TO-FROM&$FF
           STA FROM-1
           LDA #$EA
           STA TO
           LDA #$60
           STA TO+1
           LDA #2
           STA CLOCK
           LDA #12
           JSR SETINT
           PLP
           JSR FROM-2
           JSR RESTOREINT
           LDX #<TO
           LDY #>TO
           LDA #0
           JSR COMPARE
           .BEND

           .BLOCK
FROM       = $1FF0
TO         = $2010
           LDA CMD
           STA FROM-2
           LDX #$F3
           AND #$20
           BNE CLEAR
           LDX #$30
CLEAR
           TXA
           PHA
           LDA #TO-FROM&$FF
           STA FROM-1
           LDA #$EA
           STA TO
           LDA #$60
           STA TO+1
           LDA #3
           STA CLOCK
           LDA #13
           JSR SETINT
           PLP
           JSR FROM-2
           JSR RESTOREINT
           LDX #<TO
           LDY #>TO
           LDA #1
           JSR COMPARE
           .BEND

           RTS


BRKN
           .BLOCK
           LDA #40
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
           BRK
           NOP
BRKIRQ
           JSR RESTOREINT
           LDA FLAGSBEFORE
           EOR #$10
           STA FLAGSBEFORE
           LDX #<BRKIRQ
           LDY #>BRKIRQ
           LDA #0
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
           .BEND


PHAN
PHPN
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #2
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
COMMAND
           NOP
           PLA
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 1,1,2
           .BEND


PLAN
PLPN
           .BLOCK
           LDA CMD
           STA COMMAND
           LDA #3
           STA CLOCK
LOOP
           LDA #0
           PHA
           LDA CLOCK
           JSR SETINT
COMMAND
           NOP
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<COMMAND
           LDY #>COMMAND
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 1,1,1,2
           .BEND


JMPW
           .BLOCK
           LDA #2
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
           JMP TARGET
           BRK
TARGET
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<TARGET
           LDY #>TARGET
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 0,0,1
           .BEND


JMPI
           .BLOCK
           LDA #<TARGET
           STA $2000
           LDA #>TARGET
           STA $2001
           LDA #4
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
           JMP ($2000)
           BRK
TARGET
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<TARGET
           LDY #>TARGET
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 0,0,0,0,1
           .BEND


JSRW
           .BLOCK
           LDA #5
           STA CLOCK
LOOP
           LDA CLOCK
           JSR SETINT
           JSR TARGET
           BRK
TARGET
           PLA
           PLA
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<TARGET
           LDY #>TARGET
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 0,0,0,0,0,1
           .BEND


RTSN
           .BLOCK
           LDA #5
           STA CLOCK
LOOP
           LDA #>CONTINUE-1
           PHA
           LDA #<CONTINUE-1
           PHA
           LDA CLOCK
           JSR SETINT
           RTS
CONTINUE
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<CONTINUE
           LDY #>CONTINUE
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 0,0,0,0,0,1
           .BEND


RTIN
           .BLOCK
           LDA #5
           STA CLOCK
LOOP
           LDA #>CONTINUE
           PHA
           LDA #<CONTINUE
           PHA
           PHP
           LDA CLOCK
           JSR SETINT
           RTI
CONTINUE
           NOP
           JSR RESTOREINT
           LDX CLOCK
           LDA RIGHT,X
           LDX #<CONTINUE
           LDY #>CONTINUE
           JSR COMPARE
           DEC CLOCK
           BPL LOOP
           RTS
RIGHT      .BYTE 0,0,0,0,0,1
           .BEND


HLTN
           RTS
