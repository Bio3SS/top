## This is Bio3SS/top, the first container directory!
current: target
-include target.mk

##################################################################

## Screens

projdirs += Lectures web
rprojdirs += exponential ts
linkdirs += subLectures

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk README.md"

######################################################################

## Directories

Lectures: dir=rhdir/git_Bio3SS_Lectures

web: dir=rhdir/git_Bio3SS_Bio3SS.github.io

exponential: dir=rhdir/git_Bio3SS_Exponential_figures
ts: dir=rhdir/git_Bio3SS_Population_time_series

## This is done automatically in makestuff; just here for hooks
## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

## linkdirs

subLectures: dir=rhdir/git_Bio3SS_submodLectures
subLectures: 
	$(rhsetup)
	chmod -R a-w $@

######################################################################

### Makestuff

Sources += Makefile README.md

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/dirdir.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/repohome.mk
