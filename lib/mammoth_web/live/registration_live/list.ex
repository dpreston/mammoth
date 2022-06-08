defmodule MammothWeb.RegistrationLive.List do
  use MammothWeb, :live_view

  alias Mammoth.Registrations

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, registrations: Registrations.list_all())}
  end
end
