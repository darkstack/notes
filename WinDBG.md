.Net Debug   
Load SOS:  

> .loadby sos clr  

Load SOSEX:  

> .load **path**/sosex.dll  

Sympath:  

> .sympath 
<pre>
srv*c:\symbols*//msdl.microsoft.com/download/symbols  
</pre>
> .reload -f  

Dump Stack Object:  

> !dso

Dump All thread CLR Stack 

> ~*e!ClrStack  

SyncBlock (Stuck Thread)

> !SyncBlk




