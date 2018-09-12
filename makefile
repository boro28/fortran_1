KIND = $(kind)
F90_VENDOR = Intel
F90=ifort
FFLAGS=-funroll-all-loops -WB -std08 -module . -implicitnone -fpp -warn all -pedantic -fpp -Iout/ -DDEF_KIND=$(KIND)  -g

all: out/main

out/main: src/main.f90 out/utils.mod out/gauss.mod out/matrix_populate.mod
	$(F90) $^ -o $@$(KIND) $(FFLAGS)
	-rm -r out/*.mod *.mod

out/matrix_populate.mod: src/matrix_populate.f90 out/utils.mod
	$(F90) $^ -c -o $@ $(FFLAGS)

out/gauss.mod: src/gauss.f90 out/utils.mod
	$(F90) $^ -c -o $@ $(FFLAGS)

out/utils.mod: src/utils.f90
	mkdir -p out
	$(F90) $^ -c -o $@ $(FFLAGS)

clean:
	-rm -r out *.mod

