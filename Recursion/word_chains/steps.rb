Word Chains

Phase 1: Adjacent words

1. Create class WordChainer
2. Initialize method should accept a dictionary file name. The instance variable @dictionary should readlines the file.
3. Create a helper method called adjacent_words(word). This should return all words in the dictionary one letter different than the current word. By "one letter different" we mean that both words have the same length and only differ at one position, e.g. "mat" and "cat" count as adjacent words, but "cat" and "cats" do not, nor do "cola" and "cool".

Verify that your adjacent_words method is working.

Hint: To speed up the search use Set to store your dictionary.

Phase 2: Exploring all words

#run(source, target) method
Our strategy is:
  => Keep a list of @current_words. Start this with just [source].
  => Also keep a list of @all_seen_words. Start this with just [source].
  => Begin an outer loop which will run as long as @current_words is not empty. This will halt our exploration when all words adjacent to @current_word have veen discovered.
  => Inside the loop, create a new, empty list of new_current_words. We are going to fill this up with new words(that arent in @all_seen_words) that are adjacent(one step away) from a word in @current_words.
  => To fill up new_current_words, begin a second, inner loop through @current_words.
  => For each current_word, begin a third loop, iterating through all adjacent_words(current_word). This is a triply nested loop.
    => For each adjacent_word, skip it if its already in @all_seen_words; we dont need to reconsider a word we have seen before.
    => Otherwise, if its a new word, add it to both new_current_words, and @all_seen_words so we dont repeat it.
    => After we finish looping through all the @current_words, print out new_current_words, and reset @current_words to new_current_words.

Make sure your "#run" method eventually terminates: it should eventually enumerate all the words that are reachable from source, at which point new_current_words will come out empty. After setting @current_words = new_current_words the outermost loop should terminate.

After executing \run\, @all_seen_words will contain a list of all the words encountered in our 'exploration'.

Test your word chainer to make sure it outputs (1) first the words that are one letter away from source, (2) next words that are one letter away from words one letter away from source (i.e two letter away from source), etc. This is a breadth first enumeration of words that you can reach from teh source.

Phase 2b: Refactor

Your code will contain a triply nested loop. Break out the inner loop that iterates through @current_words and builds and assigns the new_current_words to its own method: '#explore_current_words'.

Phase 3: Keep Track of Prior Words

Trans@form @all_seen_words to a hash where the keys are new words and the value is the word we modified to get to the new word.

Start @all_seen_words as { source => nil }, since 'source' didn't' come from anywhere. Lets modify 'explore_current_words' so that instead of merely adding an adjacent_word to the array, we record it as the key, where the value is the current_word we came from.

Modify explore_current_words to print not just the new words but where they came from. At the end of explore_current_words, iterate through new_current_words, and print out the new word and the word it came from(the value in the @all_seen_words hashh). Make sure this output makes sense. You may want to use a longer word like "market" to reduce the verbosity of the output.

Phase 4: Backtracking

Write a method called "#build_path(target)". It should look up the target in @all_seen_words. This is the word we were at before the final step to target. Then we need to look up the word we used to get the second to last word. Then the word before that. Keep looking back and back in from target in @all_seen_words. Each time, add the prior word to an array named 'path'. Eventually you will reach nil, which means we have reached the end of the path back to source.

Have '#run' call '#build_path' to return the array.