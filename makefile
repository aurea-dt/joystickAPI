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
	INCLUIDES=$(shell pkg-config --cflags glib-2.0)
	LIBS=$(shell pkg-config --libs glib-2.0)
#Directories
	DIRlib= /usr/local/lib	
	incDIR= /usr/local/include
#main function
	mainP= main
#-------------------------------------------------------------------------------
all: Project

Project: mainP.o ADT_joystick.o
	$(CC) -export-dynamic -o $(APPNAME) \
	$(LIBS) \
	$(mainP).o \
	ADT_joystick.o \
	
mainP.o: $(mainP).cpp
	$(CC) $(INCLUIDES) $(CFLAGS) \
	$(mainP).cpp
	
ADT_joystick.o: ADT_joystick.cpp
	$(CC) $(INCLUIDES) $(CFLAGS) \
	ADT_joystick.cpp 

	
