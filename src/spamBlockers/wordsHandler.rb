require_relative 'src/spam_handlers/bad_words'

class WordsHandler
    def initialize
        @bad_words_handler = SpamHandlers::BadWords.new({'words_list_path' => "bad_words_list.txt"})
    end

    def shouldBlock(email) 
        return @bad_words_handler.should_block?(mail);
    end
end