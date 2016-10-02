class Api::V1::PdfController < ApplicationController

  # GET /map
  def index
    pdf_filename = File.join(Rails.root, "app/assets/pdfs/SpartaHack-Map.pdf")
    send_file(pdf_filename, :filename => "SpartaHack-Map.pdf", :type => "application/pdf")
  end

end
