require "test_helper"

class Api::V1::JournalsControllerTest < ActionDispatch::IntegrationTest
  test "should get task:string" do
    get api_v1_journals_task:string_url
    assert_response :success
  end

  test "should get category:string" do
    get api_v1_journals_category:string_url
    assert_response :success
  end

  test "should get date:date" do
    get api_v1_journals_date:date_url
    assert_response :success
  end

  test "should get id:integer" do
    get api_v1_journals_id:integer_url
    assert_response :success
  end
end
