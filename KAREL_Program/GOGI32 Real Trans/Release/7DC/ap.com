FRCLRPR
PRINT "Install Real Data Trans/Recv Opt"
PRINT "Controller Version V8"
PRINT "Load KAREL Program"
PCLOAD 7DC\mk_lib
PCLOAD 7DC\gi32_recv
PCLOAD 7DC\go32_send
PRINT "Copy arguments describe files"
FRCOPY 7DC\argdispchmklb.dt frsu:\argdispchmklb.dt
FRCOPY 7DC\argdispegmklb.dt frsu:\argdispegmklb.dt
SETVAR $ARGDISPMODE 2
PRINT "Install done,Please Cold Start"