require 'net/http'

status_count = {}
port = ENV.fetch("NGINX_PORT", "10080")

Signal.trap(:INT){
  puts "SIGINT"
  status_count.each do |k,v|
    puts "Total: status: #{k}, count: #{v}"
  end
  exit(0)
}

loop do
  begin
    uri = URI("http://localhost:#{port}")
    res = Net::HTTP.get_response(uri)

    puts "#{Time.now } #{res['X-SANDBOX-ENV']} app,  Status: #{res.code}"
    status_count[res.code] = status_count.key?(res.code) ?  status_count[res.code] + 1 : 1
  rescue Exception => msg
    puts "error msg: #{msg}"
  end
end
