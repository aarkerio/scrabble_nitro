
# TO SEE THE RESULTS PLEASE EXECUTE

## Challenge #1:

Given a config file (config.txt):

1)parse the configuration file using only the ruby standard library (no gems).

2) Parse the configuration items into a Hash.

3) Hash values should use the appropriate native Ruby data types. For example ‘debug_mode=off' would return in the hash,  'debug_mode: false'

Answer:

   $ ruby pars_config.rb

## Challenge #2:

1) Use the Twitter streaming API (statuses/sample) to collect 5 minutes of tweets.

2) Obtain a total word count, filter out "stop words" (words like "and", "the", "me", etc -- useless words), and present the 10 most frequent words in those 5 minutes of tweets.

3) Implement it so that if you had to stop the program and restart, it will pick up from the total word counts that you started from.

Answer:
   $ ruby ruby_tweets.rb

## Challenge #3:

Input: Given an array of integers
Output: Output each integer in the array and all the other integers in the array that are factors of the first integer.

Example:

Given an array of [10, 5, 2, 20], the output would be:
    { 10: [5, 2], 5: [], 2: [], 20: [10,5,2] }


Answer:

    $ ruby factors.rb



Thanks!

--manuel montoya




