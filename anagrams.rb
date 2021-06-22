# O(n!) combinatorial time
# O(n!) combinatorial space
def first_anagram?(string1, string2)
    all_anagrams(string1).include?(string2)
end

def all_anagrams(string)
    anagrams_array = []
    word_array = string.split("")
    anagrams = word_array.permutation.to_a
    anagrams.each do |word|
        anagrams_array << word.join("")
    end

    anagrams_array
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true