defmodule MinimalAlpineRenderingExampleWeb.PageLive do
  use MinimalAlpineRenderingExampleWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    list = [%{id: 2, name: "Element 2"}, %{id: 1, name: "Element 1"}]

    {:ok,
     socket
     |> assign(:list, list)}
  end

  @impl true
  def handle_event("add_element", _params, socket) do
    {:noreply,
     socket
     |> update(:list, fn list ->
       [%{id: length(list) + 1, name: "Element #{length(list) + 1}"} | list]
     end)}
  end
end
