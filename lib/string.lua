function parseQuantity(number)
    if number < 1000 then return number
    else
        return round((number/1000), 2).."K"
    end
end