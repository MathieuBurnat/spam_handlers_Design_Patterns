class SpamBlocker 
    def initialize
        @wordsHandler = WordsHandler.new();
        @attachmentHandler = AttachmentHandler.new();
        @recipientsHandler = RecipientsHandler.new();
    end

    def boolean shouldBlock(EMail email) 
        block = false;

        block |= @wordsHandler.shouldBlock(email);
        block |= @attachmentHandler.shouldBlock(email);
        block |= @recipientsHandler.shouldBlock(email);
        
        return block;
    end
end