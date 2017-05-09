class Rack::Attack
  # Throttle all requests by IP (180rpm) excluding assets
  throttle('req/ip', :limit => 900, :period => 5.minutes) do |req|
    req.ip unless req.path.start_with?('/assets')
  end

  # Throttle POST requests to /login by IP address
  throttle('logins/ip', :limit => 5, :period => 10.seconds) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.ip
    end
  end

  # Throttle POST requests to /login by email param
  throttle("sign_in/account", :limit => 5, :period => 10.seconds) do |req|
    if req.path == '/users/sign_in' && req.post?
      # return the email if present, nil otherwise
      req.params['login'].presence
    end
  end

  # Throttle POST requests to new content by IP
  throttle("new_content", :limit => 60, :period => 3.minutes) do |req|
    if req.post? &&
        (req.path == '/merge_reports' ||
            req.path == '/smash_reports' ||
            req.path == '/smash_settings')
      req.ip
    end
  end

  # Throttle dictionary requests
  throttle("dictionaries", :limit => 5, :period => 5.minutes) do |req|
    if req.path.end_with?('dictionary.txt')
      req.ip
    end
  end

  ### Custom Throttle Response ###
  self.throttled_response = lambda do |env|
    # respond 304 not modified for throttles where we want to force caching
    # if env['rack.attack.matched'] == 'tags_index'
    #   status = 304
    # respond 503 service unavailable if it looks like a DDOS attack
    if env['rack.attack.matched'] == 'req/ip'
      status = 503
    else
      status = 429
    end

    # response
    [ status,  # status
        {},   # headers
        ['']] # body
  end
end