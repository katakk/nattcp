CC := gcc
CFLAGS := -Wall -O3
CPPFLAGS += -DUDP_FLIP

LUAC := luac
LUACFLAGS := -s

# Cygwin
#CFLAGS += -m32 -march=i486
#EXEEXT := .exe

MANIFEST := nattcp$(EXEEXT) udp-climber

all : $(MANIFEST)

nattcp$(EXEEXT) : nattcp.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $<

udp-climber : udp-climber.lua
	echo "#!/usr/bin/lua" >$@
	$(LUAC) $(LUACFLAGS) -o - $< >>$@
	chmod +x $@

clean:
	rm -f *.o $(MANIFEST)
