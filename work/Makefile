# stuff I work on from time to time

URL1 = https://github.com/teuben/nemo
URL2 = https://github.com/astroumd/miriad
URL3 = https://github.com/astroumd/lmtoy
URL4 = https://github.com/GreenbankObservatory/dysh
URL5 = https://github.com/teuben/GBT-EDGE
URL6 = https://github.com/Smithsonian/SMA-Software

ALL = nemo miriad lmtoy dysh

## help:       Show help
help : Makefile
	@echo "ALL: $(ALL)"
	@sed -n 's/^##//p' $<

## all:        Download ALL git repos I work on
all:	$(ALL)

## clean:      Remote ALL git repos here
clean:
	rm -rf $(ALL)

nemo:
	git clone $(URL1)

miriad:
	git clone $(URL2)

lmtoy:
	git clone $(URL3)

dysh:
	git clone $(URL4)

GBT-EDGE:
	git clone $(URL5)

SMA-Software:
	git clone $(URL6)


install_dysh: dysh nemo
	@echo Now more
	(cd dysh;\
	../nemo/src/scripts/install_anaconda3 wget=wgetc;\
	source anaconda3/python_start.sh;\
	pip install -e .)
