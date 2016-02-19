require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  setup do
      @artist = artists(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:artists)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create artist" do
        assert_difference('Artist.count') do
          post :create, artist: { name: @artist.name, genre: @artist.genre, rec_company: @artist.rec_company }
        end

        assert_redirected_to artist_path(assigns(:artist))
      end

      test "should show artist" do
        get :show, id: @artist
        assert_response :success
      end

      test "should get edit" do
        get :edit, id: @artist
        assert_response :success
      end
end
