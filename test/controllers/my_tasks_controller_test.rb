require 'test_helper'

class MyTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_task = my_tasks(:one)
  end

  test "should get index" do
    get my_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_my_task_url
    assert_response :success
  end

  test "should create my_task" do
    assert_difference('MyTask.count') do
      post my_tasks_url, params: { my_task: { conversations_id: @my_task.conversations_id, deadline: @my_task.deadline, description: @my_task.description, status: @my_task.status, title: @my_task.title } }
    end

    assert_redirected_to my_task_url(MyTask.last)
  end

  test "should show my_task" do
    get my_task_url(@my_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_task_url(@my_task)
    assert_response :success
  end

  test "should update my_task" do
    patch my_task_url(@my_task), params: { my_task: { conversations_id: @my_task.conversations_id, deadline: @my_task.deadline, description: @my_task.description, status: @my_task.status, title: @my_task.title } }
    assert_redirected_to my_task_url(@my_task)
  end

  test "should destroy my_task" do
    assert_difference('MyTask.count', -1) do
      delete my_task_url(@my_task)
    end

    assert_redirected_to my_tasks_url
  end
end
