Before do
  # Actions before each step execution
end

After do
  # Actions after each scenario execution
end

at_exit do
  # Actions after all scenarios execution (the end of entire execution)
  fecha, hora = Time.now.strftime('%Y-%m-%d--%H-%M-%S').split("--")
  #@browser.close
  if File.exist? "test/report/reporte.html"
    html_content = IO.read("test/report/reporte.html")
    html_content.gsub!("<h1>Cucumber Features</h1>","<h1><span>MiArgentina API Gateway:</span> #{$report_name} <br>Realizado el día: #{fecha} a las: #{hora}</br></h1>")
    IO.write("test/report/MiArgentina_#{$report_name}_#{fecha}-#{hora}.html",html_content)
    File.delete("test/report/reporte.html")
  end
end