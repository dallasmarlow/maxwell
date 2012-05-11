require 'pathname'

module Maxwell
  class Daemon < Base

    def running?
      pid = Pathname.new config[:pid]

      case
      when pid.exist? && ! pid.read.empty? && pid.read.to_i != 0
        Process.getpgid pid.read.to_i rescue false
      else
        false
      end
    end

    def start &block
      log.info "starting service: #{config[:name]}"

      case
      when running?
        message = "service: #{config[:name]} appears to already be running"
        log.error message
          abort message
        when config[:daemonize]
          daemonize &block
        else
          run &block
        end
      end

      def daemonize &block
        log.info "daemonizing service: #{config[:name]}"
        Process.daemon

        run &block
      end

      def run &block
        File.open(config[:pid], 'w') {|file| file.write $$}

        loop do
          yield block
        end
      end

  end
end