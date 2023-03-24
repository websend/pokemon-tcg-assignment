module Import
  class ProcessorJob < ApplicationJob
    queue_as :default

    def perform
      CardSerieImporterJob.perform_now
      CardSetImporterJob.perform_now
      CardImporterJob.perform_now
    end
  end
end
