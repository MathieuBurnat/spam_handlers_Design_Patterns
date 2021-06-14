require 'mail'

require_relative 'src/spamBlockers/spamBlocker'
require_relative 'src/spamBlockers/attachmentHandler'
require_relative 'src/spamBlockers/recipientsHandler'
require_relative 'src/spamBlockers/wordsHandler'
require_relative 'src/mailObserver'

require_relative 'src/listener'

@stats_filename = "data/stats.txt"

class TheServer
  def initialize
    @spamBlocker = SpamBlocker.new();
    @spamBlocker.addBlocker(RecipientsHandler.new({'white_regexp' => "@(cpnv.ch|vd.ch)$"}))
    @spamBlocker.addBlocker(AttachmentHandler.new())
    @spamBlocker.addBlocker(WordsHandler.new({'words_list_path' => "bad_words_list.txt"}))

    @mailObserver = MailObserver.new(@stats_filename);
    @store_location = "data"
  end
  
  def update(string_message)
    mail = Mail.read_from_string(string_message)
    @mailObserver.addReceived(mail)

    if @spamBlocker.shouldBlock(mail)
      @mailObserver.addRejected(mail, string_message.bytesize)
    else
      @mailObserver.addStored(mail)
      mail.to.each do |recipient|
        target_dir = File.join(@store_location, recipient)
        Dir.mkdir(target_dir) unless Dir.exist?(target_dir)
        File.write(File.join(target_dir, "#{Time.now.to_i}.eml"), mail.raw_source)
      end
    end

  rescue 
    puts $!.message
    puts $!.backtrace
  end
end

port = (ARGV[0] || 3325).to_i
listener = Listener.new(TheServer.new, port)