module Ems
  module ReportsHelper
    def report_form_url
      if params[:action].eql? "edit"
        return category_report_path(@report.category, @report)
      else
        return category_reports_path(@report.category)
      end
    end
  end
end
