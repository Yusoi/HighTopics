defmodule Hightopics.Repo.Migrations.CreateThemesTopicsTable do
  use Ecto.Migration

  def change do
    create table(:themes_topics, primary_keys: false)do
      add :theme_id, references(:themes_topics, on_delete: :delete_all)
      add :topic_id, references(:themes_topics, on_delete: :delete_all)
    end
  end
end
