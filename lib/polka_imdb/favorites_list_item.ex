defmodule PolkaImdb.FavoritesListItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "favorites_list_items" do
    belongs_to :movie, PolkaImdb.Movies.Movie
    belongs_to :favorites_list, PolkaImdb.FavoritesLists.FavoritesList

    timestamps()
  end

  @doc false
  def changeset(favorites_list_item, attrs) do
    favorites_list_item
    |> cast(attrs, [:favorites_list_id, :movie_id])
    |> validate_required([:favorites_list_id, :movie_id])
  end
end
