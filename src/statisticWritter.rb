class StatisticWritter

    def initialize(file)
        @file = file
    end

    def makeStatistics(received_count, rejected_count, fileSize)
        File.open(@file, "w") do |line|
            line.puts "Received count: #{received_count}"
            line.puts "Rejected count: #{rejected_count}"
            line.puts "Rejected volume size: #{fileSize}"
            line.puts "Spam ratio: #{rejected_count * 100 / received_count}%"
          end
    end
end