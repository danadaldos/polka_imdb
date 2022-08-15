defmodule PolkaImdb.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies) do
      add :name, :text

      timestamps()
    end
  end
end
