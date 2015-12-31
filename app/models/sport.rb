class Sport < FrozenRecord::Base
  self.base_path =  Rails.root.join("config/data")
end
