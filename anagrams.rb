require 'byebug'

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

# O(n^2) quadratic time
# O(n) linear space
def second_anagram?(string1, string2)
    string2_array = string2.split("")
    string1.each_char do |char|
        idx2 = string2_array.find_index(char)
        if !idx2.nil?
            string2_array.delete_at(idx2)
        end
        return true if string2_array.empty?
    end
    false
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

# O(n*log(n)) linearithmic time
# O(n) linear space
def third_anagram?(string1, string2)
    array1 = string1.split("")
    array2 = string2.split("")

    array1.sort == array2.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

# O(n) linear time
# O(1) constant space 
def fourth_anagram?(string1, string2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    string1.each_char { |char| hash1[char] += 1 }
    string2.each_char { |char| hash2[char] += 1 }
    hash1 == hash2
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true



# O(n) linear time
# O(1) constant space (same logic as above)
def fith_anagram?(str1, str2)
    hash = Hash.new(0)
    
    str1.each_char { |char| hash[char] += 1 }
    str2.each_char { |char| hash[char] += 1 }
    
    hash.values.all? { |v| v > 1 }
end

p fith_anagram?("gizmo", "sally")    #=> false
p fith_anagram?("elvis", "lives")    #=> true

