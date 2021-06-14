class MailObserver
    def initialize(stats_filename)
        @stats_filename = stats_filename;

        @received_count = 0;   
        @rejected_count = 0;
        @fileSize = 0
    end

    def addReceived(mail)
        puts "Received mail: #{mail.from} #{mail.to}";
        @received_count += 1;
        createStatistics();
    end

    def addRejected(mail, filesize)
        @filesize = filesize;
        puts("Volume : #{fileSize}");

        puts "Rejected mail: #{mail.from} #{mail.to}"
        @rejected_count += 1
        createStatistics();
    end

    def addStored(mail)
        puts "Stored mail: #{mail.from} #{mail.to}"
        createStatistics();
    end

    def createStatistics
        #File.open(@stats_filename, "w") do |line|
        #    line.puts "Received count: #{@received_count}"
        #    line.puts "Rejected count: #{@rejected_count}"
        #    line.puts "Rejected volume size: #{@fileSize}"
        #    line.puts "Spam ratio: #{@rejected_count * 100 / @received_count}%"
        #end
    end
end