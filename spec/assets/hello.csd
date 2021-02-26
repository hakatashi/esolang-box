<CsoundSynthesizer>
<CsInstruments>
sr = 1
kr = 1
ksmps = 1

instr 1
icH = -14336
ice = -6912
icl = -5120
ico = -4352
iComma = -21504
iSpace = -24576
icW = -10496
icr = -3584
icd = -7168
iExcl = -24320
iNewline = -30208
iRestbl ftgen 2, 0, 32, -7, icH, 1, icH, 0, ice, 1, ice, 0, icl, 1, icl, 0, icl, 1, icl, 0, ico, 1, ico, 0, iComma, 1, iComma, 0, iSpace, 1, iSpace, 0, icW, 1, icW, 0, ico, 1, ico, 0, icr, 1, icr, 0, icl, 1, icl, 0, icd, 1, icd, 0, iExcl, 1, iExcl, 0, iNewline, 1, iNewline, 0

aRes osciln 1, 1, iRestbl, 15
out aRes
endin

</CsInstruments>

<CsScore>
i 1 0 16
e
</CsScore>
</CsoundSynthesizer>
