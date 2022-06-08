defmodule Mammoth.Registrations.Registration do
  use Ecto.Schema

  import Ecto.Changeset

  schema "registrations" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :session, :date

    timestamps(type: :utc_datetime)
  end

  def changeset(registration, changes \\ %{}) do
    registration
    |> cast(changes, [:email, :name, :phone, :session])
    |> validate_required([:email], message: "Please provide your email address")
    |> validate_required([:name], message: "Please provide your name")
    |> validate_required([:phone], message: "Please provide a phone number")
    # |> validate_required([:session], message: "Please select a date")
    |> validate_format(:email, ~r/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/,
      message: "Please provide a valid email address"
    )
    |> unique_constraint(:email,
      message: "The email address is already registered. (DANGER: privacy leak!)"
    )
    |> validate_session([~D[2022-05-24], ~D[2022-05-25], ~D[2022-05-26]],
      message: "Please select a valid date"
    )
  end

  defp validate_session(changeset, valid_range, message: message) do
    case Enum.member?(valid_range, get_field(changeset, :session)) do
      false ->
        add_error(changeset, :session, message)

      true ->
        changeset
    end
  end
end
