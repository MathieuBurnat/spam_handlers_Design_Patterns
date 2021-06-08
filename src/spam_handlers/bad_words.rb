module SpamHandlers
  class BadWords
    def initialize(config)
      @bad_words = File.readlines(config['words_list_path'], chomp: true)
      @bad_words_regexp = Regexp.new(@bad_words.join('|'))
    end
    
    def should_block?(mail)
      mail.body.match(@bad_words_regexp)
    end
  end
end
