url = ENV['REDIS_URL']
if url.bank?
  $redis = Redis.new(driver: :hiredis)
else
  $redis = Redis.new(driver: :hiredis, url: url)
end
