# Methods to work with contacts in address_book
# @author jose paulo martins
module Contacts
  include Address_book_requests
  include HTTP

  # @param candidate [String] Owner of the address book
  # @param book_id [String] Id of address book
  # @param properties [String] Hash with parameters to use in create contact request
  # @return [Hash] Hash with HTTP Response
  def create_contact(candidate, book_id, properties)
    url = Address_book_requests.default_url + '/' + candidate + '/' + book_id + '/contacts/'
    body = Address_book_requests.requests properties
    post url, {:body => body}
  end

  # @param candidate [String] Owner of the address book
  # @param book_id [String] Id of address book
  # @param properties [String] Hash with parameters to use in create contact request
  # @param name [String] Contact name to update
  # @return [Hash] Hash with HTTP Response
  def update_contact(candidate, book_id, properties, name)
    url = Address_book_requests.default_url + '/' + candidate + '/' + book_id + '/contacts/' + name
    body = Address_book_requests.requests properties
    put url, {:body => body}
  end

  # @param candidate [String] Owner of the address book
  # @param book_id [String] Id of address book
  # @param name [String] Contact name to update
  # @return [Hash] Hash with HTTP Response
  def consult_contact(candidate, book_id, name)
    url = Address_book_requests.default_url + '/' + candidate + '/' + book_id + '/contacts/' + name
    get url
  end

  # @param candidate [String] Owner of the address book
  # @param book_id [String] Id of address book
  # @param name [String] Contact name to update
  # @return [Hash] Hash with HTTP Response
  def delete_contact(candidate, book_id, name)
    url = Address_book_requests.default_url + '/' + candidate + '/' + book_id + '/contacts/' + name
    delete url
  end

  extend self

end