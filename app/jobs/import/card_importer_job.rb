module Import
  class CardImporterJob < ApplicationJob
    queue_as :default

    def perform
      CardImporter.run
    end
  end
end
