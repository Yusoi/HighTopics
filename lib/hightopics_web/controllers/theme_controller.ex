defmodule HightopicsWeb.ThemeController do
  use HightopicsWeb, :controller

  alias Hightopics.Themes
  alias Hightopics.Themes.Theme

  def index(conn, _params) do
    themes = Themes.list_themes()
    render(conn, "index.html", themes: themes)
  end

  def new(conn, _params) do
    changeset = Themes.change_theme(%Theme{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"theme" => theme_params}) do
    case Themes.create_theme(theme_params) do
      {:ok, theme} ->
        conn
        |> put_flash(:info, "Theme created successfully.")
        |> redirect(to: theme_path(conn, :show, theme))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    theme = Themes.get_theme!(id)
    render(conn, "show.html", theme: theme)
  end

  def edit(conn, %{"id" => id}) do
    theme = Themes.get_theme!(id)
    changeset = Themes.change_theme(theme)
    render(conn, "edit.html", theme: theme, changeset: changeset)
  end

  def update(conn, %{"id" => id, "theme" => theme_params}) do
    theme = Themes.get_theme!(id)

    case Themes.update_theme(theme, theme_params) do
      {:ok, theme} ->
        conn
        |> put_flash(:info, "Theme updated successfully.")
        |> redirect(to: theme_path(conn, :show, theme))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", theme: theme, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    theme = Themes.get_theme!(id)
    {:ok, _theme} = Themes.delete_theme(theme)

    conn
    |> put_flash(:info, "Theme deleted successfully.")
    |> redirect(to: theme_path(conn, :index))
  end
end
