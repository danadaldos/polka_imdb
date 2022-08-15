defmodule PolkaImdb.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  schema "movies" do
    field :name, :string

    # belongs_to :favorites_list_item, PolkaImdb.FavoritesListItem

    # has_many :users,
    #   through: [:favorites_lists, :user]

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
