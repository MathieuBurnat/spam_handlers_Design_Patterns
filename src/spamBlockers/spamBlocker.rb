
require_relative '../spamBlockers/wordsHandler.rb'
require_relative '../spamBlockers/attachmentHandler.rb'
require_relative '../spamBlockers/recipientsHandler.rb'


class SpamBlocker 
    def initialize
        @wordsHandler = WordsHandler.new();
        @attachmentHandler = AttachmentHandler.new();
        @recipientsHandler = RecipientsHandler.new();
    end

    def shouldBlock(email) 
        block = false;

        block |= @wordsHandler.shouldBlock(email);
        block |= @attachmentHandler.shouldBlock(email);
        block |= @recipientsHandler.shouldBlock(email);
        
        return block;
    end
end