if Rails.env.development?
  Spring.watch_method = :listen
end
