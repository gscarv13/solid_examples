# By doing this we do have a lot more code than previously but now it is far easier to change
# and to do unit testing

# A nice tip to evaluate if this would be necessary is to think about the input and output
# Would it be necessary in the future to process other types of files?
# Would it be necessary to export to other types of formats?
# Those 2 questions can help identify if it would be necessary or not to break things down

class JSONFileReader
  def read(file)
    puts 'reading file...'

    { name: 'item1', value: 5000 }
  end
end

class CSVExporter
  def export(processed_data)
    CSV.generate(headers: true, col_sep: ';', quote_char: '"') do |csv|
      csv << ['name', 'value']
      processed_data.each do |line|
        csv << line
      end
    end
  end
end

class FileProcessor
  def initialize(file_reader: JSONFileReader, exporter: CSVExporter)
    @file_reader = file_reader
    @exporter = exporter
  end

  def process_file(file)
    data = @file_reader.read(file)
    @exporter.export(data)
  end
end

# usage

file = JSON.parse({name: 'dummy file', value: 6000})

processor = FileProcessor.new
processor.process_file(file)