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
3. `mix ecto.setup`
4. `mix phx.server`
5. go to `http://localhost:4000/api?filename=students.csv`

## Problems with postgresql authentication on wsl2?
1. Check if the service has started: `service postgresql status`
2. If not then: `service postgresql start`
3. Then `sudo -u postgres psql`
4. And finally: `\password` to set a new password
5. type the new password on the config files