# Endlist: Synchronized YouTube Playlists

Endlist is a real-time, collaborative application that allows multiple users to create, share, and watch YouTube playlists together. Playback is synchronized across all participants in a room, creating a shared viewing experience.

This project is built with a powerful combination of **Elixir** and **Phoenix** on the backend for massive concurrency and real-time communication, and a modern **TypeScript** frontend for a responsive and robust user interface.

## Core Features

- **Collaborative Playlists**: Users can create rooms and add YouTube videos to a shared playlist.
- **Real-Time Synchronization**: Every action—adding a video, playing, pausing, or seeking—is instantly broadcast to all users in the room.
- **Live User Presence**: See who is currently online and watching with you in the playlist room.
- **Scalable by Design**: Built on Elixir's BEAM, Endlist is designed to handle a large number of concurrent users and rooms with low latency.

## Technology Stack

Endlist leverages a modern, real-time technology stack designed for performance and scalability.

### Backend

- **[Elixir](https://elixir-lang.org/)**: A dynamic, functional language designed for building scalable and maintainable applications.
- **[Phoenix Framework](https://www.phoenixframework.org/)**: The go-to web framework for Elixir, featuring:
  - **Phoenix Channels**: For high-performance, real-time, bidirectional communication over WebSockets.
  - **Phoenix Presence**: A distributed system for easily tracking user presence across channels.
- **[PostgreSQL](https://www.postgresql.org/)**: A powerful, open-source object-relational database system.

### Frontend

- **[TypeScript](https://www.typescriptlang.org/)**: A statically typed superset of JavaScript that enhances code quality and maintainability.
- **[Phoenix.js](https://hexdocs.pm/phoenix/js/)**: The official JavaScript client for connecting to Phoenix Channels.

## Getting Started

To get Endlist running on your local machine, follow these steps.

### Prerequisites

Ensure you have the following installed on your system:

- Elixir `~> 1.15`
- Erlang/OTP `~> 26.0`
- Node.js `~> 18.0`
- PostgreSQL `~> 14.0`

### Installation & Setup

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/endlist.git
    cd endlist
    ```

2.  **Setup the Elixir Backend:**

    ```bash
    # Fetch dependencies
    mix deps.get

    # Create and migrate your database
    mix ecto.create && mix ecto.migrate
    ```

3.  **Setup the TypeScript Frontend:**

    ```bash
    # Navigate to the assets directory and install dependencies
    cd assets
    npm install
    cd ..
    ```

4.  **Start the Phoenix Server:**
    ```bash
    # This will start the server and the frontend build process
    mix phx.server
    ```

By default, Endlist will be running at `http://localhost:4000`.

## How It Works

The magic of Endlist lies in its backend architecture.

1.  **Phoenix Channels**: When you create or join a playlist, your client establishes a persistent WebSocket connection to a dedicated "topic" for that playlist (e.g., `playlist:123`).
2.  **Broadcasting Events**: Every action you take, such as adding a video or clicking "play", is sent as an event over this WebSocket. The Elixir server immediately broadcasts this event to all other clients subscribed to the same playlist topic.
3.  **Client-Side Reaction**: The TypeScript frontend listens for these incoming events and updates the UI in real-time. If it receives a "play" event, it tells the YouTube player to play. If it receives a "new_video" event, it adds the video to the playlist. This creates the illusion of a seamless, shared experience.

## Contributing

We welcome contributions! If you'd like to help improve Endlist, please feel free to:

- Report a bug
- Suggest a new feature
- Submit a pull request

Please read our `CONTRIBUTING.md` for details on our code of conduct and the process for submitting pull requests to us.

## License

This project is licensed under the MIT License
