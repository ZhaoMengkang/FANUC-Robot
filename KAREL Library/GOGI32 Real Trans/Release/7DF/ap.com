FRCLRPR
PRINT "Install Real Data Trans/Recv Opt"
PRINT "Controller Version V9"
PRINT "Load KAREL Program"
PCLOAD 7DF\GI32_RECV
PCLOAD 7DF\GO32_SEND
PRINT "Copy arguments describe files"
FRCOPY 7DF\argdispchmklb.dt frsu:\argdispchmklb.dt
FRCOPY 7DF\argdispegmklb.dt frsu:\argdispegmklb.dt
SETVAR $ARGDISPMODE 2
PRINT "Install done,Please Cold Start"