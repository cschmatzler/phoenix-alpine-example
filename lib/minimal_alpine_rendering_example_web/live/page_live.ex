defmodule MinimalAlpineRenderingExampleWeb.PageLive do
  use MinimalAlpineRenderingExampleWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    list = [%{id: 2, name: "Element 2"}, %{id: 1, name: "Element 1"}]

    {:ok,
     socket
     |> assign(query: "", results: %{})
     |> assign(:list, list)}
  end

  ### Added this
  @impl true
  def handle_event("add_element", _params, socket) do
    {:noreply,
     socket
     |> update(:list, fn list ->
       [%{id: length(list) + 1, name: "Element #{length(list) + 1}"} | list]
     end)}
  end

  ###

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do
    {:noreply, assign(socket, results: search(query), query: query)}
  end

  @impl true
  def handle_event("search", %{"q" => query}, socket) do
    case search(query) do
      %{^query => vsn} ->
        {:noreply, redirect(socket, external: "https://hexdocs.pm/#{query}/#{vsn}")}

      _ ->
        {:noreply,
         socket
         |> put_flash(:error, "No dependencies found matching \"#{query}\"")
         |> assign(results: %{}, query: query)}
    end
  end

  defp search(query) do
    if not MinimalAlpineRenderingExampleWeb.Endpoint.config(:code_reloader) do
      raise "action disabled when not in development"
    end

    for {app, desc, vsn} <- Application.started_applications(),
        app = to_string(app),
        String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
        into: %{},
        do: {app, vsn}
  end
end