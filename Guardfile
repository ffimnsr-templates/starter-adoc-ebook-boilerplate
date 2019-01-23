require "asciidoctor"

guard "shell" do
  watch(/^[a-zA-Z0-9]+\.adoc$/) {|m|
    `make html`
  }
end

guard "livereload" do
  watch(%r{^.+\.(css|js|html)$})
end
