@echo off

rem Assemble game
 sjasm.exe -s keytest.asm 
 copy keytest.out keytest.rom
