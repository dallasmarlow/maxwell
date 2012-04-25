module Maxwell
  module Defaults

    def self.config
      @config ||= {
        # process settings
        pid: "/var/run/#{self.class}/#{self.class}.pid",
        daemonize: true,
        interval: 0, #seconds

        # log settings
        log: "/var/log/#{self.class}/#{self.class}.log",
        log_level: Logger::DEBUG,
        log_retention: 'weekly',
      }
    end

    def self.options
      @options ||= {}
    end

  end
end
