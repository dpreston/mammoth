# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mammoth.Repo.insert!(%Mammoth.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias UTCDateTime
alias Mammoth.Repo
alias Mammoth.Registrations.Registration

registrations = [
  %Registration{
    email: "alice@example.com",
    name: "Alice",
    phone: "07 1234 5678",
    session: ~D[2022-05-24]
  },
  %Registration{
    email: "bob@example.com",
    name: "Bob",
    phone: "02 1234 5678",
    session: ~D[2022-05-24]
  },
  %Registration{
    email: "charles@example.com",
    name: "Charles",
    phone: "0412 345 678",
    session: ~D[2022-05-25]
  }
]

Enum.each(registrations, fn r ->
  Repo.insert!(r)
end)
