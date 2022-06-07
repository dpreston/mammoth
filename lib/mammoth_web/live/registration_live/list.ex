defmodule MammothWeb.RegistrationLive.List do
  use MammothWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
