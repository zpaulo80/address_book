module Groups
  include Address_book_requests
  include HTTP

  def create_contact_group(candidate, book_id, properties)
    url = Address_book_requests.default_url + '/' + candidate + '/' + book_id + '/groups/'
    body = Address_book_requests.requests properties
    @response = (post url, {body: body, headers: Address_book_requests.default_headers})
  end

  def change_contact_group(candidate, book_id, properties, group_id)
    url = Address_book_requests.default_url + '/' + candidate + '/' + book_id + '/groups/'+ group_id
    body = Address_book_requests.requests properties
    @response = (put url, {body: body, headers: Address_book_requests.default_headers})
  end

  def consult_contact_group(candidate, book_id, group_id)
    url = Address_book_requests.default_url + '/' + candidate + '/' + book_id + '/groups/'+ group_id
    @response = (get url, {headers: Address_book_requests.default_headers})
  end

  def delete_contact_group(candidate, book_id, group_id)
    url = Address_book_requests.default_url + '/' + candidate + '/' + book_id + '/groups/'+ group_id
    @response = (delete url, {headers: Address_book_requests.default_headers})
  end

  extend self

end