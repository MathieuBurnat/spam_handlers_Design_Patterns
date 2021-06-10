require_relative 'src/spam_handlers/recipient_whitelist'

class RecipientsHandler
    def initialize
        @recipient_whitelist_handler = SpamHandlers::RecipientWhitelist.new({'white_regexp' => "@(cpnv.ch|vd.ch)$"})
    end

    def shouldBlock(email) 
        return @recipient_whitelist_handler.should_block?(mail);
    end
end