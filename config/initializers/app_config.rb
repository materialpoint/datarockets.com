config_path = Rails.root.join('config/app_config.yml')

# heroku loads environment during deployment but config/app_config.yml doesn't exitst.
unless File.exist?(config_path)
  config_path = Rails.root.join('config/examples/app_config.yml')
end

yaml_config = ERB.new(File.read(config_path)).result
config = YAML.load(yaml_config)
AppConfig.setup!(config)
