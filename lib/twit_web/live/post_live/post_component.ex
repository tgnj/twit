defmodule TwitWeb.PostLive.PostComponent do
  use TwitWeb, :live_component

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
        <p class="width-auto flex-shrink text-base font-medium">
          <%= @post.body %>
        </p>

        <div class="flex">
          <div class="w-full">
            <div class="flex items-center">
              <div class="flex-1 text-center">
                <.link
                  href="#"
                  phx-click="like"
                  phx-target={@myself}
                  class="group mt-1 flex w-12 text-center rounded-full px-3 py-2 text-base font-medium leading-6 text-gray-500 hover:bg-blue-800 hover:text-blue-300"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="w-6 h-6"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z"
                    />
                  </svg>
                </.link>
                <span class="ml-1"><%= @post.likes_count %></span>
              </div>

              <div class="m-2 flex-1 py-2 text-center">
                <.link
                  href="#"
                  phx-click="repost"
                  phx-target={@myself}
                  class="group mt-1 flex w-12 items-center rounded-full px-3 py-2 text-base font-medium leading-6 text-gray-500 hover:bg-blue-800 hover:text-blue-300"
                >
                  <svg
                    class="h-7 w-6 text-center"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M7 16V4m0 0L3 8m4-4l4 4m6 0v12m0 0l4-4m-4 4l-4-4"></path>
                  </svg>
                </.link>
                <span><%= @post.reposts_count %></span>
              </div>
              <div class="m-2 flex-1 py-2 text-center">
                <.link
                  patch={~p"/posts/#{@post}/edit"}
                  class="group mt-1 flex w-12 items-center rounded-full px-3 py-2 text-base font-medium leading-6 text-gray-500 hover:bg-blue-800 hover:text-blue-300"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="w-6 h-6"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10"
                    />
                  </svg>
                </.link>
              </div>
              <div class="m-2 flex-1 py-2 text-center">
                <a
                  href="#"
                  class="group mt-1 flex w-12 items-center rounded-full px-3 py-2 text-base font-medium leading-6 text-gray-500 hover:bg-blue-800 hover:text-blue-300"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke-width="1.5"
                    stroke="currentColor"
                    class="w-6 h-6"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0"
                    />
                  </svg>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
