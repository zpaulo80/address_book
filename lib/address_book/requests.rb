# Generic methods to requests
# @author jose paulo martins
module Address_book_requests
  include Log
  require 'json'

  # @return [String] application base url
  def default_url
    URI::HTTP.build(host: $test_run.config['hosts']['server']['ip']).to_s
  end

  # @return [Hash] Hash of headers request
  def default_headers
    {'Content-type' => 'application/json'}
  end

  # @param hash [Hash] Hash with parameters to use in create address book request
  # @return [JSON] Request in json format
  def requests (hash)
    ::JSON.generate(hash)
  end

  extend self
end