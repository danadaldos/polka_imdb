defmodule PolkaImdb.FavoritesLists do
  @moduledoc """
  The FavoritesLists context.
  """

  import Ecto.Query, warn: false
  alias PolkaImdb.Repo

  alias PolkaImdb.FavoritesLists.FavoritesList
  alias PolkaImdb.FavoritesListItem
  alias PolkaImdb.Movies.Movie

  @doc """
  Returns the list of favorites_lists.

  ## Examples

      iex> list_favorites_lists()
      [%FavoritesList{}, ...]

  """
  def list_favorites_lists do
    Repo.all(FavoritesList)
  end

  @doc """
  Gets a single favorites_list.

  Raises `Ecto.NoResultsError` if the Favorites list does not exist.

  ## Examples

      iex> get_favorites_list!(123)
      %FavoritesList{}

      iex> get_favorites_list!(456)
      ** (Ecto.NoResultsError)

  """
  def get_favorites_list!(id), do: Repo.get!(FavoritesList, id)

  @doc """
  Creates a favorites_list.

  ## Examples

      iex> create_favorites_list(%{field: value})
      {:ok, %FavoritesList{}}

      iex> create_favorites_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_favorites_list(attrs \\ %{}) do
    %FavoritesList{}
    |> FavoritesList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a favorites_list.

  ## Examples

      iex> update_favorites_list(favorites_list, %{field: new_value})
      {:ok, %FavoritesList{}}

      iex> update_favorites_list(favorites_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_favorites_list(%FavoritesList{} = favorites_list, attrs) do
    favorites_list
    |> FavoritesList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a favorites_list.

  ## Examples

      iex> delete_favorites_list(favorites_list)
      {:ok, %FavoritesList{}}

      iex> delete_favorites_list(favorites_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_favorites_list(%FavoritesList{} = favorites_list) do
    Repo.delete(favorites_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking favorites_list changes.

  ## Examples

      iex> change_favorites_list(favorites_list)
      %Ecto.Changeset{data: %FavoritesList{}}

  """
  def change_favorites_list(%FavoritesList{} = favorites_list, attrs \\ %{}) do
    FavoritesList.changeset(favorites_list, attrs)
  end

  def add_favorite_item(favorites_list_id, movie_id) do
    list = Repo.get!(FavoritesList, favorites_list_id)

    %FavoritesListItem{}
    |> FavoritesListItem.changeset(%{movie_id: movie_id, favorites_list_id: list.id})
    |> Repo.insert()
  end
end
