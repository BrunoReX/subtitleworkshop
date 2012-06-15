@echo off
"D:\Software\Borland\Delphi7\Bin\dcc32.exe" "G:\URUSoft\Programs\SubtitleAPI_Old\SubtitleAPI.dpr"
"G:\Others\UPX\upx.exe" "G:\URUSoft\Programs\Subtitle Workshop\2.52\Bin\SubtitleAPI\SubtitleAPI.dll" --compress-exports=1 --compress-resources=1 --strip-relocs --best --compress-icons=1

"D:\Software\Borland\Delphi7\Bin\dcc32.exe" "G:\URUSoft\Programs\Subtitle Workshop\2.52\SubtitleWorkshop.dpr"
"G:\Others\UPX\upx.exe" "G:\URUSoft\Programs\Subtitle Workshop\2.52\Bin\SubtitleWorkshop.exe" --compress-exports=1 --compress-resources=1 --strip-relocs --best --compress-icons=1
