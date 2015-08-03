# Methods to work with address_book
# @author jose paulo martins
module Address_book
  include Address_book_requests
  include HTTP

  def address_book_url (candidate)
    Address_book_requests.default_url + '/' + candidate
  end

  # @param candidate [String] Owner of the address book
  # @param properties [String] Hash with parameters to use in create address book request
  # @return [Hash] Hash with HTTP Response
  def create_address_book(candidate, properties)
    url = address_book_url candidate
    body = Address_book_requests.requests properties
    post url, {body: body, headers: Address_book_requests.default_headers}
  end

  # @param candidate [String] Owner of the address book
  # @param properties [String] Hash with parameters to use in create address book request
  # @param id [String] Id of address book
  # @return [Hash] Hash with HTTP Response
  def update_address_book(candidate, properties, id)
    url = (address_book_url candidate) + '/' + id
    body = Address_book_requests.requests properties
    put url, {body: body, headers: Address_book_requests.default_headers}
  end

  # @param candidate [String] Owner of the address book
  # @param id [String] Id of address book
  # @return [Hash] Hash with HTTP Response
  def get_address_book(candidate, id)
    url = (address_book_url candidate) + '/' + id
    get url, {headers: Address_book_requests.default_headers}
  end

  # @param candidate [String] Owner of the address book
  # @return [Hash] Hash with HTTP Response
  def get_addr_books_by_candidate(candidate)
    url = (address_book_url candidate)
    get url, {headers: Address_book_requests.default_headers}
  end

  # @param candidate [String] Owner of the address book
  # @param id [String] Id of address book
  # @return [Hash] Hash with HTTP Response
  def delete_address_book(candidate, id)
    url = (address_book_url candidate) + '/' + id
    delete url, {headers: Address_book_requests.default_headers}
  end

  extend self
end