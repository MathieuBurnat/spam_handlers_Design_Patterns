class MailObserver
    def initialize
        @received_count = 0;   
        @rejected_count = 0;
    end

    def addReceived(mail)
        puts "Received mail: #{mail.from} #{mail.to}";
        @received_count += 1;
    end

    def addRejected(mail)
        puts("Size #{@fileSize}");

        puts "Rejected mail: #{mail.from} #{mail.to}"
        @rejected_count += 1
    end

    def addStored(mail)
        puts "Stored mail: #{mail.from} #{mail.to}"
    end
end