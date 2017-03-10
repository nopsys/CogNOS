initialization
initializeRootHubs
	"
\ We mustn't wait more than 3 ms between releasing the reset and enabling
\ the port to begin the SOF stream, otherwise some devices (e.g. pl2303)
\ will go into suspend state and then not respond to set-address.
: reset-root-hub-port  ( port -- )
   dup >r  portsc@ h# 20e invert and    ( value r: port )  \ Clear reset, enable, status
   dup h# 200 or  r@ portsc!	        ( value r: port )  \ Reset port
   d# 30 ms                             ( value r: port )  \ > 10 ms - reset time
   dup r@ portsc!                       ( value r: port )  \ Release reset
   1 ms                                 ( value r: port )  \ > 5.3 uS - reconnect time
   h# e or  r> portsc!	                ( )  \ Enable port and clear status
;

: probe-root-hub-port  ( port -- )
   dup reset-root-hub-port
   dup portsc@ 1 and 0=  if  drop exit  then		\ No device-connected
   ok-to-add-device? 0=  if  drop exit  then		\ Can't add another device

   new-address				( port dev )
   over portsc@ 100 and  if  speed-low  else  speed-full  then
   over di-speed!			( port dev )

   0 set-target				( port dev )    \ Address it as device 0
   dup set-address  if  2drop exit  then ( port dev )	\ Assign it usb addr dev
   dup set-target			( port dev )    \ Address it as device dev
   make-device-node			( )
;

external
: power-ports  ( -- )  ;

: probe-root-hub  ( -- )
   \ Set active-package so device nodes can be added and removed
   my-self ihandle>phandle push-package

   alloc-pkt-buf
   2 0  do
      i portsc@ h# a and  if
         i rm-obsolete-children			\ Remove obsolete device nodes
         i ['] probe-root-hub-port catch  if
            drop .' Failed to probe root port ' i .d cr
         then
         i portsc@ i portsc!			\ Clear change bits
      then
   loop
   free-pkt-buf

   pop-package
;
	"