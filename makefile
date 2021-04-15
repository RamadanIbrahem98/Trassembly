SiLabsPath := C:/SiLabs

# write the filename without the extension
assemblyFile := app

default: APP.ABS
	$(SiLabsPath)/MCU/IDEfiles/C51/BIN/oh51.exe $(assemblyFile).ABS

APP.ABS: app.asm
	$(SiLabsPath)/MCU/IDEfiles/C51/BIN/a51.exe $(assemblyFile).asm XR GEN DB EP NOMOD51
	$(SiLabsPath)/MCU/IDEfiles/C51/BIN/bl51.exe $(assemblyFile).OBJ TO $(assemblyFile).ABS

clean:
	del app.hex app.OBJ app.LST APP.M51 APP.ABS