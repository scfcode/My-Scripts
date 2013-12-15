BEGIN {
    tot = 0
}

{
    str = $8
    sub(/c$/,"", str)
    tot = tot + str
    
}

END {
    print tot
}