# datefix: convert mm/dd/yy into yyyy-mm-dd (for 1940 to 2039)
# awk -f "datefix.awk" $* 
#               12/25/23      return 2023-12-25

function datefix(s, y, date) {
    split(s, date, "/")
    y = date[3]<40 ? 2000+date[3] : 1900+date[3]
    return sprintf("%4d-%02d-%02d",y, date[1], date[2])
}

{
    print(datefix($0))
}