# rest(n): returns fields n..NF as space-separated string

function rest(n,s) {
    s = ""
    while(n < NF)
        s = s n++ " "
    
    return substr(s, 1, length(s)-1)
}

# test it
{
    for (i=0; i<=NF+1; i++)
        printf("%3d [%s]\n", i, rest(i))
}