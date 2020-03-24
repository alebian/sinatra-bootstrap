require 'yaml'

class Application
  include Singleton

  DEFAULT_SECRETS_FILEPATH = './config/secrets.yml'.freeze
  @@secrets_filepath = DEFAULT_SECRETS_FILEPATH

  attr_reader :logger, :secrets

  def initialize
    load_secrets!
    @logger = Logger.new(logger_file)
  end

  def self.secrets_filepath=(secrets_filepath)
    @@secrets_filepath = secrets_filepath
    instance.send(:load_secrets!)
  end

  def self.logger
    instance.logger
  end

  def self.secrets
    instance.secrets
  end

  private

  def load_secrets!
    load_secrets_from_filepath!
    define_secrets_methods!
  end

  def load_secrets_from_filepath!
    loaded_secrets = YAML.load(preprocess(@@secrets_filepath)) || {}
    @secrets = loaded_secrets.fetch(ENV['RACK_ENV'] || 'development', {})
  end

  def preprocess(path)
    ERB.new(IO.read(path)).result
  end

  def define_secrets_methods! # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    @secrets.each do |key, _|
      if @secrets[key].nil?
        raise UndefinedConstant, "Constant #{key} is missing" unless ENV['PARSER_EDITOR_MODE']
      end

      # This defines the methods for Application.secrets instance
      @secrets.define_singleton_method(key) do
        self[key]
      end
    end
  end

  def logger_file
    if ENV['LOG_TO_FILE'] == 'true'
      file = File.new("logs/#{ENV['RACK_ENV']}.log", 'a+')
      file.sync = true
      file
    else
      STDOUT
    end
  end
end

# Force Configuration to load variables from ENV when required
Application.instance
