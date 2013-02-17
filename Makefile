# Makefile for crc

crc.app: main.o crcy.o crcl.o dstruct.o
	g++ -DEXTERNC -I/. crcl.o  crcy.o dstruct.o main.o -o $@
	
crcl.o: crc.l
	flex crc.l
	g++ -c lex.yy.c -o $@
	
crcy.o: crc.y
	bison -dvt crc.y
	g++ -c crc.tab.c -o $@
        
main.o: main.c
	g++ -c main.c -o $@
        
dstruct.o: dstruct.c
	g++ -c dstruct.c -o $@
