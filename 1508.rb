STUDENTS = ['Aaron Careaga','Adam Jense','Amber Crawford','Emily Dowdle','Jason Pilz','Jhun de Andres','Jill Donohue','Marlo Major','Matt Rooney','Matt Stjernholm','Michael Wong','Pat Wey','Robbie Lane','Ross Edfort','Ryan Johnson','Sekhar Paladugu','Torie Warren','Tyler Komoroske']

def run
  count = get_count
  group = {students: STUDENTS.shuffle, pairs: []}
  while !group[:students].empty?
    group = test_group(group, count)
  end
  group[:pairs].each{|g| output ' * ' + g.join(' & ') + "\n"}
end

def test_group(group, count)
  next_pair = group[:students].pop(count)
  output 'Is this group okay? ' + next_pair.join(', ')
  output 'y, n'
  vote = input
  case vote
  when 'y'
    group[:pairs].push(next_pair)
  when 'n'
    group[:students].push(next_pair)
    group[:students] = group[:students].flatten.shuffle
  end
  group
end

def input
  $stdin.gets.chomp
end

def output(string)
  $stdout.puts string
end

def get_count
  output 'How many students?'
  input.to_i
end

run
