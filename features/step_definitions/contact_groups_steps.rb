When(/^a create a group with characteristics$/) do |table|
  table.hashes.each do |hash|
    Log.debug hash
    @group = Groups.create_contact_group $candidate, @address_book_id, hash
    @last_group_id = hash['id']
    Log.info @group
  end
end

Then(/^my address book have "([^"]*)" group$/) do |num_of_groups|
  assert_equal(num_of_groups.to_i, @candidate_address_books['value']['groups'].size.to_i)
end

And(/^the group with id "([^"]*)" have characteristics$/) do |id, table|
  @got_address_book = Address_book.get_address_book $candidate, @address_book_id
  @got_address_book_group = @got_address_book['value']['groups']
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
  @group = Groups.consult_contact_group $candidate, @address_book_id, @last_group_id
  Log.info @group
end

When(/^i remove the last created group$/) do
  @group = Groups.delete_contact_group $candidate, @address_book_id, @last_group_id
  Log.info @group
end

Then(/^the group does not exist$/) do
  assert_equal(nil, @group['value'])
end

When(/^i change a group to$/) do |table|
  table.hashes.each do |hash|
    Log.debug hash
    @group = Groups.change_contact_group $candidate, @address_book_id, hash, hash['id']
    @last_group_id = hash['id']
    Log.info @group
  end
end


And(/^the group have characteristics$/) do |table|
  table.hashes.each do |hash|
    hash.each do |key, value|
      assert_equal(value, @group['value'][key], "#{key}: Expected: #{value}, Got: #{@group['value'][key]}")
    end
  end
end