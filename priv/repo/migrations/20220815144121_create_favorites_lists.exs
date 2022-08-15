defmodule PolkaImdb.Repo.Migrations.CreateFavoritesLists do
  use Ecto.Migration

  def change do
    create table(:favorites_lists) do
      add :genre, :text

      add :user_id, references("users")

      timestamps()
    end
  end
end
