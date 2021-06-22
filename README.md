# Wabanex 
### Water, bananas and exercise!

## Stack
- Elixir
- Phoenix
- GraphQL
- PostgreSQL

## Folder structure
- `lib` -> The code
  - `wabanex` -> Data handling and logic
  - `wabanex_web` -> MVC, routes, etc.
- `config` -> The project variables
- `mix.exs` -> Project dependencies and configuration

## How to run
1. `git clone` this project
2. cd `wabanex`
2. `mix ecto.setup`
3. `mix phx.server`