# cf:units conversion for temperature, length, weight

BEGIN	{
    # t = ARGV[1] # temperature 
    printf("%s C = %.1f F   ; %s F = %.1f C   \n", value, value*9/5 + 32, value, (value-32)*5/9)
    printf("%s cm = %.1f in ; %s in = %.1f cm \n", value, value/2.54, value, value*2.54)
    printf("%s kg = %.1f lb ; %s lb = %.1f kg \n", value, value*2.2, value, value/2.2)
}

# {

# }

# END	{
    
# }