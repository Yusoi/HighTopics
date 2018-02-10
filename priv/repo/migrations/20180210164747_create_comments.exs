defmodule Hightopics.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :content, :text
      add :rating, :integer

      timestamps()
    end

  end
end
