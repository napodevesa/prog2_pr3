##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=UOCinfectiousAgent
ConfigurationName      :=Debug
WorkspacePath          :=D:/uoc/s_20192
ProjectPath            :=D:/uoc/s_20192/UOCinfectiousAgent
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Carlos
Date                   :=01/05/2020
CodeLitePath           :="D:/Program Files/CodeLite"
LinkerName             :="C:/Program Files (x86)/mingw-w64/i686-8.1.0-posix-dwarf-rt_v6-rev0/mingw32/bin/g++.exe"
SharedObjectLinkerName :="C:/Program Files (x86)/mingw-w64/i686-8.1.0-posix-dwarf-rt_v6-rev0/mingw32/bin/g++.exe" -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=../lib/lib$(ProjectName).a
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="UOCinfectiousAgent.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :="C:/Program Files (x86)/mingw-w64/i686-8.1.0-posix-dwarf-rt_v6-rev0/mingw32/bin/windres.exe"
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)./include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := "C:/Program Files (x86)/mingw-w64/i686-8.1.0-posix-dwarf-rt_v6-rev0/mingw32/bin/ar.exe" rcu
CXX      := "C:/Program Files (x86)/mingw-w64/i686-8.1.0-posix-dwarf-rt_v6-rev0/mingw32/bin/g++.exe"
CC       := "C:/Program Files (x86)/mingw-w64/i686-8.1.0-posix-dwarf-rt_v6-rev0/mingw32/bin/gcc.exe"
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := "C:/Program Files (x86)/mingw-w64/i686-8.1.0-posix-dwarf-rt_v6-rev0/mingw32/bin/as.exe"


##
## User defined environment variables
##
CodeLiteDir:=D:\Program Files\CodeLite
Objects0=$(IntermediateDirectory)/src_country.c$(ObjectSuffix) $(IntermediateDirectory)/src_infection.c$(ObjectSuffix) $(IntermediateDirectory)/src_reservoir.c$(ObjectSuffix) $(IntermediateDirectory)/src_research.c$(ObjectSuffix) $(IntermediateDirectory)/src_city.c$(ObjectSuffix) $(IntermediateDirectory)/src_infectiousAgent.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(IntermediateDirectory) $(OutputFile)

$(OutputFile): $(Objects)
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(AR) $(ArchiveOutputSwitch)$(OutputFile) @$(ObjectsFileList) $(ArLibs)
	@$(MakeDirCommand) "D:\uoc\s_20192/.build-debug"
	@echo rebuilt > "D:\uoc\s_20192/.build-debug/UOCinfectiousAgent"

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


./Debug:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/src_country.c$(ObjectSuffix): src/country.c $(IntermediateDirectory)/src_country.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/uoc/s_20192/UOCinfectiousAgent/src/country.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_country.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_country.c$(DependSuffix): src/country.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_country.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_country.c$(DependSuffix) -MM src/country.c

$(IntermediateDirectory)/src_country.c$(PreprocessSuffix): src/country.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_country.c$(PreprocessSuffix) src/country.c

$(IntermediateDirectory)/src_infection.c$(ObjectSuffix): src/infection.c $(IntermediateDirectory)/src_infection.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/uoc/s_20192/UOCinfectiousAgent/src/infection.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_infection.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_infection.c$(DependSuffix): src/infection.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_infection.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_infection.c$(DependSuffix) -MM src/infection.c

$(IntermediateDirectory)/src_infection.c$(PreprocessSuffix): src/infection.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_infection.c$(PreprocessSuffix) src/infection.c

$(IntermediateDirectory)/src_reservoir.c$(ObjectSuffix): src/reservoir.c $(IntermediateDirectory)/src_reservoir.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/uoc/s_20192/UOCinfectiousAgent/src/reservoir.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_reservoir.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_reservoir.c$(DependSuffix): src/reservoir.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_reservoir.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_reservoir.c$(DependSuffix) -MM src/reservoir.c

$(IntermediateDirectory)/src_reservoir.c$(PreprocessSuffix): src/reservoir.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_reservoir.c$(PreprocessSuffix) src/reservoir.c

$(IntermediateDirectory)/src_research.c$(ObjectSuffix): src/research.c $(IntermediateDirectory)/src_research.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/uoc/s_20192/UOCinfectiousAgent/src/research.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_research.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_research.c$(DependSuffix): src/research.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_research.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_research.c$(DependSuffix) -MM src/research.c

$(IntermediateDirectory)/src_research.c$(PreprocessSuffix): src/research.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_research.c$(PreprocessSuffix) src/research.c

$(IntermediateDirectory)/src_city.c$(ObjectSuffix): src/city.c $(IntermediateDirectory)/src_city.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/uoc/s_20192/UOCinfectiousAgent/src/city.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_city.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_city.c$(DependSuffix): src/city.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_city.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_city.c$(DependSuffix) -MM src/city.c

$(IntermediateDirectory)/src_city.c$(PreprocessSuffix): src/city.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_city.c$(PreprocessSuffix) src/city.c

$(IntermediateDirectory)/src_infectiousAgent.c$(ObjectSuffix): src/infectiousAgent.c $(IntermediateDirectory)/src_infectiousAgent.c$(DependSuffix)
	$(CC) $(SourceSwitch) "D:/uoc/s_20192/UOCinfectiousAgent/src/infectiousAgent.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_infectiousAgent.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_infectiousAgent.c$(DependSuffix): src/infectiousAgent.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_infectiousAgent.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_infectiousAgent.c$(DependSuffix) -MM src/infectiousAgent.c

$(IntermediateDirectory)/src_infectiousAgent.c$(PreprocessSuffix): src/infectiousAgent.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_infectiousAgent.c$(PreprocessSuffix) src/infectiousAgent.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


