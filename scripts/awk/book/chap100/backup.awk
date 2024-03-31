NR==1 {
    print $0,"Backup_status"; 
    next
}

{ 
    backup_cmd = "cp " $2 " " toDir " >/dev/null 2>&1"
    st = system(backup_cmd)
    print $0, ( st==0? "Success" : "Failed" ) 
}