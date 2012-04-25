require 'yaml'
require 'logger'
require 'defaults'

module Maxwell
  class James

    attr_accessor :config, :options

    def initialize config = nil
      # merge user defined config with defaults
      @config  = Maxwell::Defaults.config.merge configure(config)  || {}
      # merge user defined options with defaults
      @options = Maxwell::Defaults.options.merge @config[:options] || {}
    end

    def configure config
      unless config.nil?
      	# parse user supplied config and store the location for later.
        YAML.load_file(config).merge({config_file: config})
      end rescue abort "ERROR: unable to load config file: #{config}"
    end

    def log
      unless @log
        @log = Logger.new config[:log], config[:log_retention]
        @log.level = config[:log_level]
      end
      @log
    end
  
  end
end