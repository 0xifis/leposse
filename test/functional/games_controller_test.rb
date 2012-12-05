require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { date: @game.date, details: @game.details, end_time: @game.end_time, host_id: @game.host_id, maxpax: @game.maxpax, sport: @game.sport, start_time: @game.start_time, venue_id: @game.venue_id }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    put :update, id: @game, game: { date: @game.date, details: @game.details, end_time: @game.end_time, host_id: @game.host_id, maxpax: @game.maxpax, sport: @game.sport, start_time: @game.start_time, venue_id: @game.venue_id }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
