lovefile:
	@rm -rf build/lovefile
	@mkdir -p build/lovefile

	@cd src/love; zip -r -9 ../../build/lovefile/game.love .

	@mkdir -p build/release
	@rm -f build/release/game-lovefile.zip
	@cd build/lovefile; zip -9 -r ../release/game-lovefile.zip .

win64: lovefile
	@rm -rf build/win64
	@mkdir -p build/win64

	@cp resources/win64/love/OpenAL32.dll build/win64
	@cp resources/win64/love/SDL2.dll build/win64
	@cp resources/win64/love/license.txt build/win64
	@cp resources/win64/love/lua51.dll build/win64
	@cp resources/win64/love/mpg123.dll build/win64
	@cp resources/win64/love/love.dll build/win64
	@cp resources/win64/love/msvcp120.dll build/win64
	@cp resources/win64/love/msvcr120.dll build/win64

	@cat resources/win64/love/love.exe build/lovefile/game.love > build/win64/game.exe

	@mkdir -p build/release
	@rm -f build/release/game-win64.zip
	@cd build/win64; zip -9 -r ../release/game-win64.zip .

win32: lovefile
	@rm -rf build/win32
	@mkdir -p build/win32

	@cp resources/win32/love/OpenAL32.dll build/win32
	@cp resources/win32/love/SDL2.dll build/win32
	@cp resources/win32/love/license.txt build/win32
	@cp resources/win32/love/lua51.dll build/win32
	@cp resources/win32/love/mpg123.dll build/win32
	@cp resources/win32/love/love.dll build/win32
	@cp resources/win32/love/msvcp120.dll build/win32
	@cp resources/win32/love/msvcr120.dll build/win32

	@cat resources/win32/love/love.exe build/lovefile/game.love > build/win32/game.exe

	@mkdir -p build/release
	@rm -f build/release/game-win32.zip
	@cd build/win32; zip -9 -r ../release/game-win32.zip .

macos: lovefile
	@rm -rf build/macos
	@mkdir -p "build/macos/Game.app"

	@cp -r resources/macos/love.app/. "build/macos/Game.app"

	@cp build/lovefile/game.love "build/macos/Game.app/Contents/Resources"

	@mkdir -p build/release
	@rm -f build/release/game-macos.zip
	@cd build/macos; zip -9 -r ../release/game-macos.zip .

switch: lovefile
	@rm -rf build/switch
	@mkdir -p build/switch/switch/game

	@nacptool --create "Game" Author "1.0.0" build/switch/game.nacp

	@mkdir build/switch/romfs
	@cp build/lovefile/game.love build/switch/romfs/game.love

	@elf2nro resources/switch/love.elf build/switch/switch/game/game.nro --nacp=build/switch/game.nacp --romfsdir=build/switch/romfs

	@rm -r build/switch/romfs
	@rm build/switch/game.nacp

	@mkdir -p build/release
	@rm -f build/release/game-switch.zip
	@cd build/switch; zip -9 -r ../release/game-switch.zip .