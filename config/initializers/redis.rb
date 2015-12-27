url = ENV['REDIS_URL']
if url.blank?
  $redis = Redis.new(driver: :hiredis)
else
  $redis = Redis.new(driver: :hiredis, url: url)
end
