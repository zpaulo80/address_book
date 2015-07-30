When(/^i create a group with characteristics$/) do |table|
  table.hashes.each do |hash|
    Log.debug hash
    @response = Groups.create_contact_group $candidate, @address_book_id, hash
    @last_group_id = hash['id']
  end
end

Then(/^my address book have "([^"]*)" groups$/) do |num_of_groups|
  assert_equal(num_of_groups.to_i, @response['value']['groups'].size.to_i)
end

And(/^the group with id "([^"]*)" have characteristics$/) do |id, table|
  @response = Address_book.get_address_book $candidate, @address_book_id
  @got_address_book_group = @response['value']['groups']
  Log.info @got_address_book_group
  table.hashes.each do |hash|
    hash.each do |key, value|
      @got_address_book_group.each do |group|
        if group['id'].to_s == id.to_s
          assert_equal(group[key], value, "#{key}: Expected: #{group[key]}, Got: #{value}")
        end
      end
    end
  end
end

When(/^i consult the last (created|updated) group$/) do |action|
  @response = Groups.consult_contact_group $candidate, @address_book_id, @last_group_id
end

When(/^i remove the last created group$/) do
  @response = Groups.delete_contact_group $candidate, @address_book_id, @last_group_id
end

Then(/^the group does not exist$/) do
  assert_equal(nil, @response['value'])
end

When(/^i change a group to$/) do |table|
  table.hashes.each do |hash|
    Log.debug hash
    @response = Groups.change_contact_group $candidate, @address_book_id, hash, hash['id']
    @last_group_id = hash['id']
  end
end


And(/^the group have characteristics$/) do |table|
  table.hashes.each do |hash|
    hash.each do |key, value|
      assert_equal(value, @response['value'][key], "#{key}: Expected: #{value}, Got: #{@response['value'][key]}")
    end
  end
end