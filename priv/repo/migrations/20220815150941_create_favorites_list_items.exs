defmodule PolkaImdb.Repo.Migrations.CreateFavoritesListItems do
  use Ecto.Migration

  def change do
    create table(:favorites_list_items) do
      add :movie_id, references(:movies, on_delete: :nothing)
      add :favorites_list_id, references(:favorites_lists, on_delete: :nothing)

      timestamps()
    end

    create index(:favorites_list_items, [:movie_id])
    create index(:favorites_list_items, [:favorites_list_id])
  end
end
