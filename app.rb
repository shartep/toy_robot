require_relative 'robot'

class App
  def initialize
    @r = Robot.new
  end

  def perform(args)
    if args[0]
      result_filename = args[1] || 'result.txt'
      File.open(result_filename, 'w+') do |f|
        File.readlines(args[0]).each do |line|
          command, params = line.split /\s/
          params = params.split ',' if params

          if %w(PLACE MOVE LEFT RIGHT REPORT).include? command
            output = @r.public_send(command.downcase, *params)
            f.puts output if output.is_a? String
          elsif command == 'EXIT'
            break
          else
            f.puts 'Invalid command'
          end
        end
      end
    else
      puts 'Commands list: PLACE, MOVE, LEFT, RIGHT, REPORT, EXIT'
      loop do
        input = gets.chomp
        command, params = input.split /\s/
        params = params.split ',' if params

        if %w(PLACE MOVE LEFT RIGHT REPORT).include? command
          output = @r.public_send(command.downcase, *params)
          puts output if output.is_a? String
        elsif command == 'EXIT'
          break
        else
          puts 'Invalid command'
        end
      end
    end
  end
end
