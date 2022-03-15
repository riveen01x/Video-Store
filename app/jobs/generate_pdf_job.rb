class GeneratePdfJob < ApplicationJob
  queue_as :default


  def perform(*args) 
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "show"   # Excluding ".pdf" extension.
        sleep 2
      end
    end
  end
end
