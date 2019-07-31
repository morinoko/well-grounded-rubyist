# Chapter 12 Exercise

# Write out hit songs for each year into the "hits_output.txt" file
File.open("hits.txt") do |source_file|
	File.open("hits_output.txt", "w") do |output_file|
    source_file.each do |line|
        title, artist, year = line.split("/")
        output_file.puts "\"#{title},\" performed by #{artist}, reached #1 in #{year}"
    end
  end
end

# Append summary of which year had the most hits between available years
File.open("hits.txt") do |source_file|
	File.open("hits_output.txt", "a") do |output_file|
		year_count = source_file.inject({}) do |hash, line|
        year = line.split("/").last.chomp
        hash.has_key?(year) ? hash[year] += 1 : hash[year] = 1
        hash
    end

    max = year_count.keys.max
    min = year_count.keys.min
    year_with_most_hits = year_count.max_by { |year, count| count }.first

    output_file.puts "#{year_with_most_hits} was the best year for hit music between #{min} and #{max}"
	end
end