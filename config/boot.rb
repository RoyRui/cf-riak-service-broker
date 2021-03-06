require "yaml"
require "json"

ENV["RACK_ENV"] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

Dir["./lib/**/*.rb"].each { |f| require f }

if File.exists?("config/broker.yml")
  CONFIG = YAML.load(File.read("config/broker.yml"))
else
  $stderr.puts "ERROR: No broker.yml file found in configuration directory."
  exit(1)
end
