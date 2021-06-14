
class SpamBlocker 
    def initialize
        @blockers = [];
    end

    def addBlocker(blocker){
        @blockers.push(blocker);
    }

    def shouldBlock(email) 
        shouldBlock = false;

        @blockers.each do |blocker|
            shouldBlock |= blocker.shouldBlock(email);
          end

        return shouldBlock;
    end
end