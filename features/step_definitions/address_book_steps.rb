# -*- encoding : utf-8 -*-

Given(/^I search all the candidate\'s books$/) do
  Log.debug "Candidate: #{$candidate}"
  @candidate_address_books = Address_book.get_all_address_books_by_candidate $candidate
  Log.info @candidate_address_books
  Log.lwarn 'No address books for candidate.' if @candidate_address_books.nil?

end

Given(/^i remove all the candidate\'s books$/) do
  unless @candidate_address_books.nil?

    @candidate_address_books['value'].each do |hash|
      Log.debug "Remove address book with id #{hash['id']} from candidate #{$candidate}"
      @result = Address_book.delete_address_book $candidate, hash['id']
      Log.info @result
    end
  else
    Log.debug 'No address books no remove...'
  end

end

When(/^i create a address book with characteristics$/) do |table|
  table.hashes.each do |hash|
    result = Address_book.create_address_book $candidate, hash
    @address_book_id = result['value']['id']
    Log.info "Created address book with id #{@address_book_id}"
  end
end

Then(/^i consult the last address book$/) do
  raise 'No address book id defined' if @address_book_id.nil?
  @candidate_address_books = Address_book.get_address_book $candidate, @address_book_id
  Log.info @candidate_address_books
end

Then(/^i remove the last address book$/) do
  raise 'No candidate defined' if $candidate.nil?
  raise 'No address book id defined' if @address_book_id.nil?
  @candidate_address_books = Address_book.delete_address_book $candidate, @address_book_id
end

Then(/^Then the address book does not exists$/) do
  raise 'No previous address book consult was done!' if @result.nil?
  assert_equal(@result.code.to_i, 404)
end

And(/^the candidate will have "([^"]*)" address books$/) do |arg|
  assert_equal(arg.to_i, @candidate_address_books['value'].size.to_i)
end

When(/^i change a address book characteristics to$/) do |table|
  table.hashes.each do |hash|
    @result = Address_book.update_address_book $candidate, hash, @address_book_id
    Log.info "Updated address book with id #{@address_book_id}"
  end
end

And(/^the address book has characteristics$/) do |table|
  @got_address_book = Address_book.get_address_book $candidate, @address_book_id
  @got_address_book = @got_address_book['value']
  Log.info @got_address_book
  table.hashes.each do |hash|
    hash.each do |key, value|
      assert_equal(value, @got_address_book[key], "#{key}: Expected: #{value}, Got: #{@got_address_book[key]}")
    end
  end
end

Then(/^the address book does not exists$/) do
  assert_equal(nil, @candidate_address_books['value'])
end

Given(/^i have a address book$/) do
  assert_equal('Hash', @candidate_address_books['value'].class.to_s)
end