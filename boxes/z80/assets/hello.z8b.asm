
        ORG     0000h

        LD      L,0Dh
        LD      A,48h           ; 'H'
L0004:  CALL    8000h
        LD      A,(HL)
        INC     HL
        OR      A
        JR      NZ,L0004
        HALT
        LD      H,L
        LD      L,H
        LD      L,H
        LD      L,A
        INC     L
        JR      NZ,008Bh
        LD      L,A
        LD      (HL),D
        LD      L,H
        LD      H,H
        LD      HL,0000h
