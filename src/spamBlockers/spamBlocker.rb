
require_relative 'wordsHandler'  
require_relative 'attachmentHandler'  
require_relative 'recipientsHandler'  

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