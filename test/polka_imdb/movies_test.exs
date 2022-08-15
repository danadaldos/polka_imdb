defmodule PolkaImdb.MoviesTest do
  use PolkaImdb.DataCase

  alias PolkaImdb.Movies

  describe "movies" do
    alias PolkaImdb.Movies.Movie

    import PolkaImdb.MoviesFixtures

    @invalid_attrs %{name: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Movies.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Movies.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Movie{} = movie} = Movies.create_movie(valid_attrs)
      assert movie.name == "some name"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movies.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Movie{} = movie} = Movies.update_movie(movie, update_attrs)
      assert movie.name == "some updated name"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Movies.update_movie(movie, @invalid_attrs)
      assert movie == Movies.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Movies.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Movies.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Movies.change_movie(movie)
    end
  end
end
