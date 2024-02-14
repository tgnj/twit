defmodule TwitWeb.PostLive.PostComponent do
  use TwitWeb, :live_component

  alias Twit.Timeline

  def handle_event("like", _, socket) do
    Timeline.inc_likes(socket.assigns.post)
    {:noreply, socket}
  end

  def handle_event("repost", _, socket) do
    Timeline.inc_reposts(socket.assigns.post)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div id={@id}>
      <div class="flex flex-shrink-0 p-4 pb-0">
        <a href="#" class="group block flex-shrink-0">
          <div class="flex items-center">
            <div>
              <img
                class="inline-block h-10 w-10 rounded-full"
                src="https://pbs.twimg.com/profile_images/1121328878142853120/e-rpjoJi_bigger.png"
              />
            </div>
            <div class="ml-3">
              <span class="text-base font-bold">@<%= @post.username %></span>
            </div>
          </div>
        </a>
      </div>
      <div class="pl-16">
        <p class="width-auto flex-shrink text-base font-medium font-light">
          <%= @post.body %>
        </p>
        <div class="flex">
          <div class="w-full">
            <div class="flex items-center place-content-evenly">
              <div class="m-2 flex items-center justify-center py-2 text-center">
                <%!-- likes --%>
                <.link
                  href="#"
                  phx-click="like"
                  phx-target={@myself}
                  class="group mt-1 flex w-12 text-center rounded-full px-3 py-2 text-base font-medium leading-6 text-gray-500 hover:bg-blue-800 hover:text-blue-300"
                >
                  <.icon name="hero-heart" class="w-6 h-6" />
                </.link>
                <span class="ml-1 text-sm"><%= @post.likes_count %></span>
              </div>
              <div class="m-2 flex items-center justify-center py-2 text-center">
                <%!-- repost --%>
                <.link
                  href="#"
                  phx-click="repost"
                  phx-target={@myself}
                  class="group mt-1 flex w-12 items-center rounded-full px-3 py-2 text-base font-medium leading-6 text-gray-500 hover:bg-blue-800 hover:text-blue-300"
                >
                  <.icon name="hero-chat-bubble-left-right" class="w-6 h-6" />
                </.link>
                <span class="ml-1 text-sm"><%= @post.reposts_count %></span>
              </div>
              <div class="m-2 flex py-2 text-center">
                <.link
                  patch={~p"/posts/#{@post}/edit"}
                  class="group mt-1 flex w-12 items-center rounded-full px-3 py-2 text-base font-medium leading-6 text-gray-500 hover:bg-blue-800 hover:text-blue-300"
                >
                  <.icon name="hero-pencil-square" class="w-6 h-6" />
                </.link>
              </div>
              <div class="m-2 flex py-2 text-center">
                <.link
                  phx-click={JS.push("delete", value: %{id: @post.id}) |> hide("##{@id}")}
                  data-confirm="Are you sure?"
                  class="group mt-1 flex w-12 items-center rounded-full px-3 py-2 text-base font-medium leading-6 text-gray-500 hover:bg-blue-800 hover:text-blue-300"
                >
                  <.icon name="hero-trash" class="w-6 h-6" />
                </.link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
