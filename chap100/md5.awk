NR==1 {
    print $0,",md5"
    next
}

{ 
    _cmd=sprintf("echo %s | md5sum  ", $2)
    _cmd | getline _md5
    print $0, ",MD5:" _md5
}
