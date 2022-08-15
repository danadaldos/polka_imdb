defmodule PolkaImdb.FavoritesListsTest do
  use PolkaImdb.DataCase

  alias PolkaImdb.FavoritesLists

  describe "favorites_lists" do
    alias PolkaImdb.FavoritesLists.FavoritesList

    import PolkaImdb.FavoritesListsFixtures
    import PolkaImdb.UsersFixtures

    @invalid_attrs %{genre: nil}

    test "list_favorites_lists/0 returns all favorites_lists" do
      favorites_list = favorites_list_fixture()
      assert FavoritesLists.list_favorites_lists() == [favorites_list]
    end

    test "get_favorites_list!/1 returns the favorites_list with given id" do
      favorites_list = favorites_list_fixture()
      assert FavoritesLists.get_favorites_list!(favorites_list.id) == favorites_list
    end

    test "create_favorites_list/1 with valid data creates a favorites_list" do
      user = user_fixture()
      valid_attrs = %{user_id: user.id, genre: "some genre"}

      assert {:ok, %FavoritesList{} = favorites_list} =
               FavoritesLists.create_favorites_list(valid_attrs)

      assert favorites_list.genre == "some genre"
    end

    test "create_favorites_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FavoritesLists.create_favorites_list(@invalid_attrs)
    end

    test "update_favorites_list/2 with valid data updates the favorites_list" do
      favorites_list = favorites_list_fixture()
      update_attrs = %{genre: "some updated genre"}

      assert {:ok, %FavoritesList{} = favorites_list} =
               FavoritesLists.update_favorites_list(favorites_list, update_attrs)

      assert favorites_list.genre == "some updated genre"
    end

    test "update_favorites_list/2 with invalid data returns error changeset" do
      favorites_list = favorites_list_fixture()

      assert {:error, %Ecto.Changeset{}} =
               FavoritesLists.update_favorites_list(favorites_list, @invalid_attrs)

      assert favorites_list == FavoritesLists.get_favorites_list!(favorites_list.id)
    end

    test "delete_favorites_list/1 deletes the favorites_list" do
      favorites_list = favorites_list_fixture()
      assert {:ok, %FavoritesList{}} = FavoritesLists.delete_favorites_list(favorites_list)

      assert_raise Ecto.NoResultsError, fn ->
        FavoritesLists.get_favorites_list!(favorites_list.id)
      end
    end

    test "change_favorites_list/1 returns a favorites_list changeset" do
      favorites_list = favorites_list_fixture()
      assert %Ecto.Changeset{} = FavoritesLists.change_favorites_list(favorites_list)
    end

    test "add_favorite_item/2 creates a favorites_list_item for the movie and list name" do
      user = user_fixture()
      favorites_list = favorites_list_fixture(%{user_id: user.id, genre: "fantasy"})
      list_id = favorites_list.id

      {:ok, %PolkaImdb.Movies.Movie{id: movie_id}} =
        %{}
        |> Enum.into(%{name: "Top Gun"})
        |> PolkaImdb.Movies.create_movie()

      assert {:ok,
              %PolkaImdb.FavoritesListItem{
                movie_id: ^movie_id,
                favorites_list_id: ^list_id
              }} = FavoritesLists.add_favorite_item(favorites_list.id, movie_id)
    end
  end
end
