require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get calendar" do
    get tasks_calendar_url
    assert_response :success
  end

  test "should get year" do
    get tasks_year_url
    assert_response :success
  end

  test "should get month" do
    get tasks_month_url
    assert_response :success
  end

  test "should get show" do
    get tasks_show_url
    assert_response :success
  end

  test "should get new" do
    get tasks_new_url
    assert_response :success
  end

  test "should get create" do
    get tasks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tasks_destroy_url
    assert_response :success
  end
end
