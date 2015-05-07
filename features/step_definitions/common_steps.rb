# -*- encoding : utf-8 -*-

Then(/^the operation has success$/) do
  raise 'No previous address book consult was done!' if @candidate_address_books.nil?
  Log.info "HTTP CODE: Expected: 200, Got: #{@candidate_address_books.code.to_i}"
  assert_equal(200, @candidate_address_books.code.to_i)

  Log.info "success: Expected: true, Got: #{@candidate_address_books['success']}"
  assert_equal(true, @candidate_address_books['success'])
end

And(/^the operation returns code "([^"]*)"$/) do |code|
  raise 'No previous address book consult was done!' if @candidate_address_books.nil?
  Log.info "HTTP CODE: Expected: #{code}, Got: #{@candidate_address_books.code.to_i}"
  assert_equal(code, @candidate_address_books.code.to_i)
end