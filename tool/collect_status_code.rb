require 'net/http'

status_count = {}

Signal.trap(:INT){
  puts "SIGINT"
  exit(0)
}

loop do
  uri = URI("http://localhost:10080")
  res = Net::HTTP.get_response(uri)
  puts "Status: #{res.code}"
  status_count[res.code] = status_count.key?(res.code) ?  status_count[res.code] + 1 : 1
end


