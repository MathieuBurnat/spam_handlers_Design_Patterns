module SpamHandlers
  class RecipientWhitelist
    def initialize(config)
      @white_regexp = Regexp.new(config['white_regexp'])
    end
    
    def should_block?(mail)
      mail.destinations.none? {|destination| @white_regexp.match(destination) }
    end
  end
end
