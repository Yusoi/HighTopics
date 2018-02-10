defmodule Hightopics.Repo.Migrations.CreateTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :name, :string
      add :description, :text
      add :rating, :integer

      timestamps()
    end

  end
end
