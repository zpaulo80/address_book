# Generic methods to requests
# @author jose paulo martins
module Address_book_requests
  include Log
  require 'json'

  # @return [String] application base url
  def default_url
    (URI::HTTP.build host: 'qa-addressbook.herokuapp.com').to_s
  end

  # @return [Hash] Hash of headers request
  def default_headers
    headers = {'Content-type' => 'application/json'}
    Log.debug headers
    headers
  end

  # @param hash [Hash] Hash with parameters to use in create address book request
  # @return [JSON] Request in json format
  def requests hash
    request = ::JSON.generate(hash)
    return request
  end

  extend self
end