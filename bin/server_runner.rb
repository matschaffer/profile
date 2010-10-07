# Base class for implementing server runners
# You _must_ implement your own #server_cmd
class ServerRunner
  def self.run(*args)
    new.run(*args)
  end

  def server_cmd(command)
    raise NotImplementedError, "You must implement server_cmd in your own class"
  end

  def usage
    "#$0 (start|stop)"
  end

  def run_cmd(command)
    if system(server_cmd(command))
      puts "success: server #{command}"
    else
      puts "error: server #{command}"
    end
  end

  def run
    if ARGV[0] =~ /help/i
      puts usage
      exit 0
    end

    run_cmd(ARGV[0])
  end
end
