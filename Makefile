EE_LIB =	libSDL2_gfx.a
EE_LIBS= \
	-lgskit \
	-lgskit_toolkit \
	-ldmakit \
	-lSDL2 \
	-lSDL2main \
	-lSDL2_test \
	-lSDL2_mixer \
	-lps2_drivers

EE_OBJS = \
	SDL2_framerate.o \
	SDL2_gfxPrimitives.o \
	SDL2_imageFilter.o \
	SDL2_rotozoom.o

EE_CFLAGS += \
	-Wall \
	-I$(PS2SDK)/common/include/sys \
	-I$(PS2SDK)/ports/include \
	-I$(PS2SDK)/ports/include/SDL2 \
	-I$(GSKIT)/include

EE_LDFLAGS = \
	-L$(PSDSDK)/ee/common/lib \
	-L$(PS2SDK)/ee/lib \
	-L$(PS2SDK)/ports/lib \
	-L$(GSKIT)/lib

all:$(EE_LIB)

install:
	install -d $(DESTDIR)$(PS2SDK)/ports/include/SDL2

	install -m 644 SDL2_framerate.h $(DESTDIR)$(PS2SDK)/ports/include/SDL2
	install -m 644 SDL2_gfxPrimitives.h $(DESTDIR)$(PS2SDK)/ports/include/SDL2
	install -m 644 SDL2_gfxPrimitives_font.h $(DESTDIR)$(PS2SDK)/ports/include/SDL2
	install -m 644 SDL2_imageFilter.h $(DESTDIR)$(PS2SDK)/ports/include/SDL2
	install -m 644 SDL2_rotozoom.h $(DESTDIR)$(PS2SDK)/ports/include/SDL2

	install -d $(DESTDIR)$(PS2SDK)/ports/lib

	install -m 644 $(EE_LIB) $(DESTDIR)$(PS2SDK)/ports/lib

uninstall:
	rm $(DESTDIR)$(PS2SDK)/ports/include/SDL2/SDL2_imageFilter.h
	rm $(DESTDIR)$(PS2SDK)/ports/include/SDL2/SDL2_framerate.h
	rm $(DESTDIR)$(PS2SDK)/ports/include/SDL2/SDL2_gfxPrimitives.h
	rm $(DESTDIR)$(PS2SDK)/ports/include/SDL2/SDL2_gfxPrimitives_font.h
	rm $(DESTDIR)$(PS2SDK)/ports/include/SDL2/SDL2_rotozoom.h
	rm $(DESTDIR)$(PS2SDK)/ports/lib/$(EE_LIB)

clean:
	rm -f -r $(EE_OBJS) $(EE_LIB)

include $(PS2SDK)/samples/Makefile.pref
include $(PS2SDK)/samples/Makefile.eeglobal
