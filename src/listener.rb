require 'rumbster'

class Listener

    def initialize(serveur)
        port = (ARGV[0] || 3325).to_i

        rumbster = Rumbster.new(port)
        rumbster.add_observer(TheServer.new)
        rumbster.start
        rumbster.join
    end
end