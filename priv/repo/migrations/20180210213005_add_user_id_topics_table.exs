defmodule Hightopics.Repo.Migrations.AddUserIdTopicsTable do
  use Ecto.Migration

  def change do
    alter table(:topics) do
      add :user_id, references(:users)
    end
  end
end
