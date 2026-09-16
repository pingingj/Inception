*This project has been created as part of the 42 curriculum by **dgarcez-***.

# **Inception**

# Description

FT_IRC is a basic implementation of a server that uses a client-server model to communicate with other users on the network by creating channels and private messaging.

# Instructions

1. Clone the repository:

   `git clone git@github.com:pingingj/ft_irc.git`

2. Install an IRC client (**HexChat** was used as reference).

3. Compile the files using `make`:

   `make`

4. Execute the program with:

   `./ircserv [port] [pass]`

# Features

### User Authentication

The server is password protected. Once connected, each user is able to set a unique nickname and username.

### Private Messaging

Users are able to private message another user.

### User Commands

- `HELP` — Shows commands
- `NICK` — Sets nickname
- `JOIN` — Joins or creates a channel
- `QUIT` — Disconnects from the server

### Channels

Features public and private channels (password protected, invite-only), channel operators, and multiple commands such as:

**Channel commands**

- `INVITE` — Invites a user to a channel
- `MODE` — Changes channel modes
- `TOPIC` — Changes the channel topic
- `PART` — Leaves a channel
- `KICK` — Kicks a user from a channel
- `WHO` — Shows users in a channel

# Resources

Docker study:
https://docs.docker.com/get-started/docker-overview/
## AI Usage

AI was used to help implement and understand the protocol used, as well as to help write this README.
