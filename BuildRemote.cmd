@echo on
@echo Setting up variables
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
@echo Selecting Remote directory

SET RemoteDirectory=%cd%
@echo Current directory: %RemoteDirectory%

@echo Restoring packages
msbuild /t:restore /p:configuration=Debug;Platform="Any CPU"

@echo Building Debug AnyCPU in directory %cd%
msbuild /t:rebuild /p:configuration=Debug;Platform="Any CPU"

cd %RemoteDirectory%
@echo Building Release AnyCPU in directory %cd%
msbuild /t:rebuild /p:configuration=Release;Platform="Any CPU"