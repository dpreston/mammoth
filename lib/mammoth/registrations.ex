defmodule Mammoth.Registrations do
  alias Mammoth.Registrations.Registration

  @spec change_registration(Registration.t(), map()) :: Ecto.Changeset.t()
  def change_registration(registration, changes \\ %{}) do
    Registration.changeset(registration, changes)  
  end 
end