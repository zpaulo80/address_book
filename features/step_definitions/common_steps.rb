# -*- encoding : utf-8 -*-

Then(/^the operation has success$/) do
  raise 'No previous address book consult was done!' if @candidate_address_books.nil?
  Log.info "HTTP CODE: Expected: 200, Got: #{@candidate_address_books.code.to_i}"
  assert_equal(@candidate_address_books.code.to_i, 200)
end