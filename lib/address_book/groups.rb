# Methods to work with groups in address_book
# @author jose paulo martins
module Groups
  include Address_book_requests
  include HTTP

  def group_book_url (candidate, book_id)
    Address_book_requests.default_url + '/' + candidate+ '/' + book_id + '/groups/'
  end

  # @param candidate [String] Owner of the address book
  # @param book_id [String] Id of address book
  # @param properties [String] Hash with parameters to use in create group request
  # @return [Hash] Hash with HTTP Response
  def create_contact_group(candidate, book_id, properties)
    url = group_book_url(candidate, book_id)
    body = Address_book_requests.requests properties
    post url, {body: body}
  end

  # @param candidate [String] Owner of the address book
  # @param book_id [String] Id of address book
  # @param properties [String] Hash with parameters to use in create group request
  # @param group_id [String] Id of the group to update
  # @return [Hash] Hash with HTTP Response
  def change_contact_group(candidate, book_id, properties, group_id)
    url = group_book_url(candidate, book_id) + group_id
    body = Address_book_requests.requests properties
    put url, {body: body}
  end

  # @param candidate [String] Owner of the address book
  # @param book_id [String] Id of address book
  # @param group_id [String] Id of the group to update
  # @return [Hash] Hash with HTTP Response
  def consult_contact_group(candidate, book_id, group_id)
    url = group_book_url(candidate, book_id) + group_id
    get url
  end

  # @param candidate [String] Owner of the address book
  # @param book_id [String] Id of address book
  # @param group_id [String] Id of the group to update
  # @return [Hash] Hash with HTTP Response
  def delete_contact_group(candidate, book_id, group_id)
    url = group_book_url(candidate, book_id) + group_id
    delete url
  end

  extend self

end