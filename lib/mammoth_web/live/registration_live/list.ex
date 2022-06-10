defmodule MammothWeb.RegistrationLive.List do
  use MammothWeb, :live_view

  alias Mammoth.Registrations

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Registrations.subscribe()
    registrations = Registrations.list_all()

    {:ok, assign(socket, registrations: registrations)}
  end

  @impl true
  def handle_info({:new_registration, _registration}, socket) do
    registrations = Registrations.list_all()
    {:noreply, assign(socket, registrations: registrations)}
  end
end
