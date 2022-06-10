# Mammoth

Hi Andre,

I have built the test project using Elixir and Phoenix.

It is currently setup to use Postgres as the datastore.

The live version is currently not working, it seems my server's postgres installation is mis-behaving.

Installation instructions for [Elixir](https://elixir-lang.org/install.html) and [Phoenix](https://hexdocs.pm/phoenix/installation.html).


## Comments

The registrations table is unique indexed on `email`, which is included in the the validation logic but is a privacy leak.

I considered using a select list for the 3 dates as it would have the same manual setup cost to pick valid dates. During testing I found that iOS does not support the min/max attributes on <input type="date"/> elements and generally requires a custom element.

Aria attributes are added with the corresponding error messages.

## Local Dev Server

The dev server connects to Postgres using u:postgres p:postgres.

To start the dev Phoenix server:
  
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
