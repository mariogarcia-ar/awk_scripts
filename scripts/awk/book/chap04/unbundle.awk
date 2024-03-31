# "","count.x","abv","ibu","id","beer","style","brewery_id","ounces","style2","count.y","brewery","city","state","label"

function normalizename(val) {
    gsub(/[^a-zA-Z0-9]/, "_", val)
    return  val
}

BEGIN	{
    print "Split the file into multiples files by style"
}

NR > 1 {
    style=$7
    filename =  normalizename(style) 

    if (filename != prev){
        close(prev); 
        prev = filename
    }
    print $0  > filename".csv"
}

END	{
    
}