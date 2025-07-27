set BLK "04"
set CHR "04"
set DIR "04"
set EXE "00"
set REG "00"
set HARDLINK "00"
set SYMLINK "06"
set MISSING "00"
set ORPHAN "01"
set FIFO "0F"
set SOCK "0F"
set OTHER "02"

set --export NNN_OPTS "cErx"
set --export NNN_COLORS '1234'
set --export NNN_FIFO '/tmp/nnn.fifo'
set --export NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
set --export NNN_BMS "d:$HOME/Documents;D:$HOME/Downloads/;h:$HOME"
set --export NNN_PLUG "z:autojump"
