def substrings(word, dictionary)
  dictionary.reduce(Hash.new(0)) do |list, w|
    count = word.downcase.scan(w).count
    list[w] = count unless count == 0
    list
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)