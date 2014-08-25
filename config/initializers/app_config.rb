config_path = Rails.root.join('config/app_config.yml')
yaml_config = ERB.new(File.read(config_path)).result
config = YAML.load(yaml_config)
AppConfig.setup!(config)
