module Ems
  module ApplicationHelper

  # Titles
  def title_bar(pageTitle, links)
    haml_tag :div, :id => "title_bar" do

      haml_tag :div, :id => "titlebar_left" do
        haml_tag :div, :class => "breadcrumb" do
          haml_concat(render_navigation  :context => :ems, :renderer => :breadcrumbs, :join_with => " &gt; ")
        end
        haml_tag :h2, :id => "page_title" do
          haml_concat(pageTitle)
        end
      end

      if links
        haml_tag :div, :id => "titlebar_right" do
          haml_tag :div, :class => "action_items" do
            links.each do |link|
              haml_tag :span, :class => "action_item" do
                haml_tag :a, :href =>link["url"] do
                  haml_concat(link["title"])
                end
              end
            end
          end
        end
      end

    end
  end

  #  Content wrappers
    def main_content(title)
      haml_tag :div, :id => "main_content_wrapper" do
        haml_tag :div, :id=>"main_content" do
          yield
        end
      end
    end


    def side_content
      haml_tag :div, :id => "sidebar" do
        haml_tag :div, :class=> "sidebar_section" do
          yield
        end
      end
    end

    def panel(title)
      haml_tag :div, :class => "panel" do
        haml_tag :h3, :class => "top" do
          haml_concat(title)
        end
        haml_tag :div, :class => "panel_contents" do
          haml_tag :div, :class => "attributes_table featured_content" do
            yield
          end
        end
      end
    end

  # Tables
    def feature_table(headings)
      haml_tag :table do
        # Make the header
        haml_tag :thead do
          haml_tag :tr do
            headings.each do |h|
              haml_tag :th do
                haml_concat(h)
              end
            end
          end
        end
        # Make content
        haml_tag :tbody do
          yield
        end
      end
    end

    def index_table(headings)
      haml_tag :table,  :class=>"index_table", :paginator=>"true" do
        # Make the header
        haml_tag :thead do
          haml_tag :tr do
            headings.each do |h|
              haml_tag :th do
                haml_concat(h)
              end
            end
          end
        end
        # Make content
        haml_tag :tbody do
          yield
        end
      end
    end

  end
end
