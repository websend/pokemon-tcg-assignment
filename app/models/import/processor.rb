module Import
  class Processor
    class << self
      def run
        SerieImporter.run
        CardSetImporter.run
        CardImporter.run
      end
    end
  end
end
