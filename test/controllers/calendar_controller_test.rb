require "test_helper"

class CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calendar_index_url
    assert_response :success
  end

  test "should get year" do
    get calendar_year_url
    assert_response :success
  end

  test "should get month" do
    get calendar_month_url
    assert_response :success
  end

  test "should get day" do
    get calendar_day_url
    assert_response :success
  end
end
