def substring(string, dictionary)
    hash_of_coincidence = Hash.new
    dictionary.each do |value|
        if string.downcase.include?(value.downcase)
           hash_of_coincidence[value] = string.downcase.scan(/#{value.downcase}/).length
        end
    end
    puts hash_of_coincidence
    return hash_of_coincidence
end
the_raven = 'Deep into that darkness peering,

Long I stood there, wondering, fearing,

Doubting, dreaming dreams no mortals

Ever dared to dream before;

But the silence was unbroken,

And the stillness gave no token,

And the only word there spoken

Was the whispered word, "Lenore!"

This I whispered, and an echo

Murmured back the word, "Lenore!"

Merely this, and nothing more'
dictionary = ['this', 'is', 'more', 'in', 'and', 'but', 'was', 'futball', 'basketball', 'silence', 'the']
 substring(the_raven, dictionary)
