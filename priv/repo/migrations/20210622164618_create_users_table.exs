# Created this migration with mix ecto.gen.migration create_users_table
defmodule Wabanex.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      # add column name, data type
      add :email, :string
      add :name, :string
      add :password, :string

      timestamps() # When was this created/changed?
    end

    # the email column of users contains only unique values
    create unique_index(:users, [:email])
  end
end
# To execute the migration and create the users table: mix ecto.migrate
# To drop the db and execute the migrations: mix ecto.reset
