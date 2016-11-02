require 'pry'

def sing_song(entities)
  entities.each_with_index do |entity, i|
    sing_refrain
    if entities.first == entity
      puts "Now in the bog there was a #{entity},"
    else
      puts "And on that #{entities[i-1]} there was a #{entity},"
    end
    puts "A rare #{entity}, a rattlin' #{entity}"
    puts build_sequence_line entities.slice(0..i)
    puts 'And the bog down in the valley-o.'
  end
  sing_refrain
end

def sing_refrain
  refrain = "Hi ho, the rattlin' bog,
The bog down in the valley-o,"

  puts ''
  puts refrain
  puts refrain
  puts ''
end

def build_sequence_line(entities)
  line = ''
  previous_entity = nil
  entities.each do |entity|
    unless previous_entity
      line = "and the #{entity} in the bog," + line
    else
      line = "The #{entity} on the #{previous_entity}, " + line
    end
    previous_entity = entity
  end
  return line
end

sing_song(%w(tree branch))
