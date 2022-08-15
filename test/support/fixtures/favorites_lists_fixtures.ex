defmodule PolkaImdb.FavoritesListsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PolkaImdb.FavoritesLists` context.
  """

  @doc """
  Generate a favorites_list.
  """

  import PolkaImdb.UsersFixtures

  def favorites_list_fixture(attrs \\ %{})

  def favorites_list_fixture(%{user_id: user_id} = attrs) do
    {:ok, favorites_list} =
      attrs
      |> Enum.into(%{
        user_id: user_id,
        genre: "some genre"
      })
      |> PolkaImdb.FavoritesLists.create_favorites_list()

    favorites_list
  end

  def favorites_list_fixture(attrs) do
    user = user_fixture()

    {:ok, favorites_list} =
      attrs
      |> Enum.into(%{
        user_id: user.id,
        genre: "some genre"
      })
      |> PolkaImdb.FavoritesLists.create_favorites_list()

    favorites_list
  end
end
