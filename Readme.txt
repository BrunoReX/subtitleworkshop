These versions of Subtitle Workshop and Subtitle API are developed with Delphi 7.

Additional components Subtitle Workshop requires:
- SWComponents (included in source, see "SWComponents" directory)
- Innerfuse Pascal Script 3 (IFPS3) - current version used is 1.33 (included in source, see "3rd party components" directory)
- VirtualTreeView - current version used is 5.2.2 - http://www.delphi-gems.com/VirtualTreeview/
- AsyncCalls - current version used is 2.99 - http://andy.jgknet.de/blog/bugfix-units/asynccalls-29-asynchronous-function-calls/

Additional components Subtitle API requires:
- XML Parser (http://www.destructor.de/xmlparser/index.htm) - current version used is 1.0.20


To compile Subtitle Workshop's source code successfully:
1. Use Delphi 7, other versions won't work.
2. Install all the components listed above.
3. Add the paths to the source code directories for those components to your Delphi 7 Library path (Tools: Environment Options: Library).


UPX (The Ultimate Packer for eXecutables) is used for compression (through Finish.bat) - current version used is 3.91w - http://upx.sourceforge.net/

NSIS (nullsoft scriptable install system) is used for the creation of the installer file (through Installer\SubtitleWorkshop.nsi) - current version used is 2.46 - http://nsis.sourceforge.net


Subtitle Workshop and Subtitle API are released under the GNU/GPL 3 license.
