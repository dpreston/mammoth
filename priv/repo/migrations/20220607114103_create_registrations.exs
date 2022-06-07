defmodule Mammoth.Repo.Migrations.CreateRegistrations do
  use Ecto.Migration

  def change do
    create table(:registrations) do
      add :email, :string
      add :name, :string
      add :phone, :string
      add :date, :utc_datetime

      timestamps(type: :timestamptz)
    end

    create unique_index(:registrations, [:email])
  end
end
