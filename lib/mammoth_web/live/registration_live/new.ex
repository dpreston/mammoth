defmodule MammothWeb.RegistrationLive.New do
  use MammothWeb, :live_view

  alias Mammoth.Registrations
  alias Mammoth.Registrations.Registration

  @impl true
  def mount(_params, _session, socket) do
    changeset = Registrations.change_registration(%Registration{})
    {:ok, assign(socket, changeset: changeset)}
  end
end
