# -*- encoding : utf-8 -*-
require 'httparty'
# Methods to work HTTParty
# @author jose paulo martins
module HTTP
  include Log

  class Request

    attr_accessor :http_response, :last_request, :http_request
    attr_reader :method, :url, :args

    def initialize (method, url, args={})
      @method = method
      @url = url
      @args = {
          headers: default_headers,
          format: :json
      }.recursive_merge args
    end

    def method
      @method
    end

    def url
      @url
    end

    def args
      @args
    end

    def send_request
      Log.debug self
      @http_response = HTTParty.send self.method, self.url, self.args
      @last_request = self
      Log.info "#{@method.to_s.upcase} - URL: #{@url}"
      Log.info "RESPONSE CODE: #{@http_response.code}"
      Log.info "RESPONSE"
      Log.info @http_response if @http_response
      @http_response
    end

    private
    def default_headers
      {}
    end

  end


  def get(url, args={})
    request = Request.new(:get, url, args)
    request.send_request
  end

  def post(url, args={})
    request = Request.new(:post, url, args)
    request.send_request
  end

  def put(url, args={})
    request = Request.new(:put, url, args)
    request.send_request
  end

  def delete(url, args={})
    request = Request.new(:delete, url, args)
    request.send_request
  end

  def repeat_request
    request.send_request(Request.last_request)
  end

end


class Hash

  def recursive_merge(other_hash)
    self.merge(other_hash) do |key, _old, _new|
      _old.is_a?(Hash) ? _old.recursive_merge(_new) : _new
    end
  end

end