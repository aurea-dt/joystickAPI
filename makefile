#-------------------------------------------------------------------------------
#	AUTOR
#	Aurea Desarrollo Tecnológico.
#	FECHA
#	Notas:
#-------------------------------------------------------------------------------
APPNAME = GTKapp
#Compiler:
	CC=g++

#Compiler flags
	CFLAGS=-c -g -Wall
	INCLUIDES=$(shell pkg-config --cflags gtk+-2.0 libgnomeui-2.0)
	LIBS=$(shell pkg-config --libs gtk+-2.0 libgnomeui-2.0)
#Directories
	DIRlib= /usr/local/lib	
	incDIR= /usr/local/include
	libADT= /home/mchc/aurea/cpp/programs/ADTlib-0.0.1
#main function
	mainP= main
	callbacks = My_callbacks
	guiClass = My_guiClass
#-------------------------------------------------------------------------------
all: Project

Project: mainP.o ADT_joystick.o
	$(CC) -export-dynamic -o $(APPNAME) \
	$(mainP).o \
	ADT_joystick.o \
	$(LIBS) \
	-L $(libADT) \
	-lADT
	
mainP.o: $(mainP).cpp
	$(CC) $(INCLUIDES) $(CFLAGS) \
	-I $(libADT) \
	$(mainP).cpp
	
ADT_joystick.o: ADT_joystick.cpp
	$(CC) $(INCLUIDES) $(CFLAGS) \
	-I $(libADT) \
	ADT_joystick.cpp 

	
