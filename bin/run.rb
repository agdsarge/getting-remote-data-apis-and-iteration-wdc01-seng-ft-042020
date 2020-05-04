#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
def run
    welcome
    character = get_character_from_user
    bool, resp_char_hsh = check_for_valid_input(character)
    if bool
        show_character_movies(resp_char_hsh)
    else
        run
    end
end

run
