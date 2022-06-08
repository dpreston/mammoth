defmodule Mammoth.Registrations do
  alias Mammoth.Repo
  alias Mammoth.Registrations.Registration

  @spec change(Registration.t(), map()) :: Ecto.Changeset.t()
  def change(registration, changes \\ %{}) do
    Registration.changeset(registration, changes)
  end

  @spec create(map()) :: {:ok, Registration.t()} | {:error, Ecto.Changeset.t()}
  def create(attrs) do
    %Registration{}
    |> Registration.changeset(attrs)
    |> Repo.insert()
  end

  def list_all() do
    Registration
    |> Repo.all()
  end
end
