
class SpamBlocker 
    def initialize
        @blockers = [];
    end

    def addBlocker(blocker)
        @blockers.push(blocker);
    end

    def shouldBlock(email) 
        block = false;

        @blockers.each do |blocker|
            block |= blocker.shouldBlock(email);
        end

        return block;
    end
end