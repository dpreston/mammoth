defmodule MammothWeb.RegistrationLive.New do
  use MammothWeb, :live_view

  alias MammothWeb.Router.Helpers, as: Routes

  alias Mammoth.Registrations
  alias Mammoth.Registrations.Registration

  @impl true
  def mount(_params, _session, socket) do
    changeset = Registrations.change(%Registration{})
    {:ok, assign(socket, changeset: changeset, clicks: 0)}
  end

  @impl true
  def handle_event("save", %{"registration" => attrs}, socket) do
    case Registrations.create(attrs) do
      {:ok, _registration} ->
        socket =
          socket
          |> put_flash(:info, "Registered successfully")
          |> push_redirect(to: Routes.registration_list_path(socket, :list))

        {:noreply, socket}

      {:error, changeset} ->
        IO.inspect(changeset.data, label: "validation error")
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
