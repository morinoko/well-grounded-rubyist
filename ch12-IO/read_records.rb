File.open("record.txt") do |f|
	f.each do |record|
		name, nationality, instrument, dates = record.chomp.split("|")
		puts "#{name} (#{dates}), who was #{nationality}, played #{instrument}"
	end
end