require 'test_helper'

class RidingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @riding = ridings(:one)
  end

  test "should get index" do
    get ridings_url
    assert_response :success
  end

  test "should get new" do
    get new_riding_url
    assert_response :success
  end

  test "should create riding" do
    assert_difference('Riding.count') do
      post ridings_url, params: { riding: { eligible_voters: @riding.eligible_voters, name: @riding.name, number: @riding.number, province: @riding.province, win_number: @riding.win_number } }
    end

    assert_redirected_to riding_url(Riding.last)
  end

  test "should show riding" do
    get riding_url(@riding)
    assert_response :success
  end

  test "should get edit" do
    get edit_riding_url(@riding)
    assert_response :success
  end

  test "should update riding" do
    patch riding_url(@riding), params: { riding: { eligible_voters: @riding.eligible_voters, name: @riding.name, number: @riding.number, province: @riding.province, win_number: @riding.win_number } }
    assert_redirected_to riding_url(@riding)
  end

  test "should destroy riding" do
    assert_difference('Riding.count', -1) do
      delete riding_url(@riding)
    end

    assert_redirected_to ridings_url
  end
end
