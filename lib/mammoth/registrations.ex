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
    |> broadcast(:new_registration)
  end

  def list_all() do
    Registration
    |> Repo.all()
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Mammoth.PubSub, "registrations")
  end

  defp broadcast({:error, _reason} = error, _event), do: error

  defp broadcast({:ok, registration}, event) do
    IO.inspect(registration, label: "broadcast: registration")
    IO.inspect(event, label: "broadcast: event")
    Phoenix.PubSub.broadcast(Mammoth.PubSub, "registrations", {event, registration})

    {:ok, registration}
  end
end
