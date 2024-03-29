NR==1 {
    print $0,"status"; 
    next
}

{ 
    _cmd = "touch " $2 " >/dev/null 2>&1"
    st = system(_cmd)
    print $0, ( st==0? "Success" : "Failed" ) 
}