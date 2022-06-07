defmodule Mammoth.Registrations.Registration do
  use Ecto.Schema

  import Ecto.Changeset

  schema "registrations" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :date, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  def changeset(registration, changes \\ %{}) do
    registration
    |> cast(changes, [:email, :name, :phone, :date])
    |> validate_required([:email, :name, :phone, :date])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end
end
