require 'mail'

require_relative 'src/spamBlockers/spamBlocker'
require_relative 'src/listener'

class TheServer
  def initialize
    @spamBlocker = SpamBlocker.new();

    @stats_filename = "data/stats.txt"
    @store_location = "data"
    
    @received_count = 0
    @rejected_count = 0
    @fileSize = 0
  end
  
  def update(string_message)

    mail = Mail.read_from_string(string_message)

    puts "Received mail: #{mail.from} #{mail.to}"
    @received_count += 1
    

    if @spamBlocker.should_block?(mail)
      #@fileSize = mail.size
      
      puts("Size #{@fileSize}")
      
      puts "Rejected mail: #{mail.from} #{mail.to}"
      @rejected_count += 1

    else
      puts "Stored mail: #{mail.from} #{mail.to}"

      mail.to.each do |recipient|
        target_dir = File.join(@store_location, recipient)
        Dir.mkdir(target_dir) unless Dir.exist?(target_dir)
        File.write(File.join(target_dir, "#{Time.now.to_i}.eml"), mail.raw_source)
      end

    end
    
    File.open(@stats_filename, "w") do |file|
      file.puts "Received count: #{@received_count}"
      file.puts "Rejected count: #{@rejected_count}"
      file.puts "Rejected volume size: #{@fileSize}"
      file.puts "Spam ratio: #{@rejected_count * 100 / @received_count}%"
    end

  rescue 
    puts $!.message
    puts $!.backtrace
  end


end

port = (ARGV[0] || 3325).to_i
listener = Listener.new(TheServer.new, port)