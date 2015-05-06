When(/^i create a contact with characteristics$/) do |table|
  table.hashes.each do |hash|
    Log.debug hash
    @contact = Contacts.create_contact $candidate, @address_book_id, hash
    Log.info @contact
  end
end

When(/^i change a contact with characteristics$/) do |table|
  table.hashes.each do |hash|
    Log.debug hash
    @contact = Contacts.update_contact $candidate, @address_book_id, hash, hash['name']
    Log.info @contact
  end
end

When(/^i consult the contact "([^"]*)"$/) do |name|
  @contact = Contacts.consult_contact $candidate, @address_book_id, name
  Log.info @contact
end

Then(/^the contact have characteristics$/) do |table|
  table.hashes.each do |hash|
    hash.each do |key, value|
      assert_equal(value, @contact['value'][key], "#{key}: Expected: #{value}, Got: #{@contact['value'][key]}")
    end
  end
end

When(/^i delete the contact with name "([^"]*)"$/) do |name|
  @contact = Contacts.delete_contact $candidate, @address_book_id, name
  Log.info @contact
end

And(/^the address book does not have contacts$/) do
  Log.debug "Address book contacts list size: #{@candidate_address_books['value']['contacts'].size}"
  assert_equal(0, @candidate_address_books['value']['contacts'].size, 'No contacts expected in address book')
end

Then(/^the address book have "([^"]*)" contacts$/) do |size|
  Log.debug "Address book contacts list size: #{@candidate_address_books['value']['contacts'].size}"
  assert_equal(size.to_i, @candidate_address_books['value']['contacts'].size.to_i, 'No contacts expected in address book')
end