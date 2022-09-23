require "test_helper"

class TypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type = types(:one)
  end

  test "should get index" do
    get types_url, as: :json
    assert_response :success
  end

  test "should create type" do
    assert_difference("Type.count") do
      post types_url, params: { type: { name: @type.name } }, as: :json
    end

    assert_response :created
  end


    assert_response :no_content
  end
end
