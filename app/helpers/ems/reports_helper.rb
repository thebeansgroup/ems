module Ems
  module ReportsHelper
    def report_form_url
      category_report_path(@report.category, @report)
    end
  end
end
