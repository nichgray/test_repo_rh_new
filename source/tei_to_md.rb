require 'nokogiri'

# initialize categories variable
allCategories = []

# get all file names in tei directory
files = Dir.children("tei")

# make sure you're only getting xml files
teiFiles = files.select { |f| f.end_with?(".xml") }

teiFiles.each do |i|
	# read in XML
	doc = Nokogiri::XML(File.read("tei/#{i}"))

	# assign variables
	# TODO: handle cases with multiple values, like author and category
	title = doc.xpath("//xmlns:titleStmt/xmlns:title[@type='main']/text()")
	xml_id = doc.xpath("//xmlns:TEI/@xml:id")
	author = doc.xpath("//xmlns:teiHeader//xmlns:titleStmt//xmlns:author[1]/text()")
	publication_a_title = doc.xpath("//xmlns:sourceDesc//xmlns:bibl[1]//xmlns:title[@level='a']/text()")
	publication_j_title = doc.xpath("//xmlns:sourceDesc//xmlns:bibl[1]//xmlns:title[@level='j']/text()")
	publication_m_title = doc.xpath("//xmlns:sourceDesc//xmlns:bibl[1]//xmlns:title[@level='m']/text()")
	publication_date = doc.xpath("//xmlns:sourceDesc//xmlns:date/text()")
	pages = doc.xpath("//xmlns:sourceDesc//xmlns:biblScope[@unit='pages']/text()")
	category_name = doc.xpath("//xmlns:encodingDesc//xmlns:catDesc[1]/text()")

	# check to see if title j or m should be used
	publication_j_title ? pubTitle = publication_j_title.to_s : pubTitle = publication_m_title.to_s

	# go ahead and turn doc id and category into strings, create filename
	doc_id = xml_id.to_s
	category = category_name.to_s
	filename = doc_id + '.xml'

	# add category to categories array
	allCategories << category.to_s

	# read in data as hash
	data_hash = {
		"title" => title.to_s,
		"document" => filename,
		"author" => author.to_s,
		"publication_title" => pubTitle,
		"publication_date" => publication_date.to_s,
		"pages" => pages.to_s,
		"category" => category.to_s
	}

	# check for category among extant directories
	if !Dir.exist?("../_texts/#{category}")
		puts "Creating a new #{category} folder."
		# make a new directory if the category doesn't exist
		Dir.mkdir("../_texts/#{category}")
	end

	# print values that exist to new md file
	# outside block handles errors
	begin
		# create and open the file and stuff it with the hash
		File.open("../_texts/#{category}/#{doc_id}.md","w") do |f|
			# make sure to include jekyll head matter markers
			f.puts "---"
			# write that bad boy
			data_hash.each { |k, v| f.puts("#{k}: #{v}") unless v.empty? }
			# close the head matter
			f.puts "---"
		end

		# output a success message congratulating the user on her accomplishment
		puts "Your TEI file #{filename} has transformed successfully."

	rescue IOError => e
		# handle file-related errors like permissions and access problems
		puts "An error occurred while transforming the files: #{e.message}"

	rescue StandardError => e
		# handle other errors
		puts "An unexpected error occurred: #{e.message}"
	end
end

# Alert the user they may need to update categories in config
puts "Congratulations: your transformation was successful!"
puts "Before viewing your files, please confirm the following categories appear in _config.yml: "
puts allCategories.uniq
