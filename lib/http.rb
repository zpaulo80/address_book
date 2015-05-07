# -*- encoding : utf-8 -*-
require 'httparty'
# Methods to work HTTParty
# @author jose paulo martins
module HTTP
  include Log

  # Http GET Request
  # @param url [String] target url
  # @param parameters [Hash] request attributes
  # @option parameters [String] :headers request headers (optional)
  # @option parameters [String] :query request query (optional)
  # @return [HTTParty] response
  def get(url, parameters = {:headers => nil, :query => nil})
    @response = HTTParty.get(url, parameters)
    Log.debug "GET:  #{@response.request.path}"
    Log.debug "Response: #{@response.code} HTTP CODE"
    #Log.debug "Response headers: #{@response.headers.inspect}" unless @response.headers.nil?
    @response
  end

  # Http POST Request
  # @param url [String] target url
  # @param parameters [Hash] request attributes
  # @option parameters [String] :body request body (optional)
  # @option parameters [String] :headers request headers (optional)
  # @return [HTTParty] @response
  def post(url, parameters = {:body => nil, :headers => nil})
    Log.debug "POST:  #{url}"
    Log.debug "Headers: #{parameters[:headers].inspect}"
    Log.debug "Body: #{parameters[:body]}" unless parameters[:body].nil?

    @response = HTTParty.post(url, parameters)
    Log.debug "Response: #{@response.code} HTTP CODE"
    #Log.debug "Response headers: #{@response.headers.inspect}" unless @response.headers.nil?
    @response
  end

  # Http PUT Request
  # @param url [String] target url
  # @param parameters [Hash] request attributes
  # @option parameters [String] :body request body (optional)
  # @option parameters [String] :headers request headers (optional)
  # @return [HTTParty] @response
  def put(url, parameters = {:body => nil, :headers => nil})
    Log.debug "PUT:  #{url}"
    Log.debug "Headers: #{parameters[:headers].inspect}"
    Log.debug "Body: #{parameters[:body]}" unless parameters[:body].nil?
    @response = HTTParty.put(url, parameters)
    Log.debug "Response: #{@response.code} HTTP CODE"
    #Log.debug "Response headers: #{@response.headers.inspect}" unless @response.headers.nil?
    @response
  end

  # Http DELETE Request
  # @param url [String] target url
  # @param parameters [Hash] request attributes
  # @option parameters [String] :headers request headers (optional)
  # @return [HTTParty] @response
  def delete(url, parameters = {:headers => nil})
    Log.debug "DELETE:  #{url}"
    Log.debug "Headers: #{parameters[:headers].inspect}"
    @response = HTTParty.delete(url, parameters)
    Log.debug "Response: #{@response.code} HTTP CODE"
    @response
  end

  extend self
end
