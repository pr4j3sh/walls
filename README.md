# UDP Chat Application

This is a simple chat application built using Ruby and the UDP protocol. It allows users to send and receive messages over a network.

## Prerequisites

- Ruby

## Usage

1. **Start the Server**:
   Open a terminal and run the server with the following command:

   ```bash
   ruby server.rb
   ```

2. **Start the Client**:
   Open another terminal and run the client with the following command:

   ```bash
   ruby client.rb
   ```

3. **Chat**:
   - In the client terminal, type your message and hit enter to send it.
   - Messages from other clients will appear in the terminal.

## Notes

- Make sure both the server and client are running on the same network for communication.
- Update the server's HOSTNAME in `server.rb` and `client.rb` if necessary.
