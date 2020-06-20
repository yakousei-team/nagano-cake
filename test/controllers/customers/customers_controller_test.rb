require 'test_helper'

class Customers::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get customers_customers_edit_url
    assert_response :success
  end

end
