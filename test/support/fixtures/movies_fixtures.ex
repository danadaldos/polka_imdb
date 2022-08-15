defmodule PolkaImdb.MoviesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PolkaImdb.Movies` context.
  """

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PolkaImdb.Movies.create_movie()

    movie
  end
end
