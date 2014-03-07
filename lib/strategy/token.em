class Em.Auth.TokenAuthStrategy extends Em.Auth.AuthStrategy
  init: ->
    @auth.reopen
      authToken: Em.computed.alias '_strategy.authToken'
      userName: Em.computed.alias '_strategy.userName'

  # @property [string|null] the auth token, if signed in; otherwise null
  authToken: null
  
  # @property [string|null] the user name, if signed in; otherwise null
  userName: null

  serialize: (opts) ->
    return opts unless @auth.signedIn

    switch @auth.tokenLocation
      when 'param'
        opts.data ||= {}
        if FormData? && opts.data instanceof FormData
          opts.data.append @auth.tokenKey, @authToken, @auth.userKey, @userName
        else
          opts.data[@auth.tokenKey] ||= @authToken
          opts.data[@auth.userKey] ||= @userName
      when 'authHeader'
        opts.headers ||= {}
        opts.headers.Authorization ||= "ApiKey #{@userName}:#{@authToken}"
      when 'customHeader'
        opts.headers ||= {}
        opts.headers[@auth.tokenHeaderKey] ||= @authToken

    return opts

  deserialize: (data) ->
    @authToken            = data[@auth.tokenKey]
    @auth._session.userId = data[@auth.tokenIdKey] if @auth.tokenIdKey
