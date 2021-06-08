require 'rumbster'

class Listener
    def initialize(server, port)
        rumbster = Rumbster.new(port)
        rumbster.add_observer(server)
        rumbster.start
        rumbster.join
    end
end