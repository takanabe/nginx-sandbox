require 'net/http'

status_count = {}

Signal.trap(:INT){
  puts "SIGINT"
  status_count.each do |k,v|
    puts "status: #{k}, count: #{v}"
  end
  exit(0)
}

loop do
  uri = URI("http://localhost:10080")
  res = Net::HTTP.get_response(uri)
  puts "#{res['X-SANDBOX-ENV']} app,  Status: #{res.code}"
  status_count[res.code] = status_count.key?(res.code) ?  status_count[res.code] + 1 : 1
end
