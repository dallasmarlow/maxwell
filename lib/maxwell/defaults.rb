require 'logger'

module Maxwell
  module Defaults

    def self.config
      @config ||= {
        # process settings
        name: self.class,
        pid: "/var/run/#{self.class}.pid",
        daemonize: true,
        interval: 0, #seconds

        # log settings
        log: "/var/log/#{self.class}.log",
        log_level: Logger::INFO,
        log_retention: 'weekly',
      }
    end

  end
end
