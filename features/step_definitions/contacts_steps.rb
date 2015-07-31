When(/^i create a contact with characteristics$/) do |table|
  table.hashes.each do |hash|
    Log.debug hash
    @contact = Contacts.create_contact $test_run.config['settings']['candidate'], @address_book_id, hash
  end
end

When(/^i change a contact with characteristics$/) do |table|
  table.hashes.each do |hash|
    Log.debug hash
    @contact = Contacts.update_contact $test_run.config['settings']['candidate'], @address_book_id, hash, hash['name']
  end
end

When(/^i consult the contact "([^"]*)"$/) do |name|
  @contact = Contacts.consult_contact $test_run.config['settings']['candidate'], @address_book_id, name
end

Then(/^the contact have characteristics$/) do |table|
  table.hashes.each do |hash|
    hash.each do |key, value|
      assert_equal(value, @contact['value'][key], "#{key}: Expected: #{value}, Got: #{@contact['value'][key]}")
    end
  end
end

When(/^i delete the contact with name "([^"]*)"$/) do |name|
  @contact = Contacts.delete_contact $test_run.config['settings']['candidate'], @address_book_id, name
end

And(/^the address book does not have contacts$/) do
  Log.debug "Address book contacts list size: #{@response['value']['contacts'].size}"
  assert_equal(0, @response['value']['contacts'].size, 'No contacts expected in address book')
end

Then(/^the address book have "([^"]*)" contacts$/) do |size|
  Log.debug "Address book contacts list size: #{@response['value']['contacts'].size}"
  assert_equal(size.to_i, @response['value']['contacts'].size.to_i, 'No contacts expected in address book')
end