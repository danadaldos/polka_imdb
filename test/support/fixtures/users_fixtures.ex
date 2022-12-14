defmodule PolkaImdb.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PolkaImdb.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PolkaImdb.Users.create_user()

    user
  end
end
