# Methods to work with address_book
# @author jose paulo martins
module Address_book
  include Address_book_requests
  include HTTP

  # @param candidate [String] Owner of the address book
  # @param properties [String] Hash with parameters to use in create address book request
  # @return [Hash] Hash with HTTP Response
  def create_address_book(candidate, properties)
    url = Address_book_requests.default_url + '/' + candidate
    body = Address_book_requests.requests properties
    @response = (post url, {:body => body, :headers => Address_book_requests.default_headers})
  end

  # @param candidate [String] Owner of the address book
  # @param properties [String] Hash with parameters to use in create address book request
  # @param id [String] Id of address book
  # @return [Hash] Hash with HTTP Response
  def update_address_book(candidate, properties, id)
    url = Address_book_requests.default_url + '/' + candidate + '/' + id
    body = Address_book_requests.requests properties
    @response = (put url, {:body => body, :headers => Address_book_requests.default_headers})
  end

  # @param candidate [String] Owner of the address book
  # @param id [String] Id of address book
  # @return [Hash] Hash with HTTP Response
  def get_address_book(candidate, id)
    url = Address_book_requests.default_url + '/' + candidate + '/' + id
    get url, {:headers => Address_book_requests.default_headers}
  end

  # @param candidate [String] Owner of the address book
  # @return [Hash] Hash with HTTP Response
  def get_all_address_books_by_candidate(candidate)
    url = Address_book_requests.default_url + '/' + candidate
    @response = (get url, {:headers => Address_book_requests.default_headers})
  end

  # @param candidate [String] Owner of the address book
  # @param id [String] Id of address book
  # @return [Hash] Hash with HTTP Response
  def delete_address_book(candidate, id)
    url = Address_book_requests.default_url + '/' + candidate + '/' + id
    delete url, {:headers => Address_book_requests.default_headers}
  end
  extend self
end