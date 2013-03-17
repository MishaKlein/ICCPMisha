FC = gfortran
FFLAGS = -Wall -Wextra -O3
LDFLAGS =  


#LIBS = -lX11 -L$(HOME)/XPS/lib -lxps
FFLAGS += $(shell pkg-config --cflags plplotd-f95)
LIBS = $(shell pkg-config --libs plplotd-f95)
COMPILE = $(FC) $(FFLAGS)
LINK = $(FC) $(LDFLAGS)
OBJS = 
OBJS += QMC.o

all: QMC

QMC: $(OBJS)
	$(LINK) -o $@ $^ $(LIBS)

%.o:%.f90
	$(COMPILE) -o $@ -c $<

clean:
	$(RM) QMC $(OBJS) *.mod
