# Initially this code seems ok, given the apparent requirements, but there's an issue
# The step of reading the file and the step of generating another file based on the input
# could require this class to change.

# As an example, consider that a new requirement is top process not only CSV but other formats
# That other part of the application requires. And a new output format is also required. By that logic,
# the best solution here is to make both reading, and building the report separated into different classes

class FileProcessor
  def process_file(file)
    puts 'reading file...'
    processed_data = {name: 'item1', value: 5000}

    CSV.generate(headers: true, col_sep: ';', quote_char: '"') do |csv|
      csv << ['name', 'value']
      processed_data.each do |line|
        csv << line
      end
    end
  end
end
