defmodule Hightopics.Repo.Migrations.AddTopicIdCommentsTable do
  use Ecto.Migration

  def change do
    alter table(:comments) do
      add :topic_id, references(:topics)
    end
  end
end
