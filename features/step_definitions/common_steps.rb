# -*- encoding : utf-8 -*-

Then(/^the operation has success$/) do
  raise 'No previous address book consult was done!' if @response.nil?
  Log.info "HTTP CODE: Expected: 200, Got: #{@response.code.to_i}"
  assert_equal(200, @response.code.to_i)

  Log.info "success: Expected: true, Got: #{@response['success']}"
  assert_equal(true, @response['success'])
end

And(/^the operation returns code "([^"]*)"$/) do |code|
  raise 'No previous address book consult was done!' if @response.nil?
  Log.info "HTTP CODE: Expected: #{code}, Got: #{@response.code.to_i}"
  assert_equal(code, @response.code.to_i)
end

Then(/^the operation have no success$/) do
  Log.info "HTTP CODE: Expected: 200, Got: #{@response.code.to_i}"
  assert_equal(200, @response.code.to_i)

  Log.info "success: Expected: true, Got: #{@response['success']}"
  assert_equal(false, @response['success'])
end