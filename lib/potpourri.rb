require "potpourri/version"

module Potpourri
  def self.stamp
    time = Time.now.strftime("%Y%m%d%H%M")

    begin
      execute("git tag #{time}")
      execute("git push origin #{time}")

      puts "#{time} was created"
    rescue => error
      STDERR.puts "error [#{error}]"
    end
  end

  private
    def self.execute(command)
      puts "execute [#{command}]"
      raise command unless system(command)
    end
end
