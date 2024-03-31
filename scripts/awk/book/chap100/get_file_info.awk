NR==1 {
    print $0,"MIME_type"
    next
}

{ 
    _cmd = "file -b --mime-type " $2
    _cmd | getline result
    close(_cmd)
    print $0, result 
}