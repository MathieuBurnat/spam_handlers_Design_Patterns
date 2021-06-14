class RecipientsHandler
    def initialize(config)
        @white_regexp = Regexp.new(config['white_regexp'])
    end
      
    def shouldBlock(mail)
    mail.destinations.none? {|destination| @white_regexp.match(destination) }
    end
end