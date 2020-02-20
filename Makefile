## This is Bio3SS/top, the first container directory!
current: target
-include target.mk

##################################################################

## Screens

projdirs += Lectures web Homework Tests
rprojdirs += exponential ts evaluation
rprojdirs += compensation bd_models WA_Ebola_Outbreak dd assign
rprojdirs += Life_tables structure age
rprojdirs += boxes sims

## Older version of lectures 
## linkdirs += subLectures
## subLectures: dir=rhdir/git_Bio3SS_submodLectures

screen_session: 
	$(plvscreens)

## Vim

vim_session:
	bash -cl "vi Makefile target.mk README.md"

######################################################################

## Directories

Lectures: dir=rhdir/git_Bio3SS_Lectures
web: dir=rhdir/git_Bio3SS_Bio3SS.github.io

## Public machinery
Homework: dir=rhdir/git_Bio3SS_Homework
Tests Life_tables:
	git clone https://github.com/Bio3SS/$@.git

structure:
	git clone https://github.com/Bio3SS/Structured_models.git $@

age:
	git clone https://github.com/Bio3SS/Age_distributions.git $@

sims:
	git clone https://github.com/dushoff/SIR_simulations.git $@

boxes: 
	git clone https://github.com/dushoff/SIR_model_family $@

## rhdir is deprecated now; it was for working out screens-import bugs
exponential: dir=rhdir/git_Bio3SS_Exponential_figures
ts: dir=rhdir/git_Bio3SS_Population_time_series
compensation: dir=rhdir/git_Bio3SS_Compensation_models
bd_models: dir=rhdir/git_Bio3SS_Birth_death_models
WA_Ebola_Outbreak: dir= rhdir/git_Outbreak-analysis_WA_Ebola_Outbreak
dd: dir=rhdir/git_mac-theobio_Disease_data


## Private directory used by Homework and Tests
evaluation: dir=rhdir/git_Bio3SS_Evaluation_materials

## Older one; keep calculations here and substance there?
assign:
	git clone https://github.com/Bio3SS/Assignments.git $@

## This is done automatically in makestuff; just here for hooks
## makestuff/repohome.auto.mk: makestuff/repohome.list makestuff/repohome.pl

## linkdirs

######################################################################

### Makestuff

Sources += Makefile README.md schedule.md

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
## -include makestuff/repohome.mk
