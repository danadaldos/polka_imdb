defmodule PolkaImdb.FavoritesLists.FavoritesList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "favorites_lists" do
    field :genre, :string

    belongs_to :user, PolkaImdb.Users.User
    has_many :favorites_list_items, PolkaImdb.FavoritesListItem

    timestamps()
  end

  @doc false
  def changeset(favorites_list, attrs) do
    favorites_list
    |> cast(attrs, [:genre, :user_id])
    |> validate_required([:genre, :user_id])
  end
end
