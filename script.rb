def caesar_cipher(string, shift)
    result = ''
    for i in 0...string.length do
        base = case string[i].ord
            when 65..90  then 65
            when 97..122 then 97
            else result += string[i]
        end
        if base.is_a? String
        else
        rotate = (((string[i].ord - base)+ shift) % 26) + base
        result += rotate.chr
        end
    end
    puts result
end
caesar_cipher('Messi campeon del mundo, boludo', 12)